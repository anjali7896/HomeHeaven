package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class BookVisitServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int propertyId = Integer.parseInt(req.getParameter("propertyId"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String visitTime = req.getParameter("visitTime");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO property_bookings (property_id, name, email, phone, visit_time) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyId);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, visitTime);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("PropertyDetailsServlet?id=" + propertyId);
    }
}
