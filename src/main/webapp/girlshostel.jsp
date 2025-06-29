<!DOCTYPE html>
<html lang="en">
<head> 
<style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f0f2f5;
      color: #333;
    }

    .container {
      max-width: 900px;
      margin: 50px auto;
      background-color: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .property-image {
      width: 100%;
      height: auto;
      border-radius: 10px;
      margin-bottom: 25px;
    }

    h1 {
      font-size: 32px;
      color: #2c3e50;
      margin-bottom: 20px;
    }

    .details p {
      font-size: 18px;
      margin: 8px 0;
    }

    .description {
      margin-top: 20px;
      font-size: 17px;
      line-height: 1.6;
      color: #555;
    }

    .buttons {
      margin-top: 30px;
    }

    .buttons button {
      padding: 12px 25px;
      font-size: 16px;
      border: none;
      border-radius: 8px;
      margin-right: 15px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .back {
      background-color: #3498db;
      color: white;
    }

    .contact {
      background-color: #e74c3c;
      color: white;
    }

    .buttons button:hover {
      opacity: 0.9;
      transform: scale(1.03);
      }
      </style>
</head>
<body>
  <div class="container">
    <img src="girlshostel.jpg" alt="Girls Hostel" class="property-image" />
    <h1>Girls Hostel in Bhawarkuan</h1>
    <div class="details">
      <p><strong>Rent:</strong> 8,000/month</p>
      <p><strong>Location:</strong> Bhawarkuan, Indore</p>
    </div>
    <div class="description">
      Safe and well-maintained girls' hostel offering fully furnished rooms with 3 meals a day, high-speed internet, CCTV surveillance, and 24/7 security.
    </div>
    <div class="buttons">
      <button class="back" onclick="window.location.href='search.jsp'">Back to Listings</button>
      
    </div>
  </div>
</body>
</html>
