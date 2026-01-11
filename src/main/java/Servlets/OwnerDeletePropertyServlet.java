package Servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class OwnerDeletePropertyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM properties WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("OwnerPropertyListServlet");
    }
}
