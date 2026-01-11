package Servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import HomeHeavenmodel.User;
import HomeHeaven.util.DBConnection;
import java.sql.*;

public class AdminUserListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<User> users = null;

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT id, name, email FROM users";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            users = new java.util.ArrayList<>();

            while (rs.next()) {
                User u = new User(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email")
                );
                users.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("users", users);
        req.getRequestDispatcher("AdminUserList.jsp").forward(req, resp);
    }
}
