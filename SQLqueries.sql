/*JOIN EACH BLOODY TABLE YOU CUNT*/
/*QUERY 1*/
INSERT INTO Category
VALUES ('89', 'Sci-Fi', 'Fiction');

/*QUERY 2*/
DELETE FROM Category
WHERE CategoryID = 89;

/*QUERY 3*/
CREATE OR REPLACE VIEW Book_Summary AS 
SELECT ROUND(AVG(Price),2) AS Average_Price, COUNT (BookID) AS Amount_Of_Books_In_Each_Category, Category.CategoryID, Category.Name AS Category_name
FROM Book, Category 
WHERE Book.CategoryID = Category.CategoryID
GROUP BY Category.CategoryID, Category.Name; 

SELECT * FROM Book_Summary;
/*summary line*/
SELECT ROUND(SUM(Average_Price),2) AS Avg_Total
FROM Book_Summary;

/*QUERY 4*/
SELECT DISTINCT Book.BookID, Title, COUNT(Orderline.ShopOrderID) AS Total_Orders, SUM(Quantity) AS Total_Quantity, ROUND(SUM(UnitSellingPrice + Price),2) AS Total_Selling_Value, Publisher.Name AS Publisher_name,
MAX(EXTRACT(MONTH FROM OrderDate)) AS Month,
MAX(EXTRACT(YEAR FROM OrderDate)) AS Year
FROM Book, Orderline, ShopOrder, Publisher
WHERE Book.BookID = Orderline.BookID AND ShopOrder.ShopOrderID = Orderline.ShopOrderID AND Publisher.Name = 'Feather'
GROUP BY Book.BookID, Publisher.Name;

/*QUERY 5*/ 
CREATE OR REPLACE VIEW Order_History AS
SELECT DISTINCT Title AS Order_Title, OrderDate, Price, UnitSellingPrice, SUM(Quantity) AS Total_Quantity, ROUND(Price,2) AS Order_Value, Shop.Name AS Shop_Name
FROM Book, Shop, ShopOrder, Orderline
WHERE Book.BookID = Orderline.BookID AND ShopOrder.ShopOrderID = Orderline.ShopOrderID 
AND Book.BookID = 3032 /*3032 is an example*/
GROUP BY Title, OrderDate, Price, UnitSellingPrice, Quantity, Shop_Name;

SELECT * FROM Order_History;
/*Summary Line */
SELECT ROUND(SUM(Total_Quantity),2) AS Total_Copies_Ordered, SUM(Price + UnitSellingPrice) AS Total_Selling_Value
FROM Order_History;


/*QUERY 6*/
SELECT DISTINCT SalesRep.SalesRepID, Name, COALESCE(SUM(Book.Price)) AS Total_Order_Value , SUM(Quantity) AS Total_Units_Sold /*Coalesce returns first non-null value in a list*/
FROM SalesRep, ShopOrder, Orderline, Book
WHERE OrderDate BETWEEN '2019-04-15 ' AND '2019-06-20'
AND SalesRep.SalesRepID = ShopOrder.SalesRepID AND ShopOrder.ShopOrderID = Orderline.ShopOrderID 
GROUP BY SalesRep.SalesRepID
ORDER BY Total_Units_Sold DESC;

/*QUERY 7*/ 
UPDATE Book 
SET Price = (Price-(Price * 0.3)) /*30% off*/
WHERE CategoryID = 14;