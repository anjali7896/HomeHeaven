// Add Home functionality
document.addEventListener('DOMContentLoaded', function() {
  // Add Home form submission
  document.getElementById('add-home-form').addEventListener('submit', function(e) {
    e.preventDefault();

    // Collect home data from the form
    const name = document.getElementById('home-name').value;
    const type = document.getElementById('property-type-add').value;
    const budget = document.getElementById('budget-add').value;
    const location = document.getElementById('location-add').value;
    const imagePath = document.getElementById('image-add').value;

    // Validate form inputs
    if (!validateForm(name, location, budget, imagePath)) {
      return; // Exit if validation fails
    }

    // Prepare the home data object to send to the server
    const newHome = {
      name: name,
      type: type,
      budget: budget,
      location: location,
      imagePath: imagePath,
      price: budget, // Assuming price equals the budget for simplicity
    };

    // Send data to the server (replace URL with actual endpoint)
    fetch('/AddHomeServlet', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(newHome),
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('Home added successfully!');
        loadHomes(); // Reload the home listings
      } else {
        alert('Failed to add home.');
      }
    })
    .catch(error => {
      console.error('Error adding home:', error);
      alert('An error occurred while adding the home.');
    });
  });
});

// Form Validation function
function validateForm(name, location, price, imagePath) {
  // Check if all fields are filled
  if (!name || !location || !price || !imagePath) {
    alert("All fields must be filled out.");
    return false; // Prevent form submission
  }

  // Additional validation for numeric fields (like price)
  if (isNaN(price) || price <= 0) {
    alert("Please enter a valid price.");
    return false;
  }

  return true; // Allow form submission if validation passes
}

// Load homes from server (you can also call this function after adding a new home)
function loadHomes() {
  fetch('/GetHomesServlet')  // Replace with your actual context path
    .then(response => response.json())
    .then(homes => {
      const listingSection = document.querySelector('.house-listing');
      // Clear any existing homes in the listing before adding new ones
      listingSection.innerHTML = '';

      homes.forEach(home => {
        const card = document.createElement('div');
        card.className = 'house-card';
        card.setAttribute('data-type', home.type);
        card.setAttribute('data-budget', home.budget);
        card.setAttribute('data-location', home.location);

        card.innerHTML = `
          <img src="${home.imagePath}" alt="${home.type}">
          <div class="details">
            <h3>${home.name}</h3>
            <p>₹${home.price}/month</p>
            <p>${home.location}, Indore</p>
            <p>Description not available.</p>
            <button class="view-details">View Details</button>
            <button class="contact-owner">Contact Owner</button>
          </div>
        `;
        listingSection.appendChild(card);
      });
    })
    .catch(error => console.error('Error fetching homes:', error));
}
