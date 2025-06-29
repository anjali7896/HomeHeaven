package com.example.servlet;

import com.example.utils.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT fullname FROM users WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Set the username (fullname) in session
                HttpSession session = request.getSession();
                session.setAttribute("username", rs.getString("fullname"));

                // Redirect to addhome1.jsp (no ownerId is passed anymore)
                response.sendRedirect(request.getContextPath() + "/addhome1.jsp");
            } else {
                response.sendRedirect("login1.jsp?error=1");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login1.jsp?error=db");
        }
    }
}
