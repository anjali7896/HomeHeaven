<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Owner Dashboard</title>
    <style>
        body {
            margin: 0; padding: 0; height: 100vh;
            display: flex; flex-direction: column;
            justify-content: center; align-items: center;
            background: #f4f7fb; font-family: Arial, sans-serif;
        }
        h2 {
            margin-bottom: 30px;
            color: #333;
        }
        .menu-container {
            background: #ffffff; padding: 25px 35px;
            border-radius: 12px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.12);
            display: flex; justify-content: center; align-items: center;
            gap: 18px; flex-wrap: wrap;
        }
        .menu-container a {
            text-decoration: none; color: #333; background: #e8eff9;
            padding: 12px 16px; border-radius: 8px; font-size: 15px; font-weight: bold;
            transition: 0.3s ease;
        }
        .menu-container a:hover {
            background: #c7d9f6; color: #000; transform: scale(1.08);
        }
    </style>
</head>
<body>

<h2>Welcome, <%= session.getAttribute("ownerName") %>!</h2>

<div class="menu-container">

    <!-- Profile -->
    <a href="<%= request.getContextPath() %>/profile">My Profile</a>

    <!-- Add Property -->
    <a href="<%= request.getContextPath() %>/AddProperty.jsp">Add Property</a>

    <!-- View Owner's Properties -->
    <a href="<%= request.getContextPath() %>/OwnerPropertyListServlet">View My Properties</a>

  <!-- View Visit Requests (UPDATED according to your mapping) -->
    <a href="<%= request.getContextPath() %>/viewVisitRequests">Visit Requests</a>
    
    <!-- View Ratings -->
    <a href="<%= request.getContextPath() %>/owner-properties">Ratings</a>

    <!-- Logout -->
    <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>

</div>

</body>
</html>
