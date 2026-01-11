<%@ page import="java.util.*" %>
<%
    List<Map<String, String>> visits = (List<Map<String, String>>) request.getAttribute("visits");
%>

<!DOCTYPE html>
<html>
<head>
<title>Visit Requests</title>
<style>
body { font-family: Arial; background:#f3f6fa; padding:20px; }
table { width:100%; border-collapse: collapse; background:white; }
th, td { border:1px solid #ccc; padding:10px; text-align:left; }
th { background:#eee; }
</style>
</head>
<body>

<h2>Visit Requests</h2>

<table>
<tr>
    <th>ID</th>
    <th>Property ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Visit Time</th>
</tr>

<%
    if (visits != null && !visits.isEmpty()) {
        for (Map<String, String> v : visits) {
%>

<tr>
    <td><%= v.get("id") %></td>
    <td><%= v.get("propertyId") %></td>
    <td><%= v.get("name") %></td>
    <td><%= v.get("email") %></td>
    <td><%= v.get("phone") %></td>
    <td><%= v.get("visitTime") %></td>
</tr>

<%
        }
    } else {
%>
<tr><td colspan="6" style="text-align:center;">No Visit Requests</td></tr>
<%
    }
%>

</table>

</body>
</html>
