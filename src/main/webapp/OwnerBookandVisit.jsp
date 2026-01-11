<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%
    Map<String, Object> property = (Map<String, Object>) request.getAttribute("property");
    List<Map<String, Object>> ratings = (List<Map<String, Object>>) request.getAttribute("ratings");
    List<Map<String, Object>> visits = (List<Map<String, Object>>) request.getAttribute("visits");

    if (property == null) {
        response.sendRedirect("OwnerDashboard.jsp");
        return;
    }

    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Property Details - Owner View</title>
<style>
body { font-family: Arial, sans-serif; background:#f3f6fa; margin:0; padding:0; }
.container { max-width:900px; margin:50px auto; background:white; padding:20px; border-radius:10px; }
h2 { color:#2c3e50; }
table { width:100%; border-collapse: collapse; margin:20px 0; }
table, th, td { border:1px solid #ccc; }
th, td { padding:10px; text-align:left; }
th { background:#2c3e50; color:white; }
.section { margin-bottom:30px; }
</style>
</head>
<body>

<div class="container">
    <h2>Property Details</h2>
    <div class="section">
        <p><b>ID:</b> <%= property.get("id") %></p>
        <p><b>Name:</b> <%= property.get("name") %></p>
        <p><b>Type:</b> <%= property.get("property_type") %></p>
        <p><b>Address:</b> <%= property.get("address") %></p>
        <p><b>Price:</b> Rs. <%= property.get("price") %></p>
    </div>

    <h2>Ratings & Comments</h2>
    <div class="section">
        <%
            if (ratings == null || ratings.isEmpty()) {
        %>
            <p>No ratings yet.</p>
        <%
            } else {
        %>
        <table>
            <tr>
                <th>User</th>
                <th>Rating</th>
                <th>Comment</th>
                <th>Date</th>
            </tr>
            <%
                for (Map<String, Object> r : ratings) {
            %>
            <tr>
                <td><%= r.get("user_name") %></td>
                <td><%= r.get("rating") %></td>
                <td><%= r.get("comment") != null ? r.get("comment") : "-" %></td>
                <td><%= r.get("created_at") != null ? sdf.format(r.get("created_at")) : "-" %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>
    </div>

    <h2>Booked Visits</h2>
    <div class="section">
        <%
            if (visits == null || visits.isEmpty()) {
        %>
            <p>No visits booked yet.</p>
        <%
            } else {
        %>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Preferred Visit Time</th>
                <th>Booking Date</th>
            </tr>
            <%
                for (Map<String, Object> v : visits) {
            %>
            <tr>
                <td><%= v.get("name") %></td>
                <td><%= v.get("email") %></td>
                <td><%= v.get("phone") %></td>
                <td><%= v.get("visit_time") != null ? v.get("visit_time") : "-" %></td>
                <td><%= v.get("created_at") != null ? sdf.format(v.get("created_at")) : "-" %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
