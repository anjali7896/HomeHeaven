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

        h1 {
            font-size: 32px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .contact-info {
            margin-bottom: 30px;
        }

        .contact-info p {
            font-size: 18px;
            margin: 10px 0;
        }

        .contact-buttons {
            margin-top: 30px;
        }

        .contact-buttons a {
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            margin-right: 15px;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .call {
            background-color: #3498db;
            color: white;
        }

        .whatsapp {
            background-color: #25d366;
            color: white;
        }

        .message {
            background-color: #e74c3c;
            color: white;
        }

        .contact-buttons a:hover {
            opacity: 0.9;
            transform: scale(1.03);
        }

        .form-section {
            margin-top: 30px;
        }

        .form-section textarea {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 10px;
        }

        .form-section button {
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-section button:hover {
            opacity: 0.9;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Contact</h1>
        
        <div class="contact-info">
            <p><strong>Phone Number:</strong> +91 9876543210</p>
            <p><strong>Email:</strong>anjalitanwar@123gmail.com</p>
            <p><strong>Location:</strong> Vijay Nagar, Indore</p>
        </div>

        <div class="contact-buttons">
            <!-- Call Button -->
            <a href="tel:+919876543210" class="call">Call</a>
            
            <!-- WhatsApp Button (Pre-filled message) -->
            <a href="919876543210?text=Hello%20I%20am%20interested%20in%20your%20PG%20for%20girls%20listing." class="whatsapp">WhatsApp</a>
            
            <!-- Email Message Button (Mailto link) -->
            <a href="mailto:"anjalitanwar@123gmail.com class="message">Send Email</a>
        </div>

        <div class="form-section">
            <h2>Send a Message</h2>
            <form action="send_message.jsp" method="POST">
                <textarea name="message" rows="6" placeholder="Enter your message here..."></textarea>
                <button type="submit">Send Message</button>
            </form>
        </div>
    </div>
</body>
</html>
