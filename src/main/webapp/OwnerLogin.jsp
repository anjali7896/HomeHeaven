<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner Login - HomeHeaven</title>

<style>
    body{
        margin:0;
        font-family:Arial;
        background:linear-gradient(135deg,#fff6d6,#d1eaff);
        height:100vh;
        display:flex;
        justify-content:center;
        align-items:center;
    }

    .card{
        width:410px;
        background:white;
        padding:60px;
        border-radius:14px;
        box-shadow:0 4px 25px rgba(0,0,0,0.2);
    }

    h2{
        text-align:center;
        margin-bottom:15px;
    }

    input{
        width:100%;
        padding:12px;
        margin:10px 0;
        border:1px solid #ccc;
        border-radius:8px;
    }

    button{
        width:100%;
        padding:12px;
        background:#4C8CF5;
        color:white;
        border:none;
        border-radius:10px;
        cursor:pointer;
        font-weight:bold;
    }

    .error{
        color:red;
        text-align:center;
        padding-bottom:10px;
    }
</style>

</head>
<body>

<div class="card">
    <h2>Owner Login</h2>

    <% if(request.getAttribute("error") != null){ %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

  <form action="${pageContext.request.contextPath}/login" method="post">
    <input name="email" type="email" placeholder="Email" required />
    <input name="password" type="password" placeholder="Password" required />
    <button type="submit">Login</button>
</form>
  
  

    <p style="text-align:center;margin-top:10px;">
        <a href="OwnerRegister.jsp">Create New Account</a>
    </p>
</div>

</body>
</html>
