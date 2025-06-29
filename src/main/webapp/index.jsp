<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home Heaven - House Rental</title>
  <link rel="stylesheet" href="index1.css">
</head>
<body>
  <!-- Navbar -->
  <nav class="navbar">
    <div class="logo">Home Heaven</div>
    <ul class="nav-links">
      <div class="right-options">
        <a href="login1.jsp" class="option-link">Tenants/Buyers</a>
        <a href="login1.jsp" class="option-link">Owners</a> <!-- Link to login.html -->
        <a href="contact.jsp" class="option-link contact">Contact</a>
      </div>
    </ul>
  </nav>

  <!-- Hero Section with Background Image and Search Bar -->
  <section class="hero">
    <div class="search-container">
      <h1>Find Your Dream Home</h1>
      <form action="search.jsp" method="get"> <!-- Form will redirect to search.html -->
        <input type="text" placeholder="Search for city..." name="city">
        <button type="submit">Search</button> <!-- Submit button -->
      </form>
    </div>
  </section>
  <script src="script.js"></script>
</body>
</html>