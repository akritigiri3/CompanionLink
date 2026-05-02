package com.companionlink.dao;

import com.companionlink.config.DBConnection;
import com.companionlink.model.CompanionRequest;
import java.sql.*;
import java.util.*;

public class RequestDAO {
    private String base() {
        return "SELECT r.request_id AS id, r.senior_id, r.activity_type_id, r.preferred_datetime, r.location_area, r.notes, r.created_at, " +
                "rs.status_name AS status, a.activity_name AS activity_name, u.full_name AS senior_name " +
                "FROM companion_requests r " +
                "JOIN request_statuses rs ON r.request_status_id=rs.request_status_id " +
                "JOIN activity_types a ON r.activity_type_id=a.activity_type_id " +
                "JOIN users u ON r.senior_id=u.user_id";
    }

    public void create(CompanionRequest r) {
        String q = "INSERT INTO companion_requests(senior_id,activity_type_id,request_status_id,preferred_datetime,location_area,notes) " +
                "VALUES(?, ?, (SELECT request_status_id FROM request_statuses WHERE status_name='OPEN'), ?, ?, ?)";
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(q)) {
            p.setInt(1, r.getSeniorId());
            p.setInt(2, r.getActivityTypeId());
            p.setTimestamp(3, Timestamp.valueOf(r.getPreferredDateTime()));
            p.setString(4, r.getLocationArea());
            p.setString(5, r.getNotes());
            p.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Create request failed", e);
        }
    }

    public List<CompanionRequest> findBySenior(int id) {
        return list(base() + " WHERE r.senior_id=? ORDER BY r.preferred_datetime DESC", id);
    }

    public List<CompanionRequest> findOpen(String k) {
        String sql = base() + " WHERE rs.status_name='OPEN'";
        List<Object> ps = new ArrayList<>();
        if (k != null && !k.isBlank()) {
            sql += " AND (a.activity_name LIKE ? OR r.location_area LIKE ? OR r.notes LIKE ?)";
            String like = "%" + k.trim() + "%";
            ps.add(like); ps.add(like); ps.add(like);
        }
        return list(sql + " ORDER BY r.preferred_datetime ASC", ps.toArray());
    }

    public List<CompanionRequest> findAll(String status) {
        String sql = base();
        if (status != null && !status.isBlank()) return list(sql + " WHERE rs.status_name=? ORDER BY r.created_at DESC", status);
        return list(sql + " ORDER BY r.created_at DESC");
    }

    public void acceptRequest(int requestId, int volunteerId) {
        String sel = "SELECT senior_id, preferred_datetime FROM companion_requests r " +
                "JOIN request_statuses rs ON r.request_status_id=rs.request_status_id " +
                "WHERE r.request_id=? AND rs.status_name='OPEN' FOR UPDATE";
        try (Connection c = DBConnection.getConnection()) {
            c.setAutoCommit(false);
            try (PreparedStatement p = c.prepareStatement(sel)) {
                p.setInt(1, requestId);
                try (ResultSet r = p.executeQuery()) {
                    if (!r.next()) throw new SQLException("Request not open");
                    Timestamp time = r.getTimestamp("preferred_datetime");
                    try (PreparedStatement u = c.prepareStatement("UPDATE companion_requests SET request_status_id=(SELECT request_status_id FROM request_statuses WHERE status_name='ACCEPTED') WHERE request_id=?");
                         PreparedStatement i = c.prepareStatement("INSERT INTO visits(request_id,volunteer_id,visit_status_id,scheduled_at) VALUES(?, ?, (SELECT visit_status_id FROM visit_statuses WHERE status_name='ACCEPTED'), ?)")) {
                        u.setInt(1, requestId);
                        u.executeUpdate();
                        i.setInt(1, requestId);
                        i.setInt(2, volunteerId);
                        i.setTimestamp(3, time);
                        i.executeUpdate();
                    }
                }
            }
            c.commit();
        } catch (SQLException e) {
            throw new DaoException("Accept request failed", e);
        }
    }

    private List<CompanionRequest> list(String sql, Object... params) {
        List<CompanionRequest> l = new ArrayList<>();
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(sql)) {
            for (int i = 0; i < params.length; i++) p.setObject(i + 1, params[i]);
            try (ResultSet r = p.executeQuery()) {
                while (r.next()) {
                    CompanionRequest x = new CompanionRequest();
                    x.setId(r.getInt("id"));
                    x.setSeniorId(r.getInt("senior_id"));
                    x.setSeniorName(r.getString("senior_name"));
                    x.setActivityTypeId(r.getInt("activity_type_id"));
                    x.setActivityName(r.getString("activity_name"));
                    x.setPreferredDateTime(r.getTimestamp("preferred_datetime").toLocalDateTime());
                    x.setLocationArea(r.getString("location_area"));
                    x.setNotes(r.getString("notes"));
                    x.setStatus(r.getString("status"));
                    x.setCreatedAt(r.getTimestamp("created_at").toLocalDateTime());
                    l.add(x);
                }
            }
            return l;
        } catch (SQLException e) {
            throw new DaoException("List requests failed", e);
        }
    }
}
