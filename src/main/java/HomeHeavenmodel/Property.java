package HomeHeavenmodel;

import java.util.List;

public class Property {
    private int id;
    private String name;
    private String propertyCategory;
    private String propertyType;

    // Hostel/PG/Flat fields
    private String roomType;
    private String bhkType;
    private String services;

    // Common fields
    private String description;
    private String address;
    private double price;
    private double latitude;
    private double longitude;
    private List<String> images;

    // Mess fields
    private String mealsPerDay;

    // Tiffin fields
    private String foodType;
    private String tiffinPlan;

    // Rating fields
    private double avgRating;    // average rating
    private int ratingCount;     // total number of ratings

    // ---------------- Getters and Setters ----------------
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPropertyCategory() { return propertyCategory; }
    public void setPropertyCategory(String propertyCategory) { this.propertyCategory = propertyCategory; }

    public String getPropertyType() { return propertyType; }
    public void setPropertyType(String propertyType) { this.propertyType = propertyType; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public String getBhkType() { return bhkType; }
    public void setBhkType(String bhkType) { this.bhkType = bhkType; }

    public String getServices() { return services; }
    public void setServices(String services) { this.services = services; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getLatitude() { return latitude; }
    public void setLatitude(double latitude) { this.latitude = latitude; }

    public double getLongitude() { return longitude; }
    public void setLongitude(double longitude) { this.longitude = longitude; }

    public List<String> getImages() { return images; }
    public void setImages(List<String> images) { this.images = images; }

    public String getMealsPerDay() { return mealsPerDay; }
    public void setMealsPerDay(String mealsPerDay) { this.mealsPerDay = mealsPerDay; }

    public String getFoodType() { return foodType; }
    public void setFoodType(String foodType) { this.foodType = foodType; }

    public String getTiffinPlan() { return tiffinPlan; }
    public void setTiffinPlan(String tiffinPlan) { this.tiffinPlan = tiffinPlan; }

    public double getAvgRating() { return avgRating; }
    public void setAvgRating(double avgRating) { this.avgRating = avgRating; }

    public int getRatingCount() { return ratingCount; }
    public void setRatingCount(int ratingCount) { this.ratingCount = ratingCount; }
}
