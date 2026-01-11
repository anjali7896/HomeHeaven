<%@ page session="true" import="java.sql.*, java.util.*, HomeHeavenmodel.Owner, HomeHeaven.util.DBConnection" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null){
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    List<Owner> owners = new ArrayList<>();

    try {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT id, name, email, phone, created_at FROM owners";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
            Owner o = new Owner();
            o.setId(rs.getInt("id"));
            o.setName(rs.getString("name"));
            o.setEmail(rs.getString("email"));
            o.setPhone(rs.getString("phone"));
           
            owners.add(o);
        }

        rs.close();
        ps.close();
        conn.close();

    } catch(Exception e){
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Owners List</title>

<style>
body { font-family: Arial; background: #f5f5f5; margin: 0; }
.hero {
    background: #34495e;
    padding: 15px;
    display: flex;
    gap: 20px;
}
.hero a {
    color: white;
    text-decoration: none;
    font-weight: bold;
}
.section {
    background: #fff;
    width: 90%;
    margin: 30px auto;
    padding: 20px;
    border-radius: 10px;
}
table {
    width: 100%;
    border-collapse: collapse;
}
th, td {
    padding: 10px;
    border: 1px solid #ccc;
}
th {
    background: #34495e;
    color: white;
}
</style>

</head>
<body>

<!-- TOP NAVBAR / HERO SECTION -->
<div class="hero">
    <a href="AdminDashboard.jsp">Dashboard</a>
    <a href="AdminOwnerList.jsp">Owners</a>
    <a href="AdminUserList.jsp">Users</a>
    <a href="AdminDashboard.jsp">Enquiries</a>
    <a href="AdminLogoutServlet">Logout</a>
</div>

<div class="section">
    <h2>Registered Owners</h2>

    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Email</th><th>Phone</th>
        </tr>

        <% for(Owner o : owners) { %>
        <tr>
            <td><%= o.getId() %></td>
            <td><%= o.getName() %></td>
            <td><%= o.getEmail() %></td>
            <td><%= o.getPhone() %></td>
          
        </tr>
        <% } %>

    </table>
</div>

</body>
</html>
