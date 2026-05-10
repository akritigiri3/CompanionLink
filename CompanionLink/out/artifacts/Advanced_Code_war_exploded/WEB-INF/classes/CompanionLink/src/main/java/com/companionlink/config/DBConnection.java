package com.companionlink.config;
import java.sql.*;
public final class DBConnection {
  private static final String URL="jdbc:mysql://127.0.0.1:3306/companion_link?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
  private DBConnection(){}
  static { try { Class.forName("com.mysql.cj.jdbc.Driver"); } catch (ClassNotFoundException e) { throw new ExceptionInInitializerError(e); } }
  public static Connection getConnection() throws SQLException {
    String url=System.getenv().getOrDefault("DB_URL",URL);
    String user=System.getenv().getOrDefault("DB_USER","root");
    String pass=System.getenv().getOrDefault("DB_PASSWORD","1234");
    return DriverManager.getConnection(url,user,pass);
  }
}
