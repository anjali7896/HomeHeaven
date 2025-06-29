package com.example.servlet;

import com.example.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get form data
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String dob = request.getParameter("dob");
        String aadhar = request.getParameter("aadhar");
        String phone = request.getParameter("phone");

        if (!password.equals(confirmPassword)) {
            out.println("<script>alert('Passwords do not match!');window.location='signup.jsp';</script>");
            return;
        }

        try {
            // Get connection from DBConnection utility
            Connection conn = DBConnection.getConnection();

            // Check if email already exists in the database
            String checkEmailSQL = "SELECT * FROM users WHERE email = ?";
            PreparedStatement checkEmailStmt = conn.prepareStatement(checkEmailSQL);
            checkEmailStmt.setString(1, email);
            ResultSet emailCheckResult = checkEmailStmt.executeQuery();

            if (emailCheckResult.next()) {
                out.println("<script>alert('Email already exists. Please use another email.');window.location='signup.jsp';</script>");
                return;
            }

            // Insert the new user into the database
            String sql = "INSERT INTO users (fullname, email, password, dob, aadhar, phone) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullname);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, dob);
            stmt.setString(5, aadhar);
            stmt.setString(6, phone);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Successfully registered
                out.println("<script>alert('Registration successful! Please log in.');window.location='login1.jsp';</script>");
            } else {
                // Registration failed
                out.println("<script>alert('Registration failed. Please try again.');window.location='signup.jsp';</script>");
            }

            // Close resources
            stmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<script>alert('Database error occurred. Please try again later.');window.location='signup.jsp';</script>");
        }
    }
}
