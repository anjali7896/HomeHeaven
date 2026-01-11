package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class SubmitEnquiryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String message = req.getParameter("message");

        if (name == null || email == null || message == null ||
            name.isEmpty() || email.isEmpty() || message.isEmpty()) {
            resp.sendRedirect("index.jsp?error=Please+fill+all+fields");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO enquiries (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("index.jsp?success=Message+sent+successfully");
    }
}
