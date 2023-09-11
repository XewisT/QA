show databases;
CREATE DATABASE xew;
use xew;
CREATE TABLE Shopping_List (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Quantity INT
);

show tables;

INSERT INTO Shopping_List (Product_Name, Price, Quantity)
VALUES
    ('Milk', 2.50, 3),
    ('Bread', 1.20, 2),
    ('Egg', 1.50, 12),
    ('Tomato', 3.00, 5),
    ('Cheese', 4.50, 1),
    ('Patato', 2.00, 10),
    ('Apple', 1.80, 8),
    ('Meat', 8.75, 2),
    ('Juice', 2.75, 4),
    ('Candy', 1.00, 20);
    
    SELECT * FROM Shopping_List;
    
    CREATE TABLE Fridge (
    Item_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_ID INT,
    Product_Name VARCHAR(255),
    Quantity INT,
    Expiration_Date DATE,
    FOREIGN KEY (Product_ID) REFERENCES Shopping_List(ID)
);

INSERT INTO Fridge (Product_ID, Product_Name, Quantity, Expiration_Date)
VALUES
    (1, 'Milk', 2, '2023-09-10'),
    (2, 'Bread', 1, '2023-09-05'),
    (3, 'Egg', 6, '2023-09-15'),
    (4, 'Tomato', 4, '2023-09-12'),
    (5, 'Cheese', 1, '2023-09-08'),
    (6, 'Berry', 3, '2023-09-14'),
    (7, 'Chicken', 2, '2023-09-06'),
    (8, 'Orange juice', 1, '2023-09-11'),
    (9, 'Biscuits', 5, '2023-09-18'),
    (10, 'Banana', 4, '2023-09-20');
    
INSERT INTO Fridge (Product_ID, Product_Name, Quantity, Expiration_Date)
SELECT ID, Product_Name, Quantity, NOW() FROM Shopping_List LIMIT 5;

INSERT INTO Fridge (Product_ID, Product_Name, Quantity, Expiration_Date)
VALUES
    (1, 'Watermelon', 3, '2023-09-30'),
    (2,'Honey', 1, '2023-10-15'),
    (3, 'Pomegranate', 5, '2023-09-25'),
    (4, 'Tangerine', 2, '2023-10-10'),
    (5, 'Avocado', 4, '2023-09-28');
    
SELECT F.Product_ID, F.Product_Name
FROM Fridge F
WHERE F.Product_Name NOT IN (
    SELECT S.Product_Name
    FROM Shopping_List S
);

    SELECT * FROM fridge;
    
INSERT INTO Fridge (Product_ID, Product_Name, Quantity, Expiration_Date)
SELECT ID, Product_Name, Quantity, NOW() FROM Shopping_List LIMIT 5;
    
SELECT * FROM Shopping_List
ORDER BY Price DESC
LIMIT 1;

SELECT * FROM Shopping_List
ORDER BY Price ASC
LIMIT 1;

SELECT AVG(Price) AS Average_Price
FROM Shopping_List;

SELECT COUNT(*) AS Products_In_Fridge
FROM Fridge;

SELECT COUNT(*) AS Products_In_Shopping_List
FROM Shopping_List;

SELECT COUNT(*) AS Total_Products
FROM Fridge;

SELECT Product_Name, Expiration_Date, COUNT(*) AS Quantity
FROM Fridge
GROUP BY Product_Name, Expiration_Date
ORDER BY Expiration_Date;