<%@ page session="true" 
         import="java.util.*, HomeHeavenmodel.User,HomeHeaven.util.DBConnection"
%>

<%
    // Check admin session
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    // Fetch users passed by servlet
    List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin - Users List</title>

<style>
body { font-family: Arial; margin:0; padding:0; background:#f5f5f5; }
.header { background:#ecf0f1; padding:15px 40px; display:flex; justify-content:space-between; align-items:center; }
.header h1 { margin:0; color:#2c3e50; }
.nav-links a { margin-left:15px; text-decoration:none; color:#2c3e50; padding:8px 15px; border-radius:6px; transition:0.3s; }
.nav-links a:hover { background:#2c3e50; color:white; }
.section { margin:20px 40px; background:white; padding:20px; border-radius:10px; box-shadow:0 4px 15px rgba(0,0,0,0.1); }
h3 { margin-top:0; color:#2c3e50; }
table { width:100%; border-collapse:collapse; }
th, td { padding:12px; border:1px solid #ccc; text-align:left; }
th { background:#2c3e50; color:white; }
tr:nth-child(even){ background:#f2f2f2; }
</style>

</head>
<body>

<div class="header">
    <h1>User List</h1>
    <div class="nav-links">
        <a href="AdminDashboard.jsp">Dashboard</a>
        <a href="AdminLogoutServlet">Logout</a>
    </div>
</div>

<div class="section">
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
        </tr>

        <% 
        if (users != null && !users.isEmpty()) {
            for (User u : users) { 
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
        </tr>
        <% 
            } 
        } else { 
        %>
        <tr>
            <td colspan="3" style="text-align:center; color:red;">
                No users found.
            </td>
        </tr>
        <% } %>

    </table>
</div>

</body>
</html>
