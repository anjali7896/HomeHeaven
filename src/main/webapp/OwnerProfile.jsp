<!DOCTYPE html>
<html>
<head>
<title>Owner Profile</title>
<style>
    body { margin:0; padding:0; background:#eef3fc; font-family:Arial; display:flex; justify-content:center; align-items:center; height:100vh; }
    .box { width:420px; background:white; padding:25px; border-radius:12px; box-shadow:0 4px 20px rgba(0,0,0,0.15); text-align:center; }
    .info { text-align:left; margin-top:20px; font-size:15px; }
    .btn { margin-top:15px; display:inline-block; padding:10px 18px; background:#4c6ef5; color:white; border-radius:8px; text-decoration:none; margin-right:8px; }
    .logout { background:#e63946; }
</style>
</head>
<body>
<div class="box">
    <h2>Owner Profile</h2>
    <div class="info">
        <p><b>Name:</b> ${name}</p>
        <p><b>Email:</b> ${email}</p>
        <p><b>Phone:</b> ${phone}</p>
        <p><b>DOB:</b> ${dob}</p>
        <p><b>ID Type:</b> ${id_type}</p>
        <p><b>ID Number:</b> ${id_number}</p>
    </div>

    <a href="${pageContext.request.contextPath}/update" class="btn">Update Profile</a>
    <a href="${pageContext.request.contextPath}/logout" class="btn logout">Logout</a>
</div>
</body>
</html>
