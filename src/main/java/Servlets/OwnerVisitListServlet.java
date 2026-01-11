package Servlets;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import HomeHeaven.util.DBConnection;

public class OwnerVisitListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Map<String, String>> visits = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM property_bookings");

            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("id", rs.getString("id"));
                map.put("propertyId", rs.getString("property_id"));
                map.put("name", rs.getString("name"));
                map.put("email", rs.getString("email"));
                map.put("phone", rs.getString("phone"));
                map.put("visitTime", rs.getString("visit_time"));
                visits.add(map);
            }

            rs.close();
            st.close();
            conn.close();
        } 
        catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("visits", visits);
        req.getRequestDispatcher("OwnerVisitList.jsp").forward(req, resp);
    }
}
