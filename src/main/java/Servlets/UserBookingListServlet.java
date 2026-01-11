package Servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import HomeHeaven.util.DBConnection;
import HomeHeavenmodel.Property;
import HomeHeavenmodel.User;

public class UserBookingListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("UserLogin.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        List<Property> bookedList = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT p.id, p.name, p.property_category, p.property_type, "
                       + "p.address, p.price, b.visit_time, b.phone "
                       + "FROM property_bookings b "
                       + "JOIN properties p ON b.property_id = p.id "
                       + "WHERE b.email = ? "
                       + "ORDER BY b.created_at DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getEmail());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Property p = new Property();

                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPropertyCategory(rs.getString("property_category"));
                p.setPropertyType(rs.getString("property_type"));
                p.setAddress(rs.getString("address"));
                p.setPrice(rs.getDouble("price"));

                // We can temporarily store phone or visit_time in description or add extra fields
                // for display in JSP
                p.setDescription("Phone: " + rs.getString("phone") + ", Visit Time: " + rs.getString("visit_time"));

                bookedList.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("bookedList", bookedList);
        req.getRequestDispatcher("UserDashboard.jsp").forward(req, resp);
    }
}
