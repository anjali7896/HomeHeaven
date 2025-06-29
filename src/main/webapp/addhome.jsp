<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Home - Home Heaven</title>
  <style>
    /* Overall page background color */
    body {
        background: linear-gradient(to right, #f8c8d0, #1e88e5); /* Soft Pink background */
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    /* Container for the form */
    section.add-home {
        background-color:white ;/* Light Blue background for the form */
      max-width: 600px;
      margin: 50px auto;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* Form title */
    h2 {
      text-align: center;
      color: #1e88e5; /* Blue title color */
    }

    /* Form inputs and labels */
    label {
      font-weight: bold;
      color: #333;
      margin-bottom: 5px;
      display: block;
    }

    input[type="text"],
    input[type="number"],
    select,
    input[type="file"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-sizing: border-box;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    select:focus,
    input[type="file"]:focus {
      border-color: #1e88e5; /* Blue border when focused */
    }

    /* Submit button style */
    button {
      background-color: #1e88e5; /* Blue button background */
      color: white;
      border: none;
      padding: 12px 25px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      width: 100%;
    }

    button:hover {
      background-color: #1976d2; /* Darker blue on hover */
    }
  </style>
</head>
<body>

  <section class="add-home">
    <h2>Add New Home</h2>
    <form id="addHomeForm" action="AddHomeServlet" method="POST" enctype="multipart/form-data">
      <label for="home-name">Home Name</label>
      <input type="text" id="home-name" name="homeName" required>

      <label for="location">Location</label>
      <input type="text" id="location" name="location" required>

      <label for="price">Price (₹)</label>
      <input type="number" id="price" name="price" required>

      <label for="home-image">Upload Image</label>
      <input type="file" id="home-image" name="homeImage" accept="image/*" required>

      <label for="home-type">Home Type</label>
      <select id="home-type" name="homeType" required>
        <option value="2bhk">2 BHK</option>
        <option value="3bhk">3 BHK</option>
        <option value="1bhk">1 BHK</option>
      </select>

      <label for="home-budget">Budget</label>
      <select id="home-budget" name="homeBudget" required>
        <option value="10000-20000">₹10,000 - ₹20,000</option>
        <option value="20000-30000">₹20,000 - ₹30,000</option>
        <option value="30000+">₹30,000+</option>
      </select>

      <button type="submit">Add Home</button>
    </form>
  </section>

  <script src=search.js></script>
</body>
</html>
