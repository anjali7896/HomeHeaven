package Servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import HomeHeaven.util.DBConnection;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class AddPropertyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            req.setCharacterEncoding("UTF-8");

            // ===== COMMON FIELDS =====
            String propertyType = req.getParameter("propertyType");
            String description = req.getParameter("description");
            String services = req.getParameter("services");
            String address = req.getParameter("address");

            double price = 0;
            try { price = Double.parseDouble(req.getParameter("price")); } 
            catch (Exception e) { price = 0; }

            double latitude = 0;
            try { latitude = Double.parseDouble(req.getParameter("latitude")); } 
            catch (Exception e) { latitude = 0; }

            double longitude = 0;
            try { longitude = Double.parseDouble(req.getParameter("longitude")); } 
            catch (Exception e) { longitude = 0; }

            // ===== HOSTEL / PG =====
            String roomType = req.getParameter("roomType");

            // ===== FLAT =====
            String bhkType = req.getParameter("bhkType");

            // ===== MESS =====
            String foodType = null;
            Integer mealsPerDay = null;
            Integer seatingCapacity = null;

            if ("Mess".equalsIgnoreCase(propertyType)) {
                foodType = req.getParameter("foodType");

                String mealsStr = req.getParameter("mealsPerDay");
                if (mealsStr != null && !mealsStr.isEmpty()) {
                    try { mealsPerDay = Integer.parseInt(mealsStr); } 
                    catch (NumberFormatException e) { mealsPerDay = null; }
                }

                String seatStr = req.getParameter("seatingCapacity");
                if (seatStr != null && !seatStr.isEmpty()) {
                    try { seatingCapacity = Integer.parseInt(seatStr); } 
                    catch (NumberFormatException e) { seatingCapacity = null; }
                }
            }

            // ===== TIFFIN CENTER =====
            String tiffinPlan = null;
            Double tiffinPrice = null;
            if ("Tiffin".equalsIgnoreCase(propertyType)) {
                foodType = req.getParameter("foodType");

                String tiffinPriceStr = req.getParameter("tiffinPrice");
                if (tiffinPriceStr != null && !tiffinPriceStr.isEmpty()) {
                    try { tiffinPrice = Double.parseDouble(tiffinPriceStr); } 
                    catch (NumberFormatException e) { tiffinPrice = null; }
                }

                tiffinPlan = req.getParameter("tiffinPlan");
            }

            // ===== IMAGE UPLOAD =====
            String uploadPath = getServletContext().getRealPath("/") + "property_images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            StringBuilder imageNames = new StringBuilder();
            for (Part part : req.getParts()) {
                if ("images".equals(part.getName()) && part.getSize() > 0) {
                    String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
                    part.write(uploadPath + File.separator + fileName);
                    imageNames.append(fileName).append(",");
                }
            }

            String finalImages = imageNames.toString();
            if (finalImages.endsWith(",")) finalImages = finalImages.substring(0, finalImages.length() - 1);

            // ===== DATABASE INSERT =====
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO properties(" +
                    "property_type, room_type, bhk_type, food_type, meals_per_day, seating_capacity, tiffin_plan, tiffin_price, " +
                    "description, price, services, address, latitude, longitude, images) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, propertyType);
            ps.setString(2, roomType);
            ps.setString(3, bhkType);
            ps.setString(4, foodType);

            if (mealsPerDay != null) ps.setInt(5, mealsPerDay);
            else ps.setNull(5, java.sql.Types.INTEGER);

            if (seatingCapacity != null) ps.setInt(6, seatingCapacity);
            else ps.setNull(6, java.sql.Types.INTEGER);

            ps.setString(7, tiffinPlan);

            if (tiffinPrice != null) ps.setDouble(8, tiffinPrice);
            else ps.setNull(8, java.sql.Types.DOUBLE);

            ps.setString(9, description);
            ps.setDouble(10, price);
            ps.setString(11, services);
            ps.setString(12, address);
            ps.setDouble(13, latitude);
            ps.setDouble(14, longitude);
            ps.setString(15, finalImages);

            int i = ps.executeUpdate();
            if (i > 0) resp.sendRedirect("success.jsp");
            else resp.sendRedirect("error.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
