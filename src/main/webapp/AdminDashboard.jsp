<%@ page session="true" import="java.sql.*, HomeHeaven.util.DBConnection" %>
<%
    String adminName = (String) session.getAttribute("adminName");
    if(adminName == null){
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f5f5;
}

/* Header / Top menu */
.header {
    background: #ecf0f1; /* light color */
    padding: 15px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header h1 {
    margin: 0;
    font-size: 24px;
    color: #2c3e50;
}

.nav-links a {
    margin-left: 20px;
    text-decoration: none;
    color: #2c3e50;
    padding: 8px 15px;
    border-radius: 6px;
    transition: 0.3s;
}

.nav-links a:hover {
    background: #2c3e50;
    color: white;
}

/* Hero / Main Content */
.hero {
    padding: 40px;
    background: #fff;
}

.section {
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    margin-bottom: 30px;
}

.section h3 {
    margin-top: 0;
    color: #2c3e50;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px;
    border: 1px solid #ccc;
    text-align: left;
}

th {
    background: #2c3e50;
    color: white;
}

tr:nth-child(even) {
    background: #f2f2f2;
}

</style>
</head>
<body>

<!-- Header with horizontal menu -->
<div class="header">
    <h1>Welcome, <%= adminName %></h1>
    <div class="nav-links">
        <a href="AdminDashboard.jsp">Dashboard</a>
        <a href="AdminOwnerList.jsp">Owners</a>
        <a href="AdminUserList.jsp">Users</a>
        <a href="AdminLogoutServlet">Logout</a>
    </div>
</div>

<!-- Main Content -->
<div class="hero">
    <div class="section">
        <h3>Recent Enquiries</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Submitted At</th>
            </tr>
            <%
                try (Connection conn = DBConnection.getConnection()) {
                    String sql = "SELECT * FROM enquiries ORDER BY created_at DESC LIMIT 5";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("message") %></td>
                <td><%= rs.getTimestamp("created_at") %></td>
            </tr>
            <%
                    }
                } catch(Exception e){
                    e.printStackTrace();
                }
            %>
        </table>
        <p><a href="AdminEnquiries.jsp">View All Enquiries</a></p>
    </div>
</div>

</body>
</html>
