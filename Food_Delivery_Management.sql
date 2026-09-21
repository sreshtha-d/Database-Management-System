CREATE DATABASE Food_Delivery_DB;
USE Food_Delivery_DB;

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Restaurant (
    Restaurant_ID INT PRIMARY KEY,
    Restaurant_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(255),
    Cuisine_Type VARCHAR(50)
);

CREATE TABLE Food_Item (
    Food_ID INT PRIMARY KEY,
    Restaurant_ID INT NOT NULL,
    Food_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    Category VARCHAR(50),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID)
);

CREATE TABLE Delivery_Partner (
    Delivery_ID INT PRIMARY KEY,
    Delivery_Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Vehicle_Type VARCHAR(50),
    Delivery_Status VARCHAR(30)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Restaurant_ID INT NOT NULL,
    Delivery_ID INT,
    Order_Date DATE,
    Order_Status VARCHAR(30),
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Restaurant_ID) REFERENCES Restaurant(Restaurant_ID),
    FOREIGN KEY (Delivery_ID) REFERENCES Delivery_Partner(Delivery_ID)
);

CREATE TABLE Order_Item (
    Order_Item_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Food_ID INT NOT NULL,
    Quantity INT,
    Subtotal DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Food_ID) REFERENCES Food_Item(Food_ID)
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL UNIQUE,
    Payment_Date DATE,
    Amount DECIMAL(10,2),
    Payment_Mode VARCHAR(30),
    Payment_Status VARCHAR(30),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);
