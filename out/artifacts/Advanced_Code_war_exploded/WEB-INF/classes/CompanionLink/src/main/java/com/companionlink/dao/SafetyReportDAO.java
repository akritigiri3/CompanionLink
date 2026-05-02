package com.companionlink.dao;

import com.companionlink.config.DBConnection;
import com.companionlink.model.SafetyReport;
import java.sql.*;
import java.util.*;

public class SafetyReportDAO {
    public void create(SafetyReport r) {
        String sql = "INSERT INTO safety_reports(senior_id,volunteer_id,report_status_id,description) VALUES(?, ?, (SELECT report_status_id FROM report_statuses WHERE status_name='PENDING'), ?)";
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(sql)) {
            p.setInt(1, r.getSeniorId());
            if (r.getVolunteerId() == null || r.getVolunteerId() == 0) p.setNull(2, Types.INTEGER); else p.setInt(2, r.getVolunteerId());
            p.setString(3, r.getDescription());
            p.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Create report failed", e);
        }
    }

    public List<SafetyReport> findAll(String status) {
        String sql = "SELECT sr.report_id AS id, sr.senior_id, sr.volunteer_id, sr.description, sr.admin_notes, sr.created_at, " +
                "rs.status_name AS status, s.full_name AS senior_name, v.full_name AS volunteer_name " +
                "FROM safety_reports sr " +
                "JOIN report_statuses rs ON sr.report_status_id=rs.report_status_id " +
                "JOIN users s ON sr.senior_id=s.user_id " +
                "LEFT JOIN users v ON sr.volunteer_id=v.user_id";
        if (status != null && !status.isBlank()) sql += " WHERE rs.status_name=?";
        sql += " ORDER BY sr.created_at DESC";
        List<SafetyReport> l = new ArrayList<>();
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(sql)) {
            if (status != null && !status.isBlank()) p.setString(1, status);
            try (ResultSet r = p.executeQuery()) {
                while (r.next()) {
                    SafetyReport x = new SafetyReport();
                    x.setId(r.getInt("id"));
                    x.setSeniorId(r.getInt("senior_id"));
                    x.setSeniorName(r.getString("senior_name"));
                    int vid = r.getInt("volunteer_id");
                    if (!r.wasNull()) x.setVolunteerId(vid);
                    x.setVolunteerName(r.getString("volunteer_name"));
                    x.setDescription(r.getString("description"));
                    x.setStatus(r.getString("status"));
                    x.setAdminNotes(r.getString("admin_notes"));
                    x.setCreatedAt(r.getTimestamp("created_at").toLocalDateTime());
                    l.add(x);
                }
            }
            return l;
        } catch (SQLException e) {
            throw new DaoException("List reports failed", e);
        }
    }

    public void updateStatus(int id, String status, String notes) {
        String sql = "UPDATE safety_reports SET report_status_id=(SELECT report_status_id FROM report_statuses WHERE status_name=?), admin_notes=?, resolved_at=IF(?='CLOSED',NOW(),resolved_at) WHERE report_id=?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, status);
            p.setString(2, notes);
            p.setString(3, status);
            p.setInt(4, id);
            p.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Update report failed", e);
        }
    }
}
