package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;
import HomeHeavenmodel.User;

public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password); // hash comparison recommended
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));

                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                resp.sendRedirect("UserDashboard.jsp");
            } else {
                resp.sendRedirect("UserLogin.jsp?error=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("UserLogin.jsp?error=serverError");
        }
    }
}
