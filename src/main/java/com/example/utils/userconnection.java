package com.example.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class userconnection {


	    private static final String URL = "jdbc:mysql://localhost:3306/houserental";
	    private static final String USER = "root";  // use your MySQL username
	    private static final String PASS = "1234";  // use your MySQL password

	    public static Connection getConnection() throws SQLException {
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver"); // for MySQL 8+
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	        return DriverManager.getConnection(URL, USER, PASS);
	    }
	}



