package Servlets;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import HomeHeavenmodel.Property;
import HomeHeaven.util.DBConnection;

public class PropertyListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Property> properties = new ArrayList<>();

        // Filters from UI
        String typeFilter = req.getParameter("type");
        String areaFilter = req.getParameter("area");
        String maxPriceStr = req.getParameter("maxPrice");

        if (typeFilter != null) typeFilter = typeFilter.trim();
        if (areaFilter != null) areaFilter = areaFilter.trim();

        Double maxPrice = null;
        if(maxPriceStr != null && !maxPriceStr.isEmpty()) {
            try { 
                maxPrice = Double.parseDouble(maxPriceStr); 
            } catch (NumberFormatException ex) { 
                maxPrice = null; 
            }
        }

        try (Connection conn = DBConnection.getConnection()) {

            // Base Query
            StringBuilder sql = new StringBuilder("SELECT * FROM properties WHERE 1=1");

            if (typeFilter != null && !typeFilter.isEmpty()) {
                sql.append(" AND property_type = ?");
            }
            if (areaFilter != null && !areaFilter.isEmpty()) {
                sql.append(" AND address LIKE ?");
            }
            if (maxPrice != null) {
                sql.append(" AND price <= ?");
            }

            sql.append(" ORDER BY id DESC");

            PreparedStatement ps = conn.prepareStatement(sql.toString());

            int index = 1;
            if (typeFilter != null && !typeFilter.isEmpty()) {
                ps.setString(index++, typeFilter);
            }
            if (areaFilter != null && !areaFilter.isEmpty()) {
                ps.setString(index++, "%" + areaFilter + "%");
            }
            if (maxPrice != null) {
                ps.setDouble(index++, maxPrice);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Property p = new Property();

                // Common fields
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPropertyCategory(rs.getString("property_category"));
                p.setPropertyType(rs.getString("property_type"));
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

                // Hostel/PG/Flat fields
                if ("Hostel".equalsIgnoreCase(p.getPropertyType()) ||
                    "PG".equalsIgnoreCase(p.getPropertyType()) ||
                    "Flat".equalsIgnoreCase(p.getPropertyType())) {
                    p.setRoomType(rs.getString("room_type"));
                    p.setBhkType(rs.getString("bhk_type"));
                    p.setServices(rs.getString("services"));
                }

                // Mess fields
                if ("Mess".equalsIgnoreCase(p.getPropertyType())) {
                    p.setMealsPerDay(rs.getString("meals_per_day"));
                }

                // Tiffin fields
                if ("Tiffin".equalsIgnoreCase(p.getPropertyType())) {
                    p.setFoodType(rs.getString("food_type"));
                    p.setTiffinPlan(rs.getString("tiffin_plan"));
                }

                properties.add(p);
            }

            // Save list in request
            req.setAttribute("properties", properties);

            // Forward to JSP
            RequestDispatcher rd = req.getRequestDispatcher("FilterProperties.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
