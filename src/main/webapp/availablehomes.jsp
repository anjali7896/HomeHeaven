<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.models.home" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Homes</title>
    <style>
        /* same styling as previous messages */
        .card {
            border: 1px solid #ccc;
            padding: 20px;
            margin: 20px;
            border-radius: 8px;
            width: 300px;
            display: inline-block;
        }
        .card img {
            width: 100%;
            height: auto;
        }
        .price {
            font-weight: bold;
            color: #27ae60;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
        }
        .button-container {
            margin-top: 10px;
        }
        button {
            background-color:blue;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            margin-right: 10px;
        }
        button:hover {
            background-color: #219150;
        }
    </style>
</head>
<body>
    <h1>Available for Rents</h1>
    <div class="card-container">
        <%
            List<home> homeList = (List<home>) request.getAttribute("homeList");
            if (homeList != null && !homeList.isEmpty()) {
                for (home h : homeList) {
        %>
        <div class="card">
            <img src="<%= request.getContextPath() + "/" + h.getImagePath() %>" alt="Home Image" />
            <h3><%= h.getPropertyType() %> in <%= h.getLocation() %></h3>
            <p class="price">₹<%= h.getPrice() %>/month</p>
            <p><%= h.getDescription() %></p>
            <div class="button-container">
                <a href="updatehome.jsp?id=<%= h.getId() %>">
                    <button>Update Home</button>
                </a>
                <a href="DeleteServlet?id=<%= h.getId() %>">
                    <button>Delete Home</button>
                </a>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>No homes found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
