package com.example.servlet;

import com.example.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/UpdateHomeServlet")
public class UpdateHomeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String propertyType = request.getParameter("propertyType");
        double price = Double.parseDouble(request.getParameter("price"));
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE homes1 SET property_type = ?, price = ?, location = ?, description = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, propertyType);
            ps.setDouble(2, price);
            ps.setString(3, location);
            ps.setString(4, description);
            ps.setInt(5, id);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("HomeListServlet");  // Redirect back to home list page
            } else {
                response.getWriter().println("Update failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
