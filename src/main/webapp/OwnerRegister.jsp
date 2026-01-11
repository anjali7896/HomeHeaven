<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Owner Registration - HomeHeaven</title>

<style>
    body{
        margin:0;
        font-family:Arial;
        background:linear-gradient(135deg,#d9f0ff,#fcefff,#e8ffe8);
        height:100vh;
        display:flex;
        align-items:center;
        justify-content:center;
    }

    .card{
        background:#ffffff;
        padding:50px 75px;
        border-radius:18px;
        width:480px;
        box-shadow:0 8px 40px rgba(0,0,0,0.15);
    }

    h2{
        text-align:center;
        font-size:28px;
        margin-bottom:15px;
        color:#333;
    }

    input, select{
        width:100%;
        padding:14px;
        margin:10px 0;
        border-radius:10px;
        border:1px solid #ccc;
        font-size:15px;
    }

    .row{
        display:flex;
        gap:10px;
    }

    button{
        width:100%;
        padding:15px;
        margin-top:15px;
        background:#4C8CF5;
        border:none;
        color:white;
        border-radius:10px;
        font-size:17px;
        font-weight:700;
        cursor:pointer;
    }

    .error{
        color:red;
        font-size:14px;
        text-align:center;
        margin-bottom:10px;
    }

    .success{
        color:green;
        font-size:14px;
        text-align:center;
        margin-bottom:10px;
    }
</style>

</head>
<body>

<div class="card">
    <h2>Owner Registration</h2>

    <!-- Server-side error display -->
    <% if(request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <% if(request.getParameter("success") != null) { %>
        <div class="success"><%= request.getParameter("success") %></div>
    <% } %>

    <form action="<%=request.getContextPath()%>/owner/register" 
          method="post" 
          onsubmit="return validate()">

        <input id="name" name="name" placeholder="Full Name" required />
        <input id="email" name="email" type="email" placeholder="Email" required />
        <input id="phone" name="phone" placeholder="Phone Number" maxlength="10" required />

        <label for="dob">Date of Birth</label>
        <input id="dob" name="dob" type="date" required />

        <div class="row">
            <select name="idType" required>
                <option value="">Select ID Type</option>
                <option value="Aadhar">Aadhar</option>
                <option value="PAN">PAN</option>
            </select>
            <input id="idNumber" name="idNumber" placeholder="Aadhar/PAN Number" required />
        </div>

        <input id="password" 
               name="password" 
               type="password" 
               placeholder="Password"
               required
               pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{6,}$"
               title="Password must contain: 1 uppercase, 1 lowercase, 1 number, 1 special symbol, and minimum 6 characters." />

        <input id="confirmPassword" name="confirmPassword" type="password" placeholder="Confirm Password" required />

        <div id="passError" class="error"></div>

        <button type="submit">Register</button>
          <!-- Back to login link -->
 <p style="text-align:center; margin-top:10px;">
    Already have an account? 
    <a href="<%=request.getContextPath()%>/OwnerLogin.jsp">Login here</a>
</p>
    </form>
</div>

<script>
function validate() {
    var password = document.getElementById("password").value;
    var confirm = document.getElementById("confirmPassword").value;
    var errorDiv = document.getElementById("passError");

    if(password !== confirm) {
        errorDiv.innerText = "Passwords do not match!";
        return false;
    }

    if(password.length < 6) {
        errorDiv.innerText = "Password must be at least 6 characters!";
        return false;
    }

    errorDiv.innerText = ""; // Clear error
    return true; // Allow submission
}
</script>

</body>
</html>
