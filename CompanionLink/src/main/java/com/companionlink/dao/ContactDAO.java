package com.companionlink.dao;

import com.companionlink.config.DBConnection;
import com.companionlink.model.ContactEnquiry;
import java.sql.*;
import java.util.*;

public class ContactDAO {
    public void create(ContactEnquiry e) {
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement("INSERT INTO contact_enquiries(enquiry_status_id,name,email,message) VALUES((SELECT enquiry_status_id FROM enquiry_statuses WHERE status_name='NEW'),?,?,?)")) {
            p.setString(1, e.getName());
            p.setString(2, e.getEmail());
            p.setString(3, e.getMessage());
            p.executeUpdate();
        } catch (SQLException ex) {
            throw new DaoException("Create enquiry failed", ex);
        }
    }

    public List<ContactEnquiry> findAll() {
        List<ContactEnquiry> l = new ArrayList<>();
        String sql = "SELECT ce.enquiry_id AS id, ce.name, ce.email, ce.message, es.status_name AS status, ce.created_at " +
                "FROM contact_enquiries ce JOIN enquiry_statuses es ON ce.enquiry_status_id=es.enquiry_status_id ORDER BY ce.created_at DESC";
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement(sql); ResultSet r = p.executeQuery()) {
            while (r.next()) {
                ContactEnquiry e = new ContactEnquiry();
                e.setId(r.getInt("id"));
                e.setName(r.getString("name"));
                e.setEmail(r.getString("email"));
                e.setMessage(r.getString("message"));
                e.setStatus(r.getString("status"));
                e.setCreatedAt(r.getTimestamp("created_at").toLocalDateTime());
                l.add(e);
            }
            return l;
        } catch (SQLException ex) {
            throw new DaoException("List enquiries failed", ex);
        }
    }
}
