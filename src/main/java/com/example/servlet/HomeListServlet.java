package com.example.servlet;

import com.example.models.home;
import com.example.utils.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/HomeListServlet")
public class HomeListServlet extends HttpServlet {
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        List<home> homeList = new ArrayList<>();
	        
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
	                
	                // ✅ Set default value if null
	                if (h.getPropertyType() == null) {
	                    h.setPropertyType("Default Property Type");
	                }

	                homeList.add(h); // ✅ Correctly building the list
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        request.setAttribute("homeList", homeList);
	        request.getRequestDispatcher("/listhome.jsp").forward(request, response);
	    }
}
	
