<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>HomeHeaven - Find Your Stay</title>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

<style>

/* GLOBAL */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f5f5;
}

/* NAVBAR */
.navbar {
    background: white;
    padding: 18px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    position: sticky;
    top: 0;
    z-index: 10;
}
.navbar h2 {
    margin: 0;
    color: #e84c3d;
    font-size: 36px;
    font-weight: bold;
}
.nav-buttons a {
    margin-left: 20px;
    padding: 10px 18px;
    text-decoration: none;
    background: #2c3e50;
    color: white;
    border-radius: 6px;
}

/* HERO SECTION */
.hero {
    height: 420px;
    background: url('https://images.unsplash.com/photo-1600585154340-be6161a56a0c') no-repeat center/cover;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 40px;
    color: white !important;
    text-shadow: none !important;
}

.hero h1 {
    font-size: 50px;
    margin: 0;
    color: white !important;
}
.hero p {
    font-size: 20px;
    margin-top: 10px;
    color: white !important;
}

/* SEARCH AREA */
.search-box {
    width: 60%;
    margin-top: 30px;
    display: flex;
    position: relative;
}

.search-box input {
    width: 85%;
    padding: 14px 18px;
    font-size: 17px;
    border-radius: 50px;
    border: none;
    outline: none;
    background: white;
    color: black;
}

/* SEARCH BUTTON */
.search-btn {
    width: 15%;
    margin-left: 10px;
    background: #ff5722;
    color: white;
    border: none;
    border-radius: 50px;
    font-size: 16px;
    cursor: pointer;
}

/* Autocomplete */
.autocomplete-list {
    position: absolute;
    top: 52px;
    width: 85%;
    background: white;
    border-radius: 10px;
    box-shadow: 0 3px 8px rgba(0,0,0,0.2);
    z-index: 20;
    display: none;
}

.autocomplete-list div {
    padding: 10px 15px;
    cursor: pointer;
    color: black;
}
.autocomplete-list div:hover {
    background: #f0f0f0;
}

/* ENQUIRY FORM */
.enquiry {
    width: 50%;
    margin: 40px auto;
    padding: 40px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}
.enquiry input, .enquiry textarea {
    width: 100%;
    padding: 12px;
    border-radius: 6px;
    border: 1px solid #ccc;
    margin-top: 10px;
}
.enquiry button {
    padding: 12px 16px;
    background: #2ecc71;
    color: white;
    border: none;
    border-radius: 6px;
    margin-top: 10px;
    cursor: pointer;
}

/* FOOTER */
.footer {
    background: #2c3e50;
    color: white;
    text-align: center;
    padding: 20px;
    margin-top: 40px;
}
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>HomeHeaven</h2>
    <div class="nav-buttons">
        <a href="#enquiry">Contact</a>
        <a href="OwnerLogin.jsp">Owner Panel</a>
        <a href="UserLogin.jsp">User Panel</a>
        <a href="AdminLogin.jsp">Admin Panel</a>
    </div>
</div>

<!-- HERO + SEARCH -->
<div class="hero">

    <h1>Find Hostel, PG, Flats & Mess in Indore</h1>
    <p>Discover affordable and verified properties near you.</p>

    <!-- AUTOCOMPLETE SEARCH BAR -->
    <div class="search-box">
        <form action="FilterProperties.jsp" method="get" style="display:flex; width:100%;">
            
            <input type="text" id="locationInput" name="location"
                   placeholder="Search by area... (Vijay Nagar, Palasia, Rau)">

            <button class="search-btn">Search</button>

            <div class="autocomplete-list" id="suggestions"></div>
        </form>
    </div>

</div>

<!-- ENQUIRY FORM -->
<div class="enquiry" id="enquiry">
    <h2>Contact Us</h2>
    <form action="submitEnquiry" method="post">
        <input type="text" name="name" placeholder="Your Name" required/>
        <input type="email" name="email" placeholder="Your Email" required/>
        <textarea name="message" rows="4" placeholder="Your Message" required></textarea>
        <button>Send Enquiry</button>
    </form>
</div>

<!-- FOOTER -->
<div class="footer">
    © 2025 HomeHeaven | All Rights Reserved
</div>


<!-- AUTOCOMPLETE SCRIPT -->
<script>
const areas = [
    "Vijay Nagar", "Bhawarkuan", "Palasia", "Rau", "MR 10",
    "Scheme 78", "New Palasia", "Bangali Square", "Bholaram"
];

let input = document.getElementById("locationInput");
let suggestionBox = document.getElementById("suggestions");

input.addEventListener("keyup", function () {
    let text = this.value.toLowerCase();
    suggestionBox.innerHTML = "";
    suggestionBox.style.display = "none";

    if (text.length === 0) return;

    let matches = areas.filter(a => a.toLowerCase().includes(text));

    if (matches.length > 0) {
        suggestionBox.style.display = "block";
        matches.forEach(area => {
            let div = document.createElement("div");
            div.textContent = area;
            div.onclick = function () {
                input.value = area;
                suggestionBox.style.display = "none";
            };
            suggestionBox.appendChild(div);
        });
    }
});
</script>

</body>
</html>
