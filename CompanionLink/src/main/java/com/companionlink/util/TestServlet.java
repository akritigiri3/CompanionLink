package com.companionlink.util;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import com.companionlink.config.DBConnection;

@WebServlet("/testDB")
public class TestServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Connection conn = DBConnection.getConnection();

        if (conn != null) {
            response.getWriter().println("Connection Successful!");
        } else {
            response.getWriter().println("Connection Failed!");
        }
    }
}