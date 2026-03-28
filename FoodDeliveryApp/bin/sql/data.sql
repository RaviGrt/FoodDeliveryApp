-- Sample Data for Food Delivery App
INSERT INTO Restaurants (name, city, rating, delivery_time, is_veg_only, offers) VALUES ('Biryani House', 'TestCity', 4.5, 30, 0, '20% OFF');
INSERT INTO Restaurants (name, city, rating, delivery_time, is_veg_only, offers) VALUES ('Pizza Corner', 'TestCity', 4.2, 45, 0, 'Buy 1 Get 1');
INSERT INTO Restaurants (name, city, rating, delivery_time, is_veg_only, offers) VALUES ('Green Leaf Veg', 'TestCity', 4.8, 20, 1, 'Free Dessert');
INSERT INTO Restaurants (name, city, rating, delivery_time, is_veg_only, offers) VALUES ('Spicy Wok', 'TestCity', 4.1, 40, 0, '10% OFF');
INSERT INTO Restaurants (name, city, rating, delivery_time, is_veg_only, offers) VALUES ('Urban Burger', 'TestCity', 4.6, 25, 0, 'Free Fries');

-- Menu Items for Biryani House (restaurant_id = 1)
INSERT INTO Menu (restaurant_id, name, price, description, is_veg) VALUES (1, 'Chicken Biryani', 250.00, 'Aromatic basmati rice cooked with tender chicken pieces', 0);
INSERT INTO Menu (restaurant_id, name, price, description, is_veg) VALUES (1, 'Mutton Biryani', 350.00, 'Rich and flavorful mutton biryani', 0);
INSERT INTO Menu (restaurant_id, name, price, description, is_veg) VALUES (1, 'Veg Biryani', 200.00, 'Delicious vegetable biryani with paneer', 1);

-- Menu Items for Pizza Corner (restaurant_id = 2)
INSERT INTO Menu (restaurant_id, name, price, description, is_veg) VALUES (2, 'Margherita Pizza', 300.00, 'Classic cheese pizza', 1);
INSERT INTO Menu (restaurant_id, name, price, description, is_veg) VALUES (2, 'Pepperoni Pizza', 400.00, 'Loaded with pepperoni', 0);

-- Menu Items for Green Leaf Veg (restaurant_id = 3)
INSERT INTO Menu (restaurant_id, name, price, description, is_veg) VALUES (3, 'Paneer Butter Masala', 220.00, 'Rich paneer curry', 1);
INSERT INTO Menu (restaurant_id, name, price, description, is_veg) VALUES (3, 'Dal Makhani', 180.00, 'Creamy black lentils', 1);

-- Menu Items for Urban Burger (restaurant_id = 5)
INSERT INTO Menu (restaurant_id, name, price, description, is_veg) VALUES (5, 'Classic Cheeseburger', 150.00, 'Juicy beef patty with cheese', 0);
INSERT INTO Menu (restaurant_id, name, price, description, is_veg) VALUES (5, 'Veggie Burger', 120.00, 'Crispy veg patty', 1);

COMMIT;
