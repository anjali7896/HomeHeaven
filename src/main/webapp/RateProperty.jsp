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
<title>Rate Property</title>
<style>
body { font-family: Arial, sans-serif; background:#f3f6fa; margin:0; padding:0;}
.container { max-width:500px; margin:50px auto; background:white; padding:20px; border-radius:10px;}
input[type=number], textarea { width:100%; padding:10px; margin:10px 0; border-radius:6px; border:1px solid #ccc; }
button { padding:10px 15px; border:none; border-radius:6px; background:#f39c12; color:white; cursor:pointer; }
</style>
</head>
<body>

<div class="container">
    <h2>Rate Property</h2>
    <form action="RatePropertyServlet" method="post">
        <input type="hidden" name="propertyId" value="<%= idStr %>">
        <label>Rating (1-5)</label>
        <input type="number" name="rating" min="1" max="5" required>
        <label>Comment</label>
        <textarea name="comment" rows="4" placeholder="Optional"></textarea>
        <button type="submit">Submit Rating</button>
    </form>
</div>

</body>
</html>
