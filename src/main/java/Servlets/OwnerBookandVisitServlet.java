package Servlets;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class OwnerBookandVisitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get property ID from request
        String propertyIdStr = req.getParameter("propertyId");
        if (propertyIdStr == null || propertyIdStr.isEmpty()) {
            resp.sendRedirect("OwnerDashboard.jsp");
            return;
        }

        int propertyId = Integer.parseInt(propertyIdStr);

        try (Connection conn = DBConnection.getConnection()) {

            // Fetch property details
            String propertyQuery = "SELECT * FROM properties WHERE id = ?";
            PreparedStatement psProperty = conn.prepareStatement(propertyQuery);
            psProperty.setInt(1, propertyId);
            ResultSet rsProperty = psProperty.executeQuery();

            Map<String, Object> property = new HashMap<>();
            if (rsProperty.next()) {
                property.put("id", rsProperty.getInt("id"));
                property.put("name", rsProperty.getString("name"));
                property.put("property_type", rsProperty.getString("property_type"));
                property.put("address", rsProperty.getString("address"));
                property.put("price", rsProperty.getDouble("price"));
            }

            // Fetch property ratings
            String ratingQuery = "SELECT r.rating, r.comment, u.name AS user_name, r.created_at " +
                                 "FROM property_ratings r " +
                                 "JOIN users u ON r.user_id = u.id " +
                                 "WHERE r.property_id = ? " +
                                 "ORDER BY r.created_at DESC";
            PreparedStatement psRating = conn.prepareStatement(ratingQuery);
            psRating.setInt(1, propertyId);
            ResultSet rsRating = psRating.executeQuery();

            List<Map<String, Object>> ratings = new ArrayList<>();
            while (rsRating.next()) {
                Map<String, Object> r = new HashMap<>();
                r.put("user_name", rsRating.getString("user_name"));
                r.put("rating", rsRating.getInt("rating"));
                r.put("comment", rsRating.getString("comment"));
                r.put("created_at", rsRating.getTimestamp("created_at"));
                ratings.add(r);
            }

            // Fetch visit bookings
            String visitQuery = "SELECT name, email, phone, visit_time, created_at " +
                                "FROM property_visits " +
                                "WHERE property_id = ? " +
                                "ORDER BY created_at DESC";
            PreparedStatement psVisit = conn.prepareStatement(visitQuery);
            psVisit.setInt(1, propertyId);
            ResultSet rsVisit = psVisit.executeQuery();

            List<Map<String, Object>> visits = new ArrayList<>();
            while (rsVisit.next()) {
                Map<String, Object> v = new HashMap<>();
                v.put("name", rsVisit.getString("name"));
                v.put("email", rsVisit.getString("email"));
                v.put("phone", rsVisit.getString("phone"));
                v.put("visit_time", rsVisit.getString("visit_time"));
                v.put("created_at", rsVisit.getTimestamp("created_at"));
                visits.add(v);
            }

            // Set as request attributes
            req.setAttribute("property", property);
            req.setAttribute("ratings", ratings);
            req.setAttribute("visits", visits);

            // Forward to JSP for display
            RequestDispatcher rd = req.getRequestDispatcher("OwnerViewProperty.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
