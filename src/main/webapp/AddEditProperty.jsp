<%@ page import="HomeHeavenmodel.Property" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Property p = (Property) request.getAttribute("property");
    if (p == null) {
        response.sendRedirect("OwnerPropertyListServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Property</title>
<style>
body { font-family: Arial, sans-serif; background:#f4f7fb; margin:0; padding:20px; }
.container { max-width:700px; margin:30px auto; background:white; padding:20px; border-radius:8px; box-shadow:0 4px 16px rgba(0,0,0,0.08); }
label { display:block; margin-top:12px; font-weight:600; }
input[type=text], input[type=number], textarea { width:100%; padding:10px; margin-top:6px; border:1px solid #ccc; border-radius:4px; }
.btn { margin-top:16px; padding:10px 18px; background:#27ae60; color:#fff; border:none; border-radius:6px; cursor:pointer; }
</style>
</head>
<body>
<div class="container">
    <h2>Edit Property — ID: <%= p.getId() %></h2>

    <form action="OwnerAddEditPropertyServlet" method="post">
        <input type="hidden" name="id" value="<%= p.getId() %>" />

        <label>Price</label>
        <input type="number" step="0.01" name="price" value="<%= p.getPrice() %>" required />

        <label>Address</label>
        <input type="text" name="address" value="<%= p.getAddress() != null ? p.getAddress() : "" %>" required />

        <label>Services (comma separated)</label>
        <input type="text" name="services" value="<%= p.getServices() != null ? p.getServices() : "" %>" />

        <label>Description</label>
        <textarea name="description" rows="4"><%= p.getDescription() != null ? p.getDescription() : "" %></textarea>

        <button type="submit" class="btn">Save Changes</button>
    </form>
</div>
</body>
</html>
