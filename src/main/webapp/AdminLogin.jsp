<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
body { font-family: Arial; background: #f3f6fa; margin:0; padding:0; }
.container { max-width:400px; margin:100px auto; background:white; padding:20px; border-radius:10px; }
input { width:100%; padding:10px; margin:10px 0; border-radius:6px; border:1px solid #ccc; }
button { padding:10px; width:100%; border:none; border-radius:6px; background:#e84c3d; color:white; cursor:pointer; }
.error { color:red; text-align:center; }
</style>
</head>
<body>

<div class="container">
    <h2 style="text-align:center;">Admin Login</h2>
    <form action="AdminLoginServlet" method="post">
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>
    <% String error = request.getParameter("error");
       if(error != null){ %>
       <p class="error">Invalid email or password!</p>
    <% } %>
</div>

</body>
</html>
