-- Create database
CREATE DATABASE IF NOT EXISTS decodelabs_project3;

-- Use the newly created database
USE decodelabs_project3;

SET GLOBAL local_infile = 1;
USE decodelabs_project3;

-- Drop table if it failed partially
DROP TABLE IF EXISTS transactions;

-- Create table schema tailored to dataset
CREATE TABLE transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    Product VARCHAR(100),
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    ItemsInCart INT,
    TotalPrice DECIMAL(10, 2),
    CouponCode VARCHAR(100) NULL
);

SELECT COUNT(*) AS OrderID FROM transactions;
-- Verify total records in the transactions table
SELECT COUNT(OrderID) AS total_records 
FROM transactions;

-- Inspect table structure and sample data
SELECT * FROM transactions LIMIT 10;

-- High Value Transactions
SELECT OrderID, Product, TotalPrice, OrderStatus FROM transactions WHERE TotalPrice > 100;
SELECT COUNT(*) AS high_value_count
FROM transactions
WHERE TotalPrice > 100;

-- Coupon Code Analysis
SELECT OrderID, Product, TotalPrice, CouponCode FROM transactions WHERE CouponCode IS NOT NULL AND CouponCode != '';
SELECT COUNT(*) AS coupon_used_count
FROM transactions
WHERE CouponCode IS NOT NULL 
  AND CouponCode != '';

-- Product Sales Overview
SELECT 
    Product,
    COUNT(OrderID) AS TotalOrders,
    SUM(Quantity) AS TotalUnitsSold,
    SUM(TotalPrice) AS TotalRevenue,
    AVG(TotalPrice) AS AvgOrderValue
FROM transactions GROUP BY Product;

-- Filtering Summary Bucket
SELECT 
    Product,
    SUM(TotalPrice) AS TotalRevenue
FROM transactions
GROUP BY Product
HAVING SUM(TotalPrice) > 10000;

-- Payment Method Breakdown
SELECT 
    PaymentMethod,
    COUNT(OrderID) AS OrderCount,
    SUM(TotalPrice) AS TotalSales
FROM transactions
GROUP BY PaymentMethod;

-- Rank Top Products by Revenue
SELECT 
    Product,
    COUNT(OrderID) AS TotalOrders,
    SUM(Quantity) AS UnitsSold,
    ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM transactions
GROUP BY Product
ORDER BY TotalRevenue DESC;

-- Top Payment Method Performance
SELECT 
    PaymentMethod,
    COUNT(OrderID) AS TotalOrders,
    ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM transactions
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;

-- Top 3 Shipping Destinations
SELECT 
    ShippingAddress,
    COUNT(OrderID) AS TotalOrders,
    ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM transactions
GROUP BY ShippingAddress
ORDER BY TotalOrders DESC
LIMIT 3;