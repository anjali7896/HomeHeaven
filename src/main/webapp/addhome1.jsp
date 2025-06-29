<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Owner Dashboard</title>
  <style>
    * {
      box-sizing: border-box;
    }
    body {
      font-family: Arial, sans-serif;
      background: #f0f2f5;
      margin: 0;
      padding: 0;
    }
    .navbar {
      background-color: #2c3e50;
      color: white;
      padding: 15px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .navbar div {
      font-size: 20px;
      font-weight: bold;
    }
    .navbar a {
      color: white;
      margin-left: 20px;
      text-decoration: none;
      font-weight: bold;
    }
    .navbar a:hover {
      text-decoration: underline;
    }
    .container {
      max-width: 800px;
      margin: 40px auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h2 {
      margin-bottom: 20px;
    }
    input, select, textarea {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
    }
    button {
      background-color: #27ae60;
      color: white;
      border: none;
      padding: 12px 20px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }
    button:hover {
      background-color: #219150;
    }
  </style>
</head>
<body>
  <div class="navbar">
    <div>Owner Dashboard</div>
    <div>
      <a href="updateprofile.jsp">Update Profile</a>
      <a href="HomeListServlet">View My Homes</a>
      <a href="LogoutServlet">Logout</a>
    </div>
  </div>

  <div class="container">
    <h2>Add Home</h2>

    <%-- Remove ownerId logic (no need for session or hidden input for ownerId) --%>

    <form action="AddHomeServlets" method="post" enctype="multipart/form-data">
      <label for="propertyType">Property Type:</label>
      <select name="propertyType" required>
        <option value="PG">PG</option>
        <option value="1 BHK">1 BHK</option>
        <option value="2 BHK">2 BHK</option>
        <option value="3 BHK">3 BHK</option>
      </select>

      <label for="price">Price:</label>
      <input type="number" name="price" required>

      <label for="location">Location:</label>
      <input type="text" name="location" required>

      <label for="description">Description:</label>
      <textarea name="description" required></textarea>

      <label for="file">Upload Image:</label>
      <input type="file" name="file" accept="image/*" required>
       

      <button type="submit">Add Home</button>
    </form>
  </div>
</body>
</html>
