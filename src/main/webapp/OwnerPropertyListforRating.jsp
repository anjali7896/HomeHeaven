<%@ page import="java.util.*, HomeHeavenmodel.Property" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Properties - HomeHeaven</title>
<style>
body { font-family: Arial; background:#f3f6fa; margin:0; padding:20px; }
.container { max-width:1200px; margin:auto; }
.cards-container { display:flex; flex-wrap:wrap; gap:20px; justify-content:flex-start; }
.card { background:white; border-radius:10px; overflow:hidden; width:300px; box-shadow:0 4px 10px rgba(0,0,0,0.1); display:flex; flex-direction:column; }
.card img { width:100%; height:180px; object-fit:cover; }
.card-body { padding:15px; flex:1; display:flex; flex-direction:column; justify-content:space-between; }
.card-body h3 { margin:0 0 10px 0; font-size:18px; color:#333; }
.card-body p { margin:4px 0; font-size:14px; color:#555; }
.btn { text-decoration:none; padding:6px 10px; border-radius:6px; color:white; font-size:13px; }
.edit { background:#f39c12; }
.delete { background:#e74c3c; }
.info { background:#0984e3; }
.rating { background:#f1c40f; }
</style>
</head>
<body>
<h2>My Properties</h2>
<div class="cards-container">
<%
    List<Property> properties = (List<Property>) request.getAttribute("properties");
    if(properties == null || properties.isEmpty()){
%>
    <h3 style="width:100%; text-align:center;">No properties found!</h3>
<%
    } else {
        for(Property p : properties){
            String img = (p.getImages() != null && !p.getImages().isEmpty()) 
                         ? "property_images/" + p.getImages().get(0)
                         : "https://source.unsplash.com/400x300/?room,interior";
%>
    <div class="card">
        <img src="<%= img %>" alt="Property Image">
        <div class="card-body">
            <h3><%= p.getPropertyType() %> - Rs.<%= p.getPrice() %></h3>
            <p><b>Address:</b> <%= p.getAddress() != null ? p.getAddress() : "-" %></p>
            <p><b>Description:</b> <%= p.getDescription() != null ? p.getDescription() : "-" %></p>

            <%-- Hostel/PG/Flat --%>
            <%
                String type = p.getPropertyType();
                if("Mess".equalsIgnoreCase(type)){
            %>
                <p><b>Meals per Day:</b> <%= p.getMealsPerDay() != null ? p.getMealsPerDay() : "-" %></p>
            <%
                } else if("Tiffin".equalsIgnoreCase(type)){
            %>
                <p><b>Food Type:</b> <%= p.getFoodType() != null ? p.getFoodType() : "-" %></p>
                <p><b>Tiffin Plan:</b> <%= p.getTiffinPlan() != null ? p.getTiffinPlan() : "-" %></p>
            <%
                } else { // Hostel/PG/Flat
            %>
                <p><b>Room/BHK:</b> <%= (p.getRoomType() != null) ? p.getRoomType() : (p.getBhkType() != null ? p.getBhkType() : "-") %></p>
                <p><b>Services:</b> <%= p.getServices() != null ? p.getServices() : "-" %></p>
            <%
                }
            %>

            <%-- Ratings --%>
            <p><b>Average Rating:</b> <%= String.format("%.1f", p.getAvgRating()) %> / 5 (<%= p.getRatingCount() %> reviews)</p>

            <div style="margin-top:10px;">
                <a class="btn edit" href="OwnerEditPropertyServlet?id=<%= p.getId() %>">Edit</a>
                <a class="btn delete" href="OwnerDeletePropertyServlet?id=<%= p.getId() %>">Delete</a>
                <a class="btn info" href="PropertyDetailsServlet?id=<%= p.getId() %>">Details</a>
            </div>
        </div>
    </div>
<%
        }
    }
%>
</div>
</body>
</html>
