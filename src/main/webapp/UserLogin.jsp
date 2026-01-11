<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Login</title>
<style>
body { font-family: Arial; background: #f3f6fa; margin:0; padding:0;}
.container { max-width:400px; margin:50px auto; background:white; padding:20px; border-radius:10px; }
input { width:100%; padding:10px; margin:10px 0; border-radius:6px; border:1px solid #ccc; }
button { padding:10px; width:100%; border:none; border-radius:6px; background:#2c3e50; color:white; cursor:pointer; }
</style>
</head>
<body>

<div class="container">
    <h2>User Login</h2>
    <form action="UserLoginServlet" method="post">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>
    <p style="text-align:center;">Don't have an account? <a href="UserRegister.jsp">Register</a></p>
</div>

</body>
</html>
