package com.example.servlet;

import com.example.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM homes1 WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int rowsDeleted = ps.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("HomeListServlet");  // Redirect to the home list page after deletion
            } else {
                response.getWriter().println("Delete failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
