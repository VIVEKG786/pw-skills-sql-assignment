-- 													   ASSIGNMENT
-- 			         								   ADVANCED SQL


create database advancedsql
use advancedsql;

create table products(
ProductID int primary key,
ProductName varchar(100),
Category varchar(50),
Price decimal(10,2)
);

insert into Products values
(1,'Keyboard','Electronics',1200),
(2,'Mouse','Electronics',800),
(3,'Chair','Furniture',2500),
(4,'Desk','Furniture',5500);


create table Sales(
SaleID int Primary key,
ProductID int, 
Quantity int,
SaleDate date,
foreign key (ProductID) references Products(ProductID)
);

insert into Sales values
(1,1,4,'2024-01-05'),
(2,2,10,'2024-01-06'),
(3,3,2,'2024-01-10'),
(4,4,1,'2024-01-11');

select * from sales;



-- Q6. Write a CTE to calculate the total revenue for each product
-- (Revenues = Price × Quantity), and return only products where  revenue > 3000.
-- Ans:

WITH ProductRevenue AS (
    SELECT 
        P.ProductName,
        SUM(P.Price * S.Quantity) AS TotalRevenue
    FROM Products P
    JOIN Sales S ON P.ProductID = S.ProductID
    GROUP BY P.ProductName
)
SELECT * FROM ProductRevenue
WHERE TotalRevenue > 3000;


-- Q7. Create a view named vw_CategorySummary that shows:
--  Category, TotalProducts, AveragePrice.
-- Ans:

create view vw_CategorySummary AS
SELECT 
    Category,
    COUNT(ProductID) AS TotalProducts,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;


-- Q8. Create an updatable view containing ProductID, ProductName, and Price.
-- Then update the price of ProductID = 1 using the view.
-- Ans:

-- Creating View
CREATE VIEW vw_ProductDetails AS
SELECT ProductID, ProductName, Price
FROM Products;

--  Updating Price using View
UPDATE vw_ProductDetails
SET Price = 1500  
WHERE ProductID = 1;


-- Q9. Create a stored procedure that accepts a category name and returns all products belonging to that 
-- category.
-- Ans:

DELIMITER //

CREATE PROCEDURE GetProductsByCategory(IN inputCategory VARCHAR(50))
BEGIN
    SELECT * FROM Products 
    WHERE Category = inputCategory;
END //

DELIMITER ;


-- Q10. Create an AFTER DELETE trigger on the Products table that archives deleted product rows into a new table ProductArchive.
-- The archive should store ProductID, ProductName, Category, Price, and DeletedAt timestamp.
-- Ans:


-- Archive Table to store the data
CREATE TABLE ProductArchive (
    ArchiveID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt DATETIME
);

 -- Create Trigger
DELIMITER //

CREATE TRIGGER trg_AfterProductDelete
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductArchive (ProductID, ProductName, Category, Price, DeletedAt)
    VALUES (OLD.ProductID, OLD.ProductName, OLD.Category, OLD.Price, NOW());
END //

DELIMITER ;
