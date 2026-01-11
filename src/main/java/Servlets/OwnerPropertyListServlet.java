package Servlets;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import HomeHeavenmodel.Property;
import HomeHeaven.util.DBConnection;

public class OwnerPropertyListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Property> properties = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            // If owner-based filter needed, uncomment below:
            // int ownerId = (int) request.getSession().getAttribute("ownerId");
            // PreparedStatement stmt = conn.prepareStatement("SELECT * FROM properties WHERE owner_id=?");
            // stmt.setInt(1, ownerId);

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM properties");

            while (rs.next()) {
                Property p = new Property();
                p.setId(rs.getInt("id"));

                // ✔ FIX: name was NULL, so using address instead
                p.setName(rs.getString("address"));

                p.setPropertyCategory(rs.getString("property_category"));
                p.setPropertyType(rs.getString("property_type"));
                p.setPrice(rs.getDouble("price"));

                properties.add(p);
            }

            rs.close();
            stmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("properties", properties);
        request.getRequestDispatcher("OwnerProperties.jsp").forward(request, response);
    }
}
