package com.example.servlet;

import com.example.models.home;
import com.example.utils.DBConnection;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/ListHomeServlet")
public class ListHomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<home> homes = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM homes1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                home h = new home();
                h.setId(rs.getInt("id"));
                h.setPropertyType(rs.getString("property_type"));
                h.setPrice(rs.getDouble("price"));
                h.setLocation(rs.getString("location"));
                h.setDescription(rs.getString("description"));
                h.setImagePath(rs.getString("image_path"));
                homes.add(h);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        


        request.setAttribute("homeList", homes);
        RequestDispatcher rd = request.getRequestDispatcher("listhome.jsp");
        rd.forward(request, response);
    }
}

