<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.example.models.home" %>
<%@ page import="com.example.utils.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Home</title>
    <style>
        /* Styling similar to previous messages */
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #219150;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Home</h2>
        <%
            String id = request.getParameter("id");
            home homeToUpdate = null;
            try {
                Connection conn = DBConnection.getConnection();
                String sql = "SELECT * FROM homes1 WHERE id = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(id));
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    homeToUpdate = new home();
                    homeToUpdate.setId(rs.getInt("id"));
                    homeToUpdate.setPropertyType(rs.getString("property_type"));
                    homeToUpdate.setPrice(rs.getDouble("price"));
                    homeToUpdate.setLocation(rs.getString("location"));
                    homeToUpdate.setDescription(rs.getString("description"));
                    homeToUpdate.setImagePath(rs.getString("image_path"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

        <form action="UpdateHomeServlet" method="post">
            <input type="hidden" name="id" value="<%= homeToUpdate.getId() %>">
            
            <label>Property Type</label>
            <select name="propertyType" required>
 <option value="PG" <%= "PG".equals(homeToUpdate.getPropertyType()) ? "selected" : "" %>>PG</option>
<option value="1 BHK" <%= "1 BHK".equals(homeToUpdate.getPropertyType()) ? "selected" : "" %>>1 BHK</option>
<option value="2 BHK" <%= "2 BHK".equals(homeToUpdate.getPropertyType()) ? "selected" : "" %>>2 BHK</option>
<option value="3 BHK" <%= "3 BHK".equals(homeToUpdate.getPropertyType()) ? "selected" : "" %>>3 BHK</option>
                
            </select><br>

            <label>Price</label>
            <input type="number" name="price" value="<%= homeToUpdate.getPrice() %>" required><br>

            <label>Location</label>
            <input type="text" name="location" value="<%= homeToUpdate.getLocation() %>" required><br>

            <label>Description</label>
            <textarea name="description" required><%= homeToUpdate.getDescription() %></textarea><br>

            <button type="submit">Update Home</button>
        </form>
    </div>
</body>
</html>
