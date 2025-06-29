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
        <img src="girlspg.jpg" alt="PG for Girls" class="property-image" />
        <h1>PG for Girls in Vijay Nagar</h1>
        <div class="details">
            <p><strong>Rent:</strong>6,500/month</p>
            <p><strong>Location:</strong> Vijay Nagar, Indore</p>
        </div>
        <div class="description">
            Safe and secure PG with meals and Wi-Fi included. Convenient location near bus stops and shopping areas.
        </div>
        <div class="buttons">
            <button class="back" onclick="window.location.href='search.jsp'">Back to Listings</button>
        </div>
    </div>
</body>
</html>
