<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Property</title>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

    <style>
        body { font-family: Arial; background:#eef3fc; padding:20px; }
        .container { width:700px; margin:auto; background:#fff; padding:25px; border-radius:12px; }
        input, select, textarea { width:100%; padding:10px; margin:8px 0; border-radius:8px; border:1px solid #ccc; }
        #map { height:350px; width:100%; border-radius:10px; margin-top:10px; }
        button { padding:12px; width:100%; background:#4C8CF5; color:white; border:none; border-radius:10px; cursor:pointer; }
        button:hover { background:#3b6fce; }

        .hidden { display:none; }
        h3 { margin-top: 30px; }
    </style>
</head>

<body>

<div class="container">

<h2>Add Property</h2>

<form action="<%=request.getContextPath()%>/AddPropertyServlet" method="post" enctype="multipart/form-data">

    <!-- PROPERTY TYPE -->
    <label>Property Type</label>
    <select name="propertyType" id="propertyType" required>
        <option value="">Select</option>
        <option value="Hostel">Hostel</option>
        <option value="PG">PG</option>
        <option value="Flat">Flat</option>
        <option value="Mess">Mess</option>
        <option value="Tiffin">Tiffin Center</option>
    </select>

    <!-- HOSTEL / PG -->
    <div id="roomTypeDiv" class="hidden">
        <label>Room Type</label>
        <select name="roomType">
            <option value="">None</option>
            <option value="Single Seater">Single Seater</option>
            <option value="Two Seater">Two Seater</option>
            <option value="Three Seater">Three Seater</option>
        </select>
    </div>

    <!-- FLAT -->
    <div id="bhkTypeDiv" class="hidden">
        <label>BHK Type</label>
        <select name="bhkType">
            <option value="">None</option>
            <option value="1 BHK">1 BHK</option>
            <option value="2 BHK">2 BHK</option>
            <option value="3 BHK">3 BHK</option>
        </select>
    </div>

    <!-- MESS FIELDS -->
    <div id="messFields" class="hidden">
        <h3>Mess Details</h3>

        <label>Food Type</label>
        <select name="foodType">
            <option value="">Select</option>
            <option value="Veg">Veg</option>
            <option value="Non-Veg">Non-Veg</option>
            <option value="Both">Both</option>
        </select>

        <label>Meals Per Day</label>
        <select name="mealsPerDay">
            <option value="">Select</option>
            <option value="2 Meals">2 Meals</option>
            <option value="3 Meals">3 Meals</option>
        </select>

        <label>Seating Capacity</label>
        <input type="number" name="seatingCapacity" placeholder="e.g., 40">
    </div>

    <!-- TIFFIN CENTER FIELDS -->
    <div id="tiffinFields" class="hidden">
        <h3>Tiffin Center Details</h3>

        <label>Food Type</label>
        <select name="foodType">
            <option value="">Select</option>
            <option value="Veg">Veg</option>
            <option value="Non-Veg">Non-Veg</option>
            <option value="Both">Both</option>
        </select>

        <label>Tiffin Plan</label>
        <select name="tiffinPlan">
            <option value="">Select</option>
            <option value="Monthly">Monthly</option>
            <option value="Weekly">Weekly</option>
            <option value="Daily">Daily</option>
        </select>
    </div>

    <label>Description</label>
    <textarea name="description" rows="4"></textarea>

    <label>Price (Per Month / Per Plate)</label>
    <input type="number" name="price" required />

    <label>Services Provided</label>
    <textarea name="services" placeholder="WiFi, Food, Laundry..."></textarea>

    <label>Full Address</label>
    <textarea name="address" rows="2" required placeholder="Street, Area, Indore"></textarea>

    <label>Upload Images</label>
    <input type="file" name="images" multiple required />

    <!-- MAP -->
    <h3>Select Location on Map</h3>
    <div id="map"></div>

    <input type="text" id="lat" name="latitude" placeholder="Latitude" required />
    <input type="text" id="lng" name="longitude" placeholder="Longitude" required />

    <button type="submit">Add Property</button>
</form>

</div>

<script>
    // SHOW / HIDE FIELDS BASED ON PROPERTY TYPE
    document.getElementById("propertyType").addEventListener("change", function() {
        let type = this.value;

        document.getElementById("roomTypeDiv").classList.add("hidden");
        document.getElementById("bhkTypeDiv").classList.add("hidden");
        document.getElementById("messFields").classList.add("hidden");
        document.getElementById("tiffinFields").classList.add("hidden");

        if (type === "Hostel" || type === "PG") {
            document.getElementById("roomTypeDiv").classList.remove("hidden");
        }
        if (type === "Flat") {
            document.getElementById("bhkTypeDiv").classList.remove("hidden");
        }
        if (type === "Mess") {
            document.getElementById("messFields").classList.remove("hidden");
        }
        if (type === "Tiffin") {
            document.getElementById("tiffinFields").classList.remove("hidden");
        }
    });


    // MAP SCRIPT
    let defaultLat = 22.7196;
    let defaultLng = 75.8577;

    let map = L.map('map').setView([defaultLat, defaultLng], 13);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);

    let marker = L.marker([defaultLat, defaultLng], {draggable:true}).addTo(map);

    marker.on('dragend', function(e){
        let pos = marker.getLatLng();
        document.getElementById('lat').value = pos.lat;
        document.getElementById('lng').value = pos.lng;
    });

    map.on('click', function(e){
        marker.setLatLng(e.latlng);
        document.getElementById('lat').value = e.latlng.lat;
        document.getElementById('lng').value = e.latlng.lng;
    });
</script>

</body>
</html>
