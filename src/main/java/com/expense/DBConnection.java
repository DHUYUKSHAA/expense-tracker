package com.expense;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            String url = "jdbc:postgresql://127.0.0.1:5432/expense_db";
            String user = "postgres";
            String password = "Dhuyu@2005";

            // Load driver
            Class.forName("org.postgresql.Driver");

            // Connect
            con = DriverManager.getConnection(url, user, password);

            if (con != null) {
                System.out.println("Database connected successfully");
            }

        } catch (Exception e) {
            System.out.println("Database connection failed");
            e.printStackTrace();
        }

        return con;
    }
}