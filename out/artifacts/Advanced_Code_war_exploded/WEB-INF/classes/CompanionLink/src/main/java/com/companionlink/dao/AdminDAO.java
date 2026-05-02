package com.companionlink.dao;

import com.companionlink.config.DBConnection;
import com.companionlink.model.AnalyticsSummary;
import java.sql.*;
import java.util.*;

public class AdminDAO {
    public AnalyticsSummary buildSummary() {
        AnalyticsSummary s = new AnalyticsSummary();
        try (Connection c = DBConnection.getConnection()) {
            s.setTotalUsers(count(c, "SELECT COUNT(*) FROM users"));
            s.setTotalSeniors(count(c, "SELECT COUNT(*) FROM users u JOIN roles r ON u.role_id=r.role_id WHERE r.role_name='SENIOR'"));
            s.setTotalVolunteers(count(c, "SELECT COUNT(*) FROM users u JOIN roles r ON u.role_id=r.role_id WHERE r.role_name='VOLUNTEER'"));
            s.setPendingVolunteers(count(c, "SELECT COUNT(*) FROM users u JOIN roles r ON u.role_id=r.role_id JOIN account_statuses s ON u.status_id=s.status_id WHERE r.role_name='VOLUNTEER' AND s.status_name='PENDING'"));
            s.setOpenRequests(count(c, "SELECT COUNT(*) FROM companion_requests cr JOIN request_statuses rs ON cr.request_status_id=rs.request_status_id WHERE rs.status_name='OPEN'"));
            s.setCompletedVisitsThisMonth(count(c, "SELECT COUNT(*) FROM visits v JOIN visit_statuses vs ON v.visit_status_id=vs.visit_status_id WHERE vs.status_name='COMPLETED' AND MONTH(v.completed_at)=MONTH(CURRENT_DATE()) AND YEAR(v.completed_at)=YEAR(CURRENT_DATE())"));
            s.setTopVolunteers(list(c, "SELECT CONCAT(volunteer_name,' - ',FORMAT(average_rating,1),' stars') label FROM v_volunteer_average_ratings ORDER BY average_rating DESC, volunteer_name LIMIT 5"));
            s.setPopularActivities(list(c, "SELECT CONCAT(a.activity_name,' - ',COUNT(r.request_id),' requests') label FROM activity_types a LEFT JOIN companion_requests r ON a.activity_type_id=r.activity_type_id GROUP BY a.activity_type_id,a.activity_name ORDER BY COUNT(r.request_id) DESC,a.activity_name LIMIT 5"));
            return s;
        } catch (SQLException e) {
            throw new DaoException("Analytics failed", e);
        }
    }

    private int count(Connection c, String sql) throws SQLException {
        try (PreparedStatement p = c.prepareStatement(sql); ResultSet r = p.executeQuery()) {
            r.next();
            return r.getInt(1);
        }
    }

    private List<String> list(Connection c, String sql) throws SQLException {
        List<String> l = new ArrayList<>();
        try (PreparedStatement p = c.prepareStatement(sql); ResultSet r = p.executeQuery()) {
            while (r.next()) l.add(r.getString("label"));
            return l;
        }
    }
}
