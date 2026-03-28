CREATE TABLE Users (
    user_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    password VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20) UNIQUE NOT NULL,
    city VARCHAR2(100) NOT NULL
);

CREATE TABLE Restaurants (
    restaurant_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(200) NOT NULL,
    city VARCHAR2(100) NOT NULL,
    rating NUMBER(3,1),
    delivery_time NUMBER, -- in minutes
    is_veg_only NUMBER(1) DEFAULT 0, -- 1 for yes, 0 for no
    offers VARCHAR2(200)
);

CREATE TABLE Menu (
    item_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    restaurant_id NUMBER REFERENCES Restaurants(restaurant_id),
    name VARCHAR2(200) NOT NULL,
    price NUMBER(10,2) NOT NULL,
    description VARCHAR2(500),
    is_veg NUMBER(1) DEFAULT 1
);

CREATE TABLE Delivery_Partner (
    partner_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20) UNIQUE NOT NULL,
    current_location VARCHAR2(200),
    status VARCHAR2(50) DEFAULT 'AVAILABLE'
);

CREATE TABLE Orders (
    order_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id NUMBER REFERENCES Users(user_id),
    restaurant_id NUMBER REFERENCES Restaurants(restaurant_id),
    partner_id NUMBER REFERENCES Delivery_Partner(partner_id),
    total_amount NUMBER(10,2) NOT NULL,
    status VARCHAR2(50) NOT NULL,
    payment_method VARCHAR2(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Cart (
    cart_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id NUMBER REFERENCES Users(user_id),
    item_id NUMBER REFERENCES Menu(item_id),
    quantity NUMBER DEFAULT 1
);
