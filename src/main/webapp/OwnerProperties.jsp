<%@ page import="java.util.List" %>
<%@ page import="HomeHeavenmodel.Property" %>
<%
    List<Property> properties = (List<Property>) request.getAttribute("properties");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Properties</title>
<style>
body { font-family: Arial; background:#f3f6fa; padding:20px; }
h2 { margin-top:0; }
table { width:100%; border-collapse: collapse; margin-top:20px; }
th, td { padding:10px; border:1px solid #ccc; text-align:left; }
th { background:#f0f0f0; }
a.btn { padding:5px 10px; border-radius:5px; text-decoration:none; color:white; }
a.view { background:#3498db; }
a.edit { background:#f39c12; }
a.delete { background:#e74c3c; }
</style>
</head>
<body>

<h2>My Properties</h2>
<a href="AddProperty.jsp" style="padding:8px 15px; background:#27ae60; color:white; text-decoration:none; border-radius:6px;">Add New Property</a>

<table>
<tr>
<th>ID</th><th>Address</th><th>Category</th><th>Type</th><th>Price</th><th>Actions</th>
</tr>
<%
    if(properties != null && !properties.isEmpty()) {
        for(Property p : properties) {
%>
<tr>
<td><%= p.getId() %></td>
<td><%= p.getName() %></td>   <!-- Now this prints address -->
<td><%= p.getPropertyCategory() %></td>
<td><%= p.getPropertyType() %></td>
<td><%= p.getPrice() %></td>
<td>
<a href="OwnerAddEditPropertyServlet?id=<%=p.getId()%>" class="btn edit">Edit</a>
<a href="OwnerDeletePropertyServlet?id=<%=p.getId()%>" class="btn delete" onclick="return confirm('Are you sure?');">Delete</a>
</td>
</tr>
<%
        }
    } else {
%>
<tr><td colspan="6" style="text-align:center;">No properties found</td></tr>
<%
    }
%>
</table>
</body>
</html>
