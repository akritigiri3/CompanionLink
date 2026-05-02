package com.companionlink.util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        try {
            // Try JNDI (Tomcat)
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/CompanionLinkDB");
            return ds.getConnection();

        } catch (Exception e) {
            System.out.println("JNDI failed, using DriverManager...");

            try {
                return DriverManager.getConnection(
                        "jdbc:mysql://127.0.0.1:3306/companionlink_db",
                        "root",
                        "1234"
                );
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
}