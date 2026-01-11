package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class OwnerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT * FROM owners WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // store owner info in session
                HttpSession session = req.getSession();
                session.setAttribute("ownerId", rs.getInt("id"));
                session.setAttribute("ownerName", rs.getString("name"));

                // redirect to profile page
                resp.sendRedirect("OwnerDashboard.jsp");

            } else {
                req.setAttribute("error", "Invalid Email or Password");
                req.getRequestDispatcher("OwnerLogin.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Server error occurred");
            req.getRequestDispatcher("OwnerLogin.jsp").forward(req, resp);
        }
    }
}
