<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298, #ff6f61, #ff4a3d);
            display: flex;
            justify-content: center;
            align-items: flex-start; /* changed from center to flex-start */
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
    <h2>Register</h2>
    <form action="register" method="post">
        <label for="fullname">Full Name</label>
        <input type="text" name="fullname" id="fullname" required>

        <label for="email">Email ID</label>
        <input type="email" name="email" id="email" required>

        <label for="password">Password</label>
        <input type="password" name="password" id="password" required>

        <label for="confirmPassword">Confirm Password</label>
        <input type="password" name="confirmPassword" id="confirmPassword" required>

        <label for="dob">Date of Birth</label>
        <input type="date" name="dob" id="dob" required>

        <label for="aadhar">Aadhar Number</label>
        <input type="text" name="aadhar" id="aadhar" required>

        <label for="phone">Phone Number</label>
        <input type="tel" name="phone" id="phone" required pattern="[0-9]{10}" title="Enter 10-digit phone number">

        <button type="submit">Register</button>
    </form>
    <a href="login1.jsp" class="signup-link">Already have an account? Login</a>
</div>
</body>
</html>
