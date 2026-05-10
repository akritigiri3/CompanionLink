package com.companionlink.dao;

import com.companionlink.config.DBConnection;
import com.companionlink.model.User;
import com.companionlink.util.PasswordUtils;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class UserDAO {
    private static final String USER_DETAILS_SELECT = "SELECT * FROM v_user_details";

    public boolean createUser(User u, String pass) {
        String insertUser = "INSERT INTO users(role_id,status_id,full_name,email,phone,date_of_birth,password_hash,address) " +
                "VALUES((SELECT role_id FROM roles WHERE role_name=?),(SELECT status_id FROM account_statuses WHERE status_name=?),?,?,?,?,?,?)";
        try (Connection c = DBConnection.getConnection()) {
            c.setAutoCommit(false);
            try (PreparedStatement p = c.prepareStatement(insertUser, Statement.RETURN_GENERATED_KEYS)) {
                String status = "VOLUNTEER".equalsIgnoreCase(u.getRole()) ? "PENDING" : "ACTIVE";
                p.setString(1, u.getRole());
                p.setString(2, status);
                p.setString(3, u.getFullName());
                p.setString(4, u.getEmail());
                p.setString(5, u.getPhone());
                p.setDate(6, Date.valueOf(u.getDateOfBirth()));
                p.setString(7, PasswordUtils.hashPassword(pass));
                p.setString(8, u.getAddress());
                if (p.executeUpdate() != 1) throw new SQLException("User insert failed");

                try (ResultSet keys = p.getGeneratedKeys()) {
                    if (!keys.next()) throw new SQLException("Generated user id missing");
                    int userId = keys.getInt(1);
                    if ("SENIOR".equalsIgnoreCase(u.getRole())) {
                        insertSeniorProfile(c, userId, u);
                    } else if ("VOLUNTEER".equalsIgnoreCase(u.getRole())) {
                        insertVolunteerProfile(c, userId, u);
                        replaceVolunteerSkills(c, userId, u.getSkills());
                    }
                }
            }
            c.commit();
            return true;
        } catch (SQLException e) {
            throw new DaoException("Create user failed", e);
        }
    }

    private void insertSeniorProfile(Connection c, int userId, User u) throws SQLException {
        String[] emergency = splitEmergency(u.getEmergencyContact());
        try (PreparedStatement p = c.prepareStatement("INSERT INTO senior_profiles(senior_id,health_notes,emergency_contact_name,emergency_contact_phone,emergency_contact_relation) VALUES(?,?,?,?,?)")) {
            p.setInt(1, userId);
            p.setString(2, u.getHealthNotes());
            p.setString(3, emergency[0]);
            p.setString(4, emergency[1]);
            p.setString(5, emergency[2]);
            p.executeUpdate();
        }
    }

    private void insertVolunteerProfile(Connection c, int userId, User u) throws SQLException {
        try (PreparedStatement p = c.prepareStatement("INSERT INTO volunteer_profiles(volunteer_id,bio,availability) VALUES(?,?,?)")) {
            p.setInt(1, userId);
            p.setString(2, u.getBio());
            p.setString(3, u.getAvailability());
            p.executeUpdate();
        }
    }

    public User findByEmail(String email) {
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(USER_DETAILS_SELECT + " WHERE email=?")) {
            p.setString(1, email);
            try (ResultSet r = p.executeQuery()) {
                return r.next() ? map(r) : null;
            }
        } catch (SQLException e) {
            throw new DaoException("Find user failed", e);
        }
    }

    public User findById(int id) {
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(USER_DETAILS_SELECT + " WHERE id=?")) {
            p.setInt(1, id);
            try (ResultSet r = p.executeQuery()) {
                return r.next() ? map(r) : null;
            }
        } catch (SQLException e) {
            throw new DaoException("Find user failed", e);
        }
    }

    public boolean emailExists(String v) { return exists("email", v); }
    public boolean phoneExists(String v) { return exists("phone", v); }

    private boolean exists(String col, String v) {
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement("SELECT user_id FROM users WHERE " + col + "=?")) {
            p.setString(1, v);
            try (ResultSet r = p.executeQuery()) {
                return r.next();
            }
        } catch (SQLException e) {
            throw new DaoException("Duplicate check failed", e);
        }
    }

    public List<User> findAll() {
        List<User> l = new ArrayList<>();
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(USER_DETAILS_SELECT + " ORDER BY role,status,full_name"); ResultSet r = p.executeQuery()) {
            while (r.next()) l.add(map(r));
            return l;
        } catch (SQLException e) {
            throw new DaoException("List users failed", e);
        }
    }

    public List<User> searchApprovedVolunteers(String k) {
        List<User> l = new ArrayList<>();
        String sql = USER_DETAILS_SELECT + " WHERE role='VOLUNTEER' AND status='ACTIVE'";
        if (k != null && !k.isBlank()) sql += " AND (full_name LIKE ? OR skills LIKE ? OR availability LIKE ? OR bio LIKE ?)";
        sql += " ORDER BY average_rating DESC, full_name";
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(sql)) {
            if (k != null && !k.isBlank()) {
                String like = "%" + k.trim() + "%";
                for (int i = 1; i <= 4; i++) p.setString(i, like);
            }
            try (ResultSet r = p.executeQuery()) {
                while (r.next()) l.add(map(r));
            }
            return l;
        } catch (SQLException e) {
            throw new DaoException("Search volunteers failed", e);
        }
    }

    public void updateStatus(int id, String status) {
        String sql = "UPDATE users SET status_id=(SELECT status_id FROM account_statuses WHERE status_name=?) WHERE user_id=?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, status);
            p.setInt(2, id);
            p.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Status update failed", e);
        }
    }

    public void updateProfile(User u) {
        try (Connection c = DBConnection.getConnection()) {
            c.setAutoCommit(false);
            try (PreparedStatement p = c.prepareStatement("UPDATE users SET full_name=?,phone=?,address=? WHERE user_id=?")) {
                p.setString(1, u.getFullName());
                p.setString(2, u.getPhone());
                p.setString(3, u.getAddress());
                p.setInt(4, u.getId());
                p.executeUpdate();
            }
            if ("SENIOR".equalsIgnoreCase(u.getRole())) {
                String[] emergency = splitEmergency(u.getEmergencyContact());
                try (PreparedStatement p = c.prepareStatement("UPDATE senior_profiles SET health_notes=?,emergency_contact_name=?,emergency_contact_phone=?,emergency_contact_relation=? WHERE senior_id=?")) {
                    p.setString(1, u.getHealthNotes());
                    p.setString(2, emergency[0]);
                    p.setString(3, emergency[1]);
                    p.setString(4, emergency[2]);
                    p.setInt(5, u.getId());
                    p.executeUpdate();
                }
            } else if ("VOLUNTEER".equalsIgnoreCase(u.getRole())) {
                try (PreparedStatement p = c.prepareStatement("UPDATE volunteer_profiles SET bio=?,availability=? WHERE volunteer_id=?")) {
                    p.setString(1, u.getBio());
                    p.setString(2, u.getAvailability());
                    p.setInt(3, u.getId());
                    p.executeUpdate();
                }
                replaceVolunteerSkills(c, u.getId(), u.getSkills());
            }
            c.commit();
        } catch (SQLException e) {
            throw new DaoException("Profile update failed", e);
        }
    }

    private void replaceVolunteerSkills(Connection c, int volunteerId, String skillText) throws SQLException {
        try (PreparedStatement p = c.prepareStatement("DELETE FROM volunteer_skills WHERE volunteer_id=?")) {
            p.setInt(1, volunteerId);
            p.executeUpdate();
        }
        if (skillText == null || skillText.isBlank()) return;
        for (String raw : skillText.split(",")) {
            String skill = raw.trim();
            if (skill.isEmpty()) continue;
            int skillId;
            try (PreparedStatement p = c.prepareStatement("INSERT INTO skills(skill_name) VALUES(?) ON DUPLICATE KEY UPDATE skill_name=skill_name", Statement.RETURN_GENERATED_KEYS)) {
                p.setString(1, skill);
                p.executeUpdate();
            }
            try (PreparedStatement p = c.prepareStatement("SELECT skill_id FROM skills WHERE skill_name=?")) {
                p.setString(1, skill);
                try (ResultSet r = p.executeQuery()) {
                    if (!r.next()) continue;
                    skillId = r.getInt(1);
                }
            }
            try (PreparedStatement p = c.prepareStatement("INSERT IGNORE INTO volunteer_skills(volunteer_id,skill_id) VALUES(?,?)")) {
                p.setInt(1, volunteerId);
                p.setInt(2, skillId);
                p.executeUpdate();
            }
        }
    }

    private String[] splitEmergency(String value) {
        String[] out = { null, null, null };
        if (value == null || value.isBlank()) return out;
        String[] parts = value.split("-");
        for (int i = 0; i < Math.min(parts.length, 3); i++) out[i] = parts[i].trim();
        if (parts.length == 1) out[0] = value.trim();
        return out;
    }

    public void updatePassword(int id, String pass) {
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement("UPDATE users SET password_hash=? WHERE user_id=?")) {
            p.setString(1, PasswordUtils.hashPassword(pass));
            p.setInt(2, id);
            p.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Password update failed", e);
        }
    }

    static User map(ResultSet r) throws SQLException {
        User u = new User();
        u.setId(r.getInt("id"));
        u.setFullName(r.getString("full_name"));
        u.setEmail(r.getString("email"));
        u.setPhone(r.getString("phone"));
        Date d = r.getDate("date_of_birth");
        if (d != null) u.setDateOfBirth(d.toLocalDate());
        u.setPasswordHash(r.getString("password_hash"));
        u.setRole(r.getString("role"));
        u.setStatus(r.getString("status"));
        u.setAddress(r.getString("address"));
        u.setHealthNotes(r.getString("health_notes"));
        u.setEmergencyContact(r.getString("emergency_contact"));
        u.setBio(r.getString("bio"));
        u.setSkills(r.getString("skills"));
        u.setAvailability(r.getString("availability"));
        u.setAverageRating(r.getDouble("average_rating"));
        Timestamp t = r.getTimestamp("created_at");
        if (t != null) u.setCreatedAt(t.toLocalDateTime());
        return u;
    }
}
