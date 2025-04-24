SELECT customer_care_calls, COUNT(*) AS total_shipments
FROM shipping_ecommerce
WHERE Customer_rating >= 3
GROUP BY Product_importance
ORDER BY Weight_in_gms DESC;

CREATE TABLE customers (
  CustomerID VARCHAR(20),
  CustomerName VARCHAR(100),
  Region VARCHAR(50)
);

SELECT a.Warehouse_block, a.Mode_of_Shipment, a.Product_importance, 
       b.Warehouse_block AS Related_Warehouse, b.Mode_of_Shipment AS Related_Shipment
FROM shipping_ecommerce a
INNER JOIN shipping_ecommerce b 
ON a.Warehouse_block = b.Warehouse_block 
WHERE a.Product_importance = 'High'
ORDER BY a.Warehouse_block;

SELECT a.Warehouse_block, a.Mode_of_Shipment, a.Product_importance, 
       b.Warehouse_block AS Related_Warehouse, b.Mode_of_Shipment AS Related_Shipment
FROM shipping_ecommerce a
LEFT JOIN shipping_ecommerce b 
ON a.Warehouse_block = b.Warehouse_block 
WHERE a.Product_importance = 'High'
ORDER BY a.Warehouse_block;

SELECT a.Warehouse_block, a.Mode_of_Shipment, a.Product_importance, 
       b.Warehouse_block AS Related_Warehouse, b.Mode_of_Shipment AS Related_Shipment
FROM shipping_ecommerce a
RIGHT JOIN shipping_ecommerce b 
ON a.Warehouse_block = b.Warehouse_block 
WHERE a.Product_importance = 'High'
ORDER BY a.Warehouse_block;

SELECT Customer_rating, Prior_purchases
FROM shipping_ecommerce
WHERE Prior_purchases > (
    SELECT AVG(Prior_purchases) 
    FROM shipping_ecommerce
);

SELECT Warehouse_block, 
       SUM(Discount_offered) AS Total_Discount, 
       AVG(Prior_purchases) AS Avg_Prior_Purchases
FROM shipping_ecommerce
GROUP BY Warehouse_block
ORDER BY Total_Discount DESC;

CREATE VIEW warehouse_discount_analysis AS
SELECT Warehouse_block, Discount_offered
FROM shipping_ecommerce
GROUP BY Warehouse_block, Discount_offered;

SELECT * FROM warehouse_discount_analysis;

SELECT Customer_rating, Discount_offered
FROM shipping_ecommerce
WHERE Customer_rating >= 4
ORDER BY Customer_rating DESC;

SELECT Gender, Mode_of_Shipment, COUNT(*) AS Total_Shipments
FROM shipping_ecommerce
GROUP BY Gender, Mode_of_Shipment
ORDER BY Total_Shipments DESC;





