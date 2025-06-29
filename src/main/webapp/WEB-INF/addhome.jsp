<!DOCTYPE html>
<html>
<head><title>Add Home</title></head>
<body>
    <h2>Add New Property</h2>
    <form action="addHome" method="post" enctype="multipart/form-data">
        Property Type: <input type="text" name="propertyType" required><br>
        Price: <input type="number" name="price" required><br>
        Location: <input type="text" name="location" required><br>
        Description: <textarea name="description" required></textarea><br>
        Upload Image: <input type="file" name="image" accept="image/*" required><br>
        <input type="submit" value="Add Home">
    </form>
    <p style="color:red;"><%= request.getParameter("error") != null ? request.getParameter("error") : "" %></p>
</body>
</html>
