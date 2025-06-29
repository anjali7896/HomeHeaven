<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.models.home" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Homes</title>
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-around;
        }

        .card {
            border: 1px solid #ccc;
            padding: 20px;
            width: 250px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 8px;
            background: #fff;
            text-align: center;
        }

        .card img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 10px;
            border-radius: 8px;
        }

        .price {
            font-weight: bold;
            color: green;
            font-size: 1.2em;
        }

        .card h3 {
            margin: 10px 0;
        }

        .card p {
            font-size: 0.9em;
            color: #555;
        }

        .button, .contact-button {
            padding: 8px 15px;
            margin: 5px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button {
            background-color: #3498db;
        }

        .button:hover {
            background-color: #2980b9;
        }

        .delete-button {
            background-color: #e74c3c;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }

        .contact-button {
            background-color: #2ecc71;
        }

        .contact-button:hover {
            background-color: #27ae60;
        }

        .top-bar {
            margin-bottom: 20px;
            text-align: center;
        }

        .logout-link {
            float: right;
            margin-right: 30px;
            text-decoration: none;
            font-weight: bold;
            color: #3498db;
        }
    </style>
</head>
<body>

    <h1 style="text-align:center;">Available Homes for Rent</h1>

    <div class="card-container">
        <%
            List<home> homeList = (List<home>) request.getAttribute("homeList");

            if (homeList != null && !homeList.isEmpty()) {
                for (home h : homeList) {
        %>
        <div class="card">
            <img src="<%= request.getContextPath() + "/" + h.getImagePath() %>" alt="Home Image" />
            <h3><%= (h.getPropertyType() != null ? h.getPropertyType() : "Not Specified") %> in <%= h.getLocation() %></h3>
            <p class="price">₹<%= h.getPrice() %>/month</p>
            <p><%= h.getDescription() %></p>

            <form action="updatehome.jsp" method="get" style="display:inline;">
                <input type="hidden" name="id" value="<%= h.getId() %>" />
                <button class="button" type="submit">Update Home</button>
            </form>

            <form action="DeleteServlet" method="get" style="display:inline;">
                <input type="hidden" name="id" value="<%= h.getId() %>" />
                <button class="button delete-button" type="submit">Delete Home</button>
            </form>
        </div>
        <%
                } // end for loop
            } else {
        %>
        <p>No homes found.</p>
        <%
            } // end if
        %>
    </div>
</body>
</html>
