package com.companionlink.dao;

import com.companionlink.config.DBConnection;
import com.companionlink.model.Visit;
import java.sql.*;
import java.util.*;

public class VisitDAO {
    private String base() {
        return "SELECT v.visit_id AS id, v.request_id, cr.senior_id, v.volunteer_id, v.scheduled_at, v.actual_duration_minutes, v.volunteer_notes, v.completed_at, " +
                "vs.status_name AS status, s.full_name AS senior_name, vol.full_name AS volunteer_name, a.activity_name AS activity_name, " +
                "rt.stars AS rating_stars, rt.comment AS rating_comment " +
                "FROM visits v " +
                "JOIN companion_requests cr ON v.request_id=cr.request_id " +
                "JOIN users s ON cr.senior_id=s.user_id " +
                "JOIN users vol ON v.volunteer_id=vol.user_id " +
                "JOIN activity_types a ON cr.activity_type_id=a.activity_type_id " +
                "JOIN visit_statuses vs ON v.visit_status_id=vs.visit_status_id " +
                "LEFT JOIN ratings rt ON rt.visit_id=v.visit_id";
    }

    public List<Visit> findBySenior(int id) {
        return list(base() + " WHERE cr.senior_id=? ORDER BY v.scheduled_at DESC", id);
    }

    public List<Visit> findByVolunteer(int id) {
        return list(base() + " WHERE v.volunteer_id=? ORDER BY v.scheduled_at DESC", id);
    }

    public List<Visit> findAll(String status) {
        if (status != null && !status.isBlank()) return list(base() + " WHERE vs.status_name=? ORDER BY v.scheduled_at DESC", status);
        return list(base() + " ORDER BY v.scheduled_at DESC");
    }

    public Visit findById(int id) {
        List<Visit> l = list(base() + " WHERE v.visit_id=?", id);
        return l.isEmpty() ? null : l.get(0);
    }

    public void completeVisit(int visitId, int volunteerId, int duration, String notes) {
        try (Connection c = DBConnection.getConnection()) {
            c.setAutoCommit(false);
            try (PreparedStatement p = c.prepareStatement("UPDATE visits SET visit_status_id=(SELECT visit_status_id FROM visit_statuses WHERE status_name='COMPLETED'), actual_duration_minutes=?, volunteer_notes=?, completed_at=NOW() WHERE visit_id=? AND volunteer_id=?")) {
                p.setInt(1, duration);
                p.setString(2, notes);
                p.setInt(3, visitId);
                p.setInt(4, volunteerId);
                if (p.executeUpdate() == 0) throw new SQLException("No visit updated");
            }
            try (PreparedStatement p = c.prepareStatement("UPDATE companion_requests SET request_status_id=(SELECT request_status_id FROM request_statuses WHERE status_name='COMPLETED') WHERE request_id=(SELECT request_id FROM visits WHERE visit_id=?)")) {
                p.setInt(1, visitId);
                p.executeUpdate();
            }
            c.commit();
        } catch (SQLException e) {
            throw new DaoException("Complete visit failed", e);
        }
    }

    private List<Visit> list(String sql, Object... params) {
        List<Visit> l = new ArrayList<>();
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(sql)) {
            for (int i = 0; i < params.length; i++) p.setObject(i + 1, params[i]);
            try (ResultSet r = p.executeQuery()) {
                while (r.next()) {
                    Visit v = new Visit();
                    v.setId(r.getInt("id"));
                    v.setRequestId(r.getInt("request_id"));
                    v.setSeniorId(r.getInt("senior_id"));
                    v.setSeniorName(r.getString("senior_name"));
                    v.setVolunteerId(r.getInt("volunteer_id"));
                    v.setVolunteerName(r.getString("volunteer_name"));
                    v.setActivityName(r.getString("activity_name"));
                    v.setScheduledAt(r.getTimestamp("scheduled_at").toLocalDateTime());
                    v.setStatus(r.getString("status"));
                    int dur = r.getInt("actual_duration_minutes");
                    if (!r.wasNull()) v.setActualDurationMinutes(dur);
                    v.setVolunteerNotes(r.getString("volunteer_notes"));
                    Timestamp ct = r.getTimestamp("completed_at");
                    if (ct != null) v.setCompletedAt(ct.toLocalDateTime());
                    int stars = r.getInt("rating_stars");
                    if (!r.wasNull()) v.setRatingStars(stars);
                    v.setRatingComment(r.getString("rating_comment"));
                    l.add(v);
                }
            }
            return l;
        } catch (SQLException e) {
            throw new DaoException("List visits failed", e);
        }
    }
}
