package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeavenmodel.Property;
import HomeHeaven.util.DBConnection;
import java.util.Arrays;

public class PropertyDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("FilterProperties.jsp");
            return;
        }

        int id = Integer.parseInt(idStr);

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM properties WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Property p = new Property();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPropertyCategory(rs.getString("property_category"));
                p.setPropertyType(rs.getString("property_type"));
                p.setDescription(rs.getString("description"));
                p.setAddress(rs.getString("address"));
                p.setPrice(rs.getDouble("price"));
                p.setRoomType(rs.getString("room_type"));
                p.setBhkType(rs.getString("bhk_type"));
                p.setServices(rs.getString("services"));
                p.setMealsPerDay(rs.getString("meals_per_day"));
                p.setFoodType(rs.getString("food_type"));
                p.setTiffinPlan(rs.getString("tiffin_plan"));
                String imagesStr = rs.getString("images");
                if (imagesStr != null && !imagesStr.isEmpty()) {
                    p.setImages(Arrays.asList(imagesStr.split(",")));
                }

                request.setAttribute("property", p);
                RequestDispatcher rd = request.getRequestDispatcher("PropertyDetails.jsp");
                rd.forward(request, response);

            } else {
                // Property ID not found
                response.sendRedirect("FilterProperties.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
