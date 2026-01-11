package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class UpdateOwnerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Load current owner data for the form
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("ownerId") == null) {
            resp.sendRedirect(req.getContextPath() + "/OwnerLogin.jsp");
            return;
        }

        int ownerId = (int) session.getAttribute("ownerId");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM owners WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ownerId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.setAttribute("id", rs.getInt("id"));
                req.setAttribute("name", rs.getString("name"));
                req.setAttribute("email", rs.getString("email"));
                req.setAttribute("phone", rs.getString("phone"));
                req.setAttribute("dob", rs.getString("dob"));
                req.setAttribute("id_type", rs.getString("id_type"));
                req.setAttribute("id_number", rs.getString("id_number"));
            }

            RequestDispatcher rd = req.getRequestDispatcher("/UpdateOwner.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/owner/profile");
        }
    }

    // Update owner data in database
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String dob = req.getParameter("dob");
        String id_type = req.getParameter("id_type");
        String id_number = req.getParameter("id_number");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        // Validate password if provided
        if(password != null && !password.isEmpty()) {
            if(!password.equals(confirmPassword)) {
                req.setAttribute("error", "Passwords do not match!");
                doGet(req, resp);
                return;
            }
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql;
            PreparedStatement ps;

            if(password != null && !password.isEmpty()) {
                // Update including password
                sql = "UPDATE owners SET name=?, email=?, phone=?, dob=?, id_type=?, id_number=?, password=? WHERE id=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, dob);
                ps.setString(5, id_type);
                ps.setString(6, id_number);
                ps.setString(7, password); // Ideally hash the password before storing
                ps.setInt(8, id);
            } else {
                // Update without password
                sql = "UPDATE owners SET name=?, email=?, phone=?, dob=?, id_type=?, id_number=? WHERE id=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, dob);
                ps.setString(5, id_type);
                ps.setString(6, id_number);
                ps.setInt(7, id);
            }

            int updated = ps.executeUpdate();

            if (updated > 0) {
                resp.sendRedirect(req.getContextPath() + "/owner/profile");
            } else {
                req.setAttribute("error", "Failed to update profile.");
                doGet(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Server error occurred.");
            doGet(req, resp);
        }
    }
}
