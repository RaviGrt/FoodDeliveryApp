package com.fooddelivery.entity;

public class MenuItem {
    private int itemId;
    private int restaurantId;
    private String name;
    private double price;
    private String description;
    private boolean isVeg;
    private String category;      // New field for Search
    private String restaurantName; // New field for Search Results

    public MenuItem() {}

    public MenuItem(int itemId, int restaurantId, String name, double price, String description, boolean isVeg) {
        this.itemId = itemId;
        this.restaurantId = restaurantId;
        this.name = name;
        this.price = price;
        this.description = description;
        this.isVeg = isVeg;
    }

    // Extended constructor for search results
    public MenuItem(int itemId, int restaurantId, String name, double price, String description, boolean isVeg, String category, String restaurantName) {
        this(itemId, restaurantId, name, price, description, isVeg);
        this.category = category;
        this.restaurantName = restaurantName;
    }

    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }
    public int getRestaurantId() { return restaurantId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public boolean isVeg() { return isVeg; }
    public void setVeg(boolean veg) { isVeg = veg; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getRestaurantName() { return restaurantName; }
    public void setRestaurantName(String restaurantName) { this.restaurantName = restaurantName; }
}
