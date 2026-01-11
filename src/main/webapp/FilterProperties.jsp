<%@ page import="java.util.*, HomeHeavenmodel.Property" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Search Properties - HomeHeaven</title>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
<style>
body { margin: 0; font-family: Arial, sans-serif; background: #f3f6fa; }

/* Navbar */
.navbar { background: white; padding: 18px 40px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 5px rgba(0,0,0,0.1); position: sticky; top: 0; z-index: 10; }
.navbar h2 { margin: 0; color: #e84c3d; font-size: 36px; font-weight: bold; }
.nav-buttons a { margin-left: 20px; padding: 10px 18px; text-decoration: none; background: #2c3e50; color: white; border-radius: 6px; }

/* Hero Section */
.hero { height: 300px; background: linear-gradient(90deg,#dfe9f3,#ffffff); padding: 40px; color: #2c3e50; text-align:center; display: flex; flex-direction: column; justify-content: center; }
.hero h1 { margin: 0; font-size: 48px; font-weight: bold; }
.hero p  { font-size: 20px; margin-top: 10px; }

/* Filter Box */
.filter-box {
    width: 80%;
    background: white;
    margin: -60px auto 40px auto;
    padding: 20px 30px;
    border-radius: 14px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

.filter-form {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
    align-items: flex-end;
}

.filter-field {
    display: flex;
    flex-direction: column;
    flex: 1 1 200px;
}

.filter-field label {
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}

.filter-field input,
.filter-field select {
    padding: 10px;
    border-radius: 6px;
    border: 1px solid #ccc;
    width: 100%;
}

.search-btn {
    padding: 10px 18px;
    background: #e84c3d;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

/* Property Cards */
.cards-container { display: flex; flex-wrap: wrap; gap: 20px; padding: 20px 10%; justify-content: center; }
.card { flex: 0 0 300px; box-sizing: border-box; background: white; border-radius: 10px; overflow: hidden; transition: transform 0.3s, box-shadow 0.3s; display: flex; flex-direction: column; }
.card:hover { transform: scale(1.03); box-shadow:0 4px 20px rgba(0,0,0,0.2); }
.card img { width: 100%; height: 180px; object-fit: cover; border-bottom: 1px solid #eee; }
.card-body { padding:15px; flex:1; display:flex; flex-direction: column; justify-content: space-between; }
.card-body h3 { margin:0; font-size:20px; color:#2c3e50; }
.card-body p { margin:4px 0; color:#555; font-size:14px; }
.btn-group { margin-top:10px; display:flex; justify-content:space-between; }
.btn { padding:6px 10px; border-radius:6px; text-decoration:none; color:white; font-size:13px; }
.map-btn { background:#0984e3; }
.info-btn { background:#e84c3d; }

/* Footer */
.footer { background:#2c3e50; color:white; text-align:center; padding:20px; margin-top:40px; }

/* Autocomplete */
.autocomplete-items { position: absolute; background: #fff; border: 1px solid #ddd; border-top: none; z-index: 9999; max-height: 200px; overflow-y: auto; }
.autocomplete-items div { padding: 10px; cursor: pointer; }
.autocomplete-items div:hover { background: #eaeaea; }
</style>
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>HomeHeaven</h2>
    <div class="nav-buttons">
        <a href="index.jsp">Home</a>
        <a href="AdminDashboard.jsp">Admin Panel</a>
        <a href="UserDashboard.jsp">User Panel</a>
        <a href="OwnerLogin.jsp">Owner Panel</a>
    </div>
</div>

<!-- HERO -->
<div class="hero">
    <h1>Find Your Perfect Stay in Indore</h1>
    <p>Hostels, PGs, Flats, Mess and Tiffin Centres</p>
</div>

<!-- FILTER BOX -->
<div class="filter-box">
    <form action="properties" method="get" autocomplete="off" class="filter-form">
        <div class="filter-field">
            <label for="type">Property Type</label>
            <select name="type" id="type">
                <option value="">Select Type</option>
                <option value="Hostel">Hostel</option>
                <option value="PG">PG</option>
                <option value="Flat">Flat</option>
                <option value="Mess">Mess</option>
                <option value="Tiffin">Tiffin</option>
            </select>
        </div>
        <div class="filter-field" style="position: relative;">
            <label for="areaInput">Search Area</label>
            <input type="text" id="areaInput" name="area" placeholder="Enter area">
            <div id="areaList" class="autocomplete-items"></div>
        </div>
        <div class="filter-field">
            <label for="maxPrice">Max Budget</label>
            <input type="number" name="maxPrice" id="maxPrice" placeholder="Enter budget">
        </div>
        <div class="filter-field" style="align-self:flex-end;">
            <button type="submit" class="search-btn">Search</button>
        </div>
    </form>
</div>

<!-- PROPERTY CARDS -->
<div class="cards-container">
<%
    List<Property> properties = (List<Property>) request.getAttribute("properties");
    if(properties == null || properties.isEmpty()){
%>
    <h2 style="text-align:center; width:100%;">No Properties Found</h2>
<%
    } else {
        for(Property p : properties){
            String img = (p.getImages() != null && !p.getImages().isEmpty()) 
                         ? "property_images/" + p.getImages().get(0)
                         : "https://source.unsplash.com/400x300/?room,interior";
%>
    <div class="card">
        <img src="<%= img %>" alt="Property Image">
        <div class="card-body">
            <h3><%= p.getPropertyType() %> - Rs.<%= p.getPrice() %></h3>
            <p><b>Address:</b> <%= p.getAddress() != null ? p.getAddress() : "-" %></p>
            <p><b>Description:</b> <%= p.getDescription() != null ? p.getDescription() : "-" %></p>

            <%-- Display Mess & Tiffin info properly --%>
            <%
                String type = p.getPropertyType();
                if("Mess".equalsIgnoreCase(type)){
            %>
                <p><b>Meals per Day:</b> <%= p.getMealsPerDay() != null ? p.getMealsPerDay() : "-" %></p>
            <%
                } else if("Tiffin".equalsIgnoreCase(type)){
            %>
                <p><b>Food Type:</b> <%= p.getFoodType() != null ? p.getFoodType() : "-" %></p>
                <p><b>Tiffin Plan:</b> <%= p.getTiffinPlan() != null ? p.getTiffinPlan() : "-" %></p>
            <%
                } else { // Hostel/PG/Flat
            %>
                <p><b>Room/BHK:</b> <%= (p.getRoomType() != null && !p.getRoomType().isEmpty()) ? p.getRoomType() : (p.getBhkType() != null ? p.getBhkType() : "-") %></p>
                <p><b>Services:</b> <%= p.getServices() != null ? p.getServices() : "-" %></p>
            <%
                }
            %>

            <div class="btn-group">
                <a class="btn map-btn" target="_blank" href="https://www.google.com/maps?q=<%= p.getLatitude() %>,<%= p.getLongitude() %>">
                    View on Map
                </a>
                <a class="btn info-btn" href="<%= request.getContextPath() %>/PropertyDetailsServlet?id=<%= p.getId() %>">More Info</a>
            </div>
        </div>
    </div>
<%
        }
    }
%>
</div>

<!-- FOOTER -->
<div class="footer">
    © 2025 HomeHeaven | All Rights Reserved
</div>

<!-- AUTOCOMPLETE SCRIPT -->
<script>
const areas = ["Vijay Nagar","Bhawarkuan","Palasia","Rau","MR 10","Bangali Square","Bholaram","Scheme 78","Tilak Nagar","Sudama Nagar","Khajrana","AB Road","Rajendra Nagar"];
const input = document.getElementById("areaInput");
const list = document.getElementById("areaList");
input.addEventListener("input", function() {
    const val = this.value.toLowerCase();
    list.innerHTML = "";
    if(!val) return;
    areas.filter(a => a.toLowerCase().includes(val)).forEach(a => {
        const item = document.createElement("div");
        item.textContent = a;
        item.onclick = () => { input.value = a; list.innerHTML=""; };
        list.appendChild(item);
    });
});
</script>

</body>
</html>
