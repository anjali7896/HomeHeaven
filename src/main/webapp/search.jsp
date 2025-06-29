<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Search Properties - Home Heaven</title>
  <link rel="stylesheet" href="search.css" />
</head>
<body>

  <!-- Search Bar Section -->
  <section class="search-hero">
    <div class="search-filter">
      <h2>Find Your Perfect Home</h2>
      <div class="filters">
        <select id="property-type">
          <option value="all">Property Type</option>
          <option value="pg-girls">PG (Girls)</option>
          <option value="pg-boys">PG (Boys)</option>
          <option value="1bhk">1 BHK</option>
          <option value="hostel-girls">Hostel (Girls)</option>
          <option value="hostel-boys">Hostel (Boys)</option>
          <option value="2bhk">2 BHK</option>
          <option value="3bhk">3 BHK</option>
        </select>
        <select id="budget">
          <option value="all">Budget</option>
          <option value="5000-10000">₹5,000 - ₹10,000</option>
          <option value="10000-20000">₹10,000 - ₹20,000</option>
          <option value="20000-50000">₹20,000 - ₹50,000</option>
        </select>
        <select id="location">
          <option value="all">Location</option>
          <option value="vijay-nagar">Vijay Nagar</option>
          <option value="sapna-sangeeta">Sapna Sangeeta</option>
          <option value="south-tukoganj">South Tukoganj</option>
        </select>
        <button id="search-btn">Search</button>
      </div>
    </div>
  </section>

  <!-- City Name Display -->
  <section>
    <h3 id="city-name"></h3>
  </section>

  <!-- House Listing Section -->
  <section class="house-listing">
    <div class="house-card" data-type="1bhk" data-budget="5000-10000" data-location="vijay-nagar">
      <img src="1bhk.jpg" alt="1 BHK">
      <div class="details">
        <h3>1 BHK in Vijay Nagar</h3>
        <p>8,000/month</p>
        <p>Vijay Nagar, Indore</p>
        <p>Spacious 1 BHK apartment with modern amenities.</p>
       <button class="view-details" onclick="window.location.href='1bhkinvijay.jsp';">View Details</button>
       
        <button class="contact-owner">Contact Owner</button>
      </div>
    </div>
    
    
   <div class="house-card" data-type="2bhk" data-budget="10000-20000" data-location="sapna-sangeeta">
      <img src="2bhk.jpg" alt="House 2">
      <div class="details">
        <h3>2 BHK in Sapna Sangeeta</h3>
        <p>15,000/month</p>
        <p>Sapna Sangeeta, Indore</p>
        <p>Well-furnished 2 BHK flat with a balcony, perfect for families.</p>
        <button class="view-details" onclick="window.location.href='2bhk.jsp';">View Details</button>
       
        <button class="contact-owner">Contact Owner</button>
      </div>
    </div>

    <div class="house-card" data-type="3bhk" data-budget="20000-50000" data-location="south-tukoganj">
      <img src="3bhk.jpg" alt="House 3">
      <div class="details">
        <h3>3 BHK in South Tukoganj</h3>
        <p>25,000/month</p>
        <p>South Tukoganj, Indore</p>
        <p>Luxurious 3 BHK apartment with a modular kitchen and parking space.</p>
        <button class="view-details" onclick="window.location.href='south.jsp';">View Details</button>
        <button class="contact-owner">Contact Owner</button>
      </div>
    </div>

    <!-- New Listings Added Below -->

    <div class="house-card" data-type="pg-girls" data-budget="5000-10000" data-location="vijay-nagar">
      <img src="girlspg.jpg" alt="PG Girls">
      <div class="details">
        <h3>PG for Girls in Vijay Nagar</h3>
        <p>6,500/month</p>
        <p>Vijay Nagar, Indore</p>
        <p>Safe and secure PG with meals and Wi-Fi included.</p>
       <button class="view-details" onclick="window.location.href='girlpg.jsp';">View Details</button>
        <button class="contact-owner">Contact Owner</button>
      </div>
    </div>

    <div class="house-card" data-type="pg-boys" data-budget="5000-10000" data-location="sapna-sangeeta">
      <img src="boyspg.jpg" alt="PG Boys">
      <div class="details">
        <h3>PG for Boys in Sapna Sangeeta</h3>
        <p>7,000/month</p>
        <p>Sapna Sangeeta, Indore</p>
        <p>Comfortable and budget-friendly PG with AC and attached bathroom.</p>
 <button class="view-details" onclick="window.location.href='boys-pg.jsp';">View Details</button>
 <button class="contact-owner">Contact Owner</button>
      </div>
    </div>

    <div class="house-card" data-type="hostel-girls" data-budget="5000-10000" data-location="south-tukoganj">
      <img src="girlshostel.jpg" alt="Hostel Girls">
      <div class="details">
        <h3>Girls Hostel in Bhawarkuan</h3>
        <p>8,000/month</p>
        <p>Bhawarkuan, Indore</p>
        <p>Clean and peaceful hostel with security, mess, and study area.</p>
       <button class="view-details" onclick="window.location.href='girlshostel.jsp';">View Details</button>
        <button class="contact-owner">Contact Owner</button>
      </div>
    </div>

  <!-- Tenant Login Modal -->
  <div id="loginModal" class="modal" style="display:none;">
    <div class="modal-content">
      <span class="close-btn" onclick="closeLoginModal()">&times;</span>
      <h2>Login to Contact Owner</h2>
      <input type="text" id="login-username" placeholder="Username"><br><br>
      <input type="password" id="login-password" placeholder="Password"><br><br>
      <button onclick="handleLogin()">Login</button>
    </div>
  </div>

  <!-- Modal Styling (if not using external css for modal) -->
  <style>
    .modal {
      position: fixed; top: 0; left: 0;
      width: 100%; height: 100%;
      background: rgba(0, 0, 0, 0.5);
      display: flex; justify-content: center; align-items: center;
      z-index: 999;
    }
    .modal-content {
      background: white;
      padding: 30px;
      border-radius: 10px;
      text-align: center;
      width: 300px;
      position: relative;
    }
    .close-btn {
      position: absolute;
      top: 10px; right: 15px;
      font-size: 20px;
      cursor: pointer;
    }
  </style>

  <!-- JavaScript -->
  <script>
    // Get city name from URL and display it
    const urlParams = new URLSearchParams(window.location.search);
    const city = urlParams.get('city');
    if (city) {
      document.getElementById('city-name').textContent = `You searched for: ${city}`;
    }

    // Filter search results
    document.getElementById('search-btn').addEventListener('click', function () {
      const propertyType = document.getElementById('property-type').value;
      const budget = document.getElementById('budget').value;
      const location = document.getElementById('location').value;

      const houseCards = document.querySelectorAll('.house-card');

      houseCards.forEach(card => {
        const cardType = card.getAttribute('data-type');
        const cardBudget = card.getAttribute('data-budget');
        const cardLocation = card.getAttribute('data-location');

        const typeMatch = propertyType === 'all' || cardType === propertyType;
        const budgetMatch = budget === 'all' || cardBudget === budget;
        const locationMatch = location === 'all' || cardLocation === location;

        if (typeMatch && budgetMatch && locationMatch) {
          card.style.display = 'block';
        } else {
          card.style.display = 'none';
        }
      });
    });

    // Show login modal on Contact Owner click
    document.querySelectorAll('.contact-owner').forEach(button => {
      button.addEventListener('click', () => {
        document.getElementById('loginModal').style.display = 'flex';
      });
    });

    // Close modal
    function closeLoginModal() {
      document.getElementById('loginModal').style.display = 'none';
    }

    // Simulate login and redirect
    function handleLogin() {
      const username = document.getElementById('login-username').value;
      const password = document.getElementById('login-password').value;

      if (username && password) {
        alert("Login successful!");
        closeLoginModal();
        window.location.href = "contact.jsp"; // Redirect after login
      } else {
        alert("Please enter both username and password.");
      }
    }
  </script>
</body>
</html>
