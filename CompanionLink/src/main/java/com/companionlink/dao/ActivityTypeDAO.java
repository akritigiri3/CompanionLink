package com.companionlink.dao;

import com.companionlink.config.DBConnection;
import com.companionlink.model.ActivityType;
import java.sql.*;
import java.util.*;

public class ActivityTypeDAO {
    public List<ActivityType> findAll(boolean activeOnly) {
        List<ActivityType> l = new ArrayList<>();
        String sql = "SELECT activity_type_id AS id, activity_name AS name, description, is_active AS active FROM activity_types" +
                (activeOnly ? " WHERE is_active=TRUE" : "") + " ORDER BY activity_name";
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(sql); ResultSet r = p.executeQuery()) {
            while (r.next()) {
                ActivityType a = new ActivityType();
                a.setId(r.getInt("id"));
                a.setName(r.getString("name"));
                a.setDescription(r.getString("description"));
                a.setActive(r.getBoolean("active"));
                l.add(a);
            }
            return l;
        } catch (SQLException e) {
            throw new DaoException("List activities failed", e);
        }
    }

    public void create(ActivityType a) {
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement("INSERT INTO activity_types(activity_name,description,is_active) VALUES(?,?,TRUE)")) {
            p.setString(1, a.getName());
            p.setString(2, a.getDescription());
            p.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Create activity failed", e);
        }
    }

    public void update(ActivityType a) {
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement("UPDATE activity_types SET activity_name=?,description=?,is_active=? WHERE activity_type_id=?")) {
            p.setString(1, a.getName());
            p.setString(2, a.getDescription());
            p.setBoolean(3, a.isActive());
            p.setInt(4, a.getId());
            p.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Update activity failed", e);
        }
    }

    public void deactivate(int id) {
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement("UPDATE activity_types SET is_active=FALSE WHERE activity_type_id=?")) {
            p.setInt(1, id);
            p.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Deactivate activity failed", e);
        }
    }
}
