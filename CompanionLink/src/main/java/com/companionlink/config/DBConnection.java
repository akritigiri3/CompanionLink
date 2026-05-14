package com.companionlink.config;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBConnection {

  private static final String URL =
          "jdbc:mysql://127.0.0.1:3306/companionlink_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

  private static final String USER = "root";
  private static final String PASSWORD = "1234";

  private DBConnection() {}

  static {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      throw new ExceptionInInitializerError(e);
    }
  }

  public static Connection getConnection() {
    // Try JNDI first
    try {
      Context initContext = new InitialContext();
      Context envContext = (Context) initContext.lookup("java:/comp/env");

      DataSource ds =
              (DataSource) envContext.lookup("jdbc/CompanionLinkDB");

      return ds.getConnection();

    } catch (Exception e) {

      System.out.println("JNDI failed, using DriverManager...");

      // Fallback to DriverManager
      try {
        return DriverManager.getConnection(URL, USER, PASSWORD);
      } catch (SQLException ex) {
        ex.printStackTrace();
        return null;
      }
    }
  }
}