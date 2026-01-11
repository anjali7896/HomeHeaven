package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class RatePropertyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int propertyId = Integer.parseInt(req.getParameter("propertyId"));
        int rating = Integer.parseInt(req.getParameter("rating"));
        String comment = req.getParameter("comment");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO property_ratings (property_id, rating, comment) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, propertyId);
            ps.setInt(2, rating);
            ps.setString(3, comment);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("PropertyDetailsServlet?id=" + propertyId);
    }
}
