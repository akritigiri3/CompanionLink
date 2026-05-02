package com.companionlink.dao;

import com.companionlink.config.DBConnection;
import com.companionlink.model.Rating;
import java.sql.*;

public class RatingDAO {
    public void create(Rating r) {
        try (Connection c = DBConnection.getConnection(); PreparedStatement p = c.prepareStatement("INSERT INTO ratings(visit_id,stars,comment) VALUES(?,?,?)")) {
            p.setInt(1, r.getVisitId());
            p.setInt(2, r.getStars());
            p.setString(3, r.getComment());
            p.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Create rating failed", e);
        }
    }
}
