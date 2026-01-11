<%@ page import="HomeHeavenmodel.User, HomeHeavenmodel.Property, java.util.*" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }

    List<Property> bookedList = (List<Property>) request.getAttribute("bookedList");
    if (bookedList == null) bookedList = new ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
body { 
    font-family: Arial, sans-serif; 
    padding: 20px; 
    background: #f4f4f4; 
}
.nav { 
    margin-bottom: 20px; 
}
.nav a { 
    margin-right: 20px; 
    font-weight: bold; 
    text-decoration: none; 
    color: #0066cc; 
}
.nav a.logout { 
    color: red; 
}
.card {
    background: white;
    padding: 15px;
    margin-bottom: 15px;
    border-radius: 8px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.15);
}
.title { 
    font-size: 20px; 
    font-weight: bold; 
    margin-bottom: 10px;
}
.booking-info {
    margin-top: 10px;
    padding: 10px;
    background: #eef6ff;
    border-radius: 6px;
}
</style>
</head>
<body>

<h2>Welcome, <%= user.getName() %></h2>

<div class="nav">
    <a href="index.jsp">Home</a>
    <a href="UserBookings">My Bookings</a>
    <a href="UserLogoutServlet" class="logout">Logout</a>
</div>

<h3>Your Booked Properties</h3>

<% if(bookedList.isEmpty()) { %>
    <p>No bookings found.</p>
<% } %>

<% for(Property p : bookedList) { %>
<div class="card">

    <p><b>Category:</b> <%= p.getPropertyCategory() %></p>
    <p><b>Type:</b> <%= p.getPropertyType() %></p>
    <p><b>Address:</b> <%= p.getAddress() %></p>
    <p><b>Price:</b> Rs.<%= p.getPrice() %></p>

    <% if(p.getPropertyCategory() != null && 
          (p.getPropertyCategory().equalsIgnoreCase("Hostel") 
           || p.getPropertyCategory().equalsIgnoreCase("PG"))) { %>
        <p><b>Room Type:</b> <%= p.getRoomType() %></p>
    <% } %>

    <% if(p.getPropertyCategory() != null && 
          p.getPropertyCategory().equalsIgnoreCase("Flat")) { %>
        <p><b>BHK Type:</b> <%= p.getBhkType() %></p>
    <% } %>

    <% if(p.getPropertyCategory() != null && 
          p.getPropertyCategory().equalsIgnoreCase("Mess")) { %>
        <p><b>Meals Per Day:</b> <%= p.getMealsPerDay() %></p>
    <% } %>

    <% if(p.getPropertyCategory() != null && 
          p.getPropertyCategory().equalsIgnoreCase("Tiffin")) { %>
        <p><b>Food Type:</b> <%= p.getFoodType() %></p>
        <p><b>Tiffin Plan:</b> <%= p.getTiffinPlan() %></p>
    <% } %>

    <div class="booking-info">
        <p><b>Phone:</b> <%= p.getDescription().split(",")[0].replace("Phone: ", "") %></p>
        <p><b>Visit Time:</b> <%= p.getDescription().split(",")[1].replace(" Visit Time: ", "") %></p>
    </div>

</div>
<% } %>

</body>
</html>
