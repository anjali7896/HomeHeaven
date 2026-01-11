<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Owner Profile</title>
<style>
    body { margin:0; padding:0; background:#eef3fc; font-family:Arial; display:flex; justify-content:center; align-items:center; height:100vh; }
    .box { width:420px; background:white; padding:25px; border-radius:12px; box-shadow:0 4px 20px rgba(0,0,0,0.15); }
    input { width:100%; padding:12px; margin:8px 0; border-radius:8px; border:1px solid #ccc; }
    button { width:100%; padding:12px; margin-top:15px; background:#4c6ef5; color:white; border:none; border-radius:8px; font-weight:bold; cursor:pointer; }
    .error { color:red; text-align:center; }
</style>
</head>
<body>
<div class="box">
    <h2>Update Profile</h2>

    <% if(request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="<%=request.getContextPath()%>/update" method="post">
        <input type="hidden" name="id" value="<%= request.getAttribute("id") %>" />
        <input type="text" name="name" value="<%= request.getAttribute("name") %>" placeholder="Full Name" required />
        <input type="email" name="email" value="<%= request.getAttribute("email") %>" placeholder="Email" required />
        <input type="text" name="phone" value="<%= request.getAttribute("phone") %>" placeholder="Phone" required />
        <input type="date" name="dob" value="<%= request.getAttribute("dob") %>" required />
        <input type="text" name="id_type" value="<%= request.getAttribute("id_type") %>" placeholder="ID Type" required />
        <input type="text" name="id_number" value="<%= request.getAttribute("id_number") %>" placeholder="ID Number" required />
        <input type="password" name="password" placeholder="New Password (leave blank if no change)" />
<input type="password" name="confirmPassword" placeholder="Confirm Password" />
        
        <button type="submit">Update Profile</button>
    </form>
</div>
</body>
</html>
