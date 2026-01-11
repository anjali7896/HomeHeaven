package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import HomeHeaven.util.DBConnection;
import HomeHeavenmodel.Property;

public class OwnerAddEditPropertyServlet extends HttpServlet {

    // GET → load property and show edit form
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam == null) {
            resp.sendRedirect("OwnerPropertyListServlet");
            return;
        }

        int id = Integer.parseInt(idParam);
        Property p = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM properties WHERE id=?")) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Property();
                    p.setId(rs.getInt("id"));
                    p.setAddress(rs.getString("address"));
                    p.setPrice(rs.getDouble("price"));
                    p.setServices(rs.getString("services"));
                    p.setDescription(rs.getString("description"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("property", p);
        req.getRequestDispatcher("EditProperty.jsp").forward(req, resp);
    }

    // POST → update property
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(req.getParameter("id"));
        String address = req.getParameter("address");
        String services = req.getParameter("services");
        String description = req.getParameter("description");
        double price = 0;
        try { price = Double.parseDouble(req.getParameter("price")); } catch (Exception ignored) {}

        String sql = "UPDATE properties SET address=?, services=?, description=?, price=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, address);
            ps.setString(2, services);
            ps.setString(3, description);
            ps.setDouble(4, price);
            ps.setInt(5, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("OwnerPropertyListServlet");
    }
}
