package com.expense;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestDB {
    public static void main(String[] args) {

        try {
            String url = "jdbc:postgresql://127.0.0.1:5432/expense_db";
            String user = "postgres";
            String password = "Dhuyu@2005";

            Class.forName("org.postgresql.Driver");

            Connection con = DriverManager.getConnection(url, user, password);

            if (con != null) {
                System.out.println("SUCCESS: Connected to DB");
            } else {
                System.out.println("FAILED: Connection is null");
            }

        } catch (Exception e) {
            System.out.println("ERROR:");
            e.printStackTrace();
        }
    }
}