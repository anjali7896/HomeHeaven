package Servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminOwnerListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        String adminName = (String) session.getAttribute("adminName");
        if (adminName == null) {
            resp.sendRedirect("AdminLogin.jsp");
            return;
        }

        List<Owner> owners = new ArrayList<>();

        try (Connection conn = HomeHeaven.util.DBConnection.getConnection()) {
            String sql = "SELECT * FROM owners ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Owner o = new Owner();
                o.setId(rs.getInt("id"));
                o.setName(rs.getString("name"));
                o.setEmail(rs.getString("email"));
                o.setPhone(rs.getString("phone"));
                o.setCreatedAt(rs.getTimestamp("created_at"));
                owners.add(o);
            }

            req.setAttribute("owners", owners);
            RequestDispatcher rd = req.getRequestDispatcher("AdminOwnerList.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }

    public static class Owner {
        private int id;
        private String name, email, phone;
        private Timestamp createdAt;
        public int getId() { return id; }
        public void setId(int id) { this.id = id; }
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        public String getPhone() { return phone; }
        public void setPhone(String phone) { this.phone = phone; }
        public Timestamp getCreatedAt() { return createdAt; }
        public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
    }
}
