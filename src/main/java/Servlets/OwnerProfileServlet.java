package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class OwnerProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

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

            req.getRequestDispatcher("/OwnerProfile.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/OwnerLogin.jsp");
        }
    }
}
