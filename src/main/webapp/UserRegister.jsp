<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Registration</title>
<style>
body { font-family: Arial; background: #f3f6fa; margin:0; padding:0;}
.container { max-width:400px; margin:50px auto; background:white; padding:20px; border-radius:10px; }
input { width:100%; padding:10px; margin:10px 0; border-radius:6px; border:1px solid #ccc; }
button { padding:10px; width:100%; border:none; border-radius:6px; background:#2c3e50; color:white; cursor:pointer; }
</style>
</head>
<body>

<div class="container">
    <h2>User Registration</h2>
    <form action="UserRegistrationServlet" method="post">
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Register</button>
    </form>
    <p style="text-align:center;">Already have an account? <a href="UserLogin.jsp">Login</a></p>
</div>

</body>
</html>
