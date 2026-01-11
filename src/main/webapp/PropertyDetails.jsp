<%@ page import="HomeHeavenmodel.Property" %>
<%
    Property p = (Property) request.getAttribute("property");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Property Details</title>
<style>
body { font-family: Arial; background:#f3f6fa; margin:0; }
.container { max-width:900px; margin:40px auto; background:white; padding:20px; border-radius:10px; }
img { width:100%; max-height:400px; object-fit:cover; border-radius:8px; margin-bottom:10px; }
.btn { display:inline-block; padding:10px 15px; margin:5px; border-radius:6px; text-decoration:none; color:white; }
.map-btn { background:#0984e3; }
.rating-btn { background:#f39c12; }
.booking-btn { background:#27ae60; }
</style>
</head>
<body>

<%
if(p == null){
%>
<h2 style="text-align:center; margin-top:50px;">Property Not Found!</h2>
<%
} else {
%>

<div class="container">

    <%
    if(p.getImages() != null && !p.getImages().isEmpty()){
        for(String img : p.getImages()){
    %>
        <img src="property_images/<%= img %>" alt="Property Image">
    <%
        }
    } else {
    %>
        <img src="https://source.unsplash.com/600x400/?room,interior" alt="Property Image">
    <%
    }
    %>

    <h1><%= p.getPropertyType() %> - Rs.<%= p.getPrice() %></h1>
    <p><b>Address:</b> <%= p.getAddress() %></p>
    <p><b>Room/BHK:</b> <%= p.getRoomType() != null ? p.getRoomType() : p.getBhkType() %></p>
    <p><b>Services:</b> <%= p.getServices() %></p>
    <p><b>Description:</b><br><%= p.getDescription() %></p>

    <div>
        <a class="btn map-btn" target="_blank"
           href="https://www.google.com/maps?q=<%= p.getLatitude() %>,<%= p.getLongitude() %>">View on Map</a>
        <a class="btn rating-btn" href="RateProperty.jsp?id=<%= p.getId() %>">Rate Property</a>
        <a class="btn booking-btn" href="BookVisit.jsp?id=<%= p.getId() %>">Book Now</a>
    </div>

</div>

<%
}
%>

</body>
</html>
