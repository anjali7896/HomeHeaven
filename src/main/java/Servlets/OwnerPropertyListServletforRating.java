package Servlets;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import HomeHeavenmodel.Property;
import HomeHeaven.util.DBConnection;

public class OwnerPropertyListServletforRating extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get logged-in owner ID from session
        HttpSession session = req.getSession();
        Integer ownerId = (Integer) session.getAttribute("ownerId");

        if (ownerId == null) {
            resp.sendRedirect("OwnerLogin.jsp");
            return;
        }

        List<Property> properties = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT p.*, " +
                         "COALESCE(AVG(r.rating),0) AS avgRating, " +
                         "COUNT(r.id) AS ratingCount " +
                         "FROM properties p " +
                         "LEFT JOIN property_ratings r ON p.id = r.property_id " +
                         "WHERE p.owner_id = ? " +
                         "GROUP BY p.id " +
                         "ORDER BY p.id DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ownerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Property p = new Property();

                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPropertyType(rs.getString("property_type"));
                p.setPropertyCategory(rs.getString("property_category"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setAddress(rs.getString("address"));
                p.setLatitude(rs.getDouble("latitude"));
                p.setLongitude(rs.getDouble("longitude"));

                // Images
                String imagesStr = rs.getString("images");
                if (imagesStr != null && !imagesStr.isEmpty()) {
                    p.setImages(Arrays.asList(imagesStr.split(",")));
                }

                // Hostel/PG/Flat
                if ("Hostel".equalsIgnoreCase(p.getPropertyType()) ||
                    "PG".equalsIgnoreCase(p.getPropertyType()) ||
                    "Flat".equalsIgnoreCase(p.getPropertyType())) {
                    p.setRoomType(rs.getString("room_type"));
                    p.setBhkType(rs.getString("bhk_type"));
                    p.setServices(rs.getString("services"));
                }

                // Mess
                if ("Mess".equalsIgnoreCase(p.getPropertyType())) {
                    p.setMealsPerDay(rs.getString("meals_per_day"));
                }

                // Tiffin
                if ("Tiffin".equalsIgnoreCase(p.getPropertyType())) {
                    p.setFoodType(rs.getString("food_type"));
                    p.setTiffinPlan(rs.getString("tiffin_plan"));
                }

                // Ratings
                p.setAvgRating(rs.getDouble("avgRating"));
                p.setRatingCount(rs.getInt("ratingCount"));

                properties.add(p);
            }

            req.setAttribute("properties", properties);
            RequestDispatcher rd = req.getRequestDispatcher("OwnerPropertyListforRating.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
