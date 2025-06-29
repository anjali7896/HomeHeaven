<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298, #ff6f61, #ff4a3d);
            display: flex;
            justify-content: center;
            align-items: flex-start;
            height: 100vh;
            padding-top: 40px;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .login-container {
            background-color: white;
            padding: 30px 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-container label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            text-align: left;
        }

        .login-container input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: rgb(2, 2, 57);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .login-container button:hover {
            background-color: darkblue;
        }

        .login-container .signup-link {
            margin-top: 15px;
            display: block;
            color: blue;
            text-decoration: none;
        }

        .login-container .signup-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Update Profile</h2>
    <form action="UpdateProfileServlet" method="post">
        <!-- Pre-fill with user's current data, checking for null or empty values -->
        <label for="email">Email ID</label>
        <input type="email" name="email" id="email" 
            value="<%= session.getAttribute("userEmail") != null ? session.getAttribute("userEmail") : "" %>" required>

        <label for="phone">Phone Number</label>
        <input type="tel" name="phone" id="phone" 
            value="<%= session.getAttribute("userPhone") != null ? session.getAttribute("userPhone") : "" %>" 
            required pattern="[0-9]{10}" title="Enter 10-digit phone number">

        <button type="submit">Update</button>
    </form>
    <a href="profile.jsp" class="signup-link">Back to Profile</a>
</div>
</body>
</html>
