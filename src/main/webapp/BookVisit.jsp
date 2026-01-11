<%@ page import="HomeHeavenmodel.Property" %>
<%
    String idStr = request.getParameter("id");
    if (idStr == null || idStr.isEmpty()) {
        response.sendRedirect("FilterProperties.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Book Visit</title>
<style>
body { font-family: Arial, sans-serif; background:#f3f6fa; margin:0; padding:0;}
.container { max-width:500px; margin:50px auto; background:white; padding:20px; border-radius:10px;}
input, textarea { width:100%; padding:10px; margin:10px 0; border-radius:6px; border:1px solid #ccc; }
button { padding:10px 15px; border:none; border-radius:6px; background:#27ae60; color:white; cursor:pointer; }
</style>
</head>
<body>

<div class="container">
    <h2>Book a Visit</h2>
   <form action="BookVisitServlet" method="post">
   
        <input type="hidden" name="propertyId" value="<%= idStr %>">
        <label>Your Name</label>
        <input type="text" name="name" required>
        <label>Email</label>
        <input type="email" name="email" required>
        <label>Phone</label>
        <input type="text" name="phone" required>
        <label>Preferred Date & Time</label>
        <input type="text" name="visitTime" placeholder="DD-MM-YYYY HH:MM">
        <button type="submit">Book Visit</button>
    </form>
</div>

</body>
</html>
