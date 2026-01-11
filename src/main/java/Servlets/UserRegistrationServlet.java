package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class UserRegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password); // you can hash password for security
            ps.executeUpdate();

            resp.sendRedirect("UserLogin.jsp?msg=registered");
        } catch (SQLIntegrityConstraintViolationException e) {
            resp.sendRedirect("UserRegistration.jsp?error=emailExists");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("UserRegistration.jsp?error=serverError");
        }
    }
}
