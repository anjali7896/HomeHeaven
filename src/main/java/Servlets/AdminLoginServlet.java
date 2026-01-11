package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT * FROM admins WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password); // For production, use hashed passwords
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                // Admin found, create session
                HttpSession session = req.getSession();
                session.setAttribute("adminName", rs.getString("name"));
                session.setAttribute("adminId", rs.getInt("id"));
                
                resp.sendRedirect("AdminDashboard.jsp");
            } else {
                resp.sendRedirect("AdminLogin.jsp?error=invalid");
            }

        } catch(Exception e){
            e.printStackTrace();
            resp.sendRedirect("AdminLogin.jsp?error=server");
        }
    }
}
