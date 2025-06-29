<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="post">
            <label for="email">Email ID</label>
            <input type="text" id="email" name="email" required>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

           
           
            <button type="submit">Login</button>
        </form>
        <a class="signup-link" href="signup.jsp">Don't have an account? Create one</a>
    </div>
</body>
</html>
