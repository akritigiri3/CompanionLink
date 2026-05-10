package com.companionlink.util;

import com.companionlink.config.DBConnection;

public class TestDB {
    public static void main(String[] args) {

        try {
            if (DBConnection.getConnection() != null) {
                System.out.println("Connection Successful!");
            } else {
                System.out.println("Connection Failed!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
