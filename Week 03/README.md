## Project 3: SQL Data Analysis & Relational Analytics

![SQL](https://img.shields.io/badge/Language-SQL-blue.svg)
![Database](https://img.shields.io/badge/Database-MySQL-orange.svg)
![Status](https://img.shields.io/badge/Status-Completed-success.svg)

---

## Executive Summary

- This project forms part of the **DecodeLabs Industrial Training Curriculum (Project 3)**.  
- The primary analytical objective was to transition from procedural analytical workflows (e.g., iterative script loops) to **declarative relational querying**. 

- Using a local **MySQL** engine, an enterprise e-commerce dataset containing **1,200 transaction records** was ingested, structured, and queried to evaluate operational performance across product categories, payment processing rails, and promotional usage.

---

## Database Architecture & Schema
The analysis was performed under the `decodelabs_project3` database using the `transactions` schema:

| Column Name | Data Type | Analytical Role & Description |
| :--- | :--- | :--- |
| `OrderID` | `INT` (Primary Key) | Unique identifier for each order record |
| `Date` | `DATE` / `VARCHAR` | Order placement date |
| `CustomerID` | `VARCHAR` | Customer account identifier |
| `Product` | `VARCHAR` | Item category purchased (e.g., Chair, Desk, etc.) |
| `Quantity` | `INT` | Volume of units purchased per line item |
| `UnitPrice` | `DECIMAL(10,2)` | Base unit price |
| `ItemsInCart` | `INT` | Total item count in basket during checkout |
| `TotalPrice` | `DECIMAL(10,2)` | Gross transaction value (`Quantity` × `UnitPrice`) |
| `CouponCode` | `VARCHAR` | Promotional code applied (contains `NULL` entries) |
| `PaymentMethod` | `VARCHAR` | Checkout payment method (Credit Card, PayPal, etc.) |
| `OrderStatus` | `VARCHAR` | Fulfillment status (Shipped, Delivered, Pending, etc.) |
| `ShippingAddress` | `VARCHAR` | Delivery destination address |
| `TrackingNumber` | `VARCHAR` | Logistics tracking identifier |
| `ReferralSource` | `VARCHAR` | Marketing attribution source |

---

## SQL Execution Mechanics
**Execution Engine Order** :   
- Queries were engineered in accordance with the **Logical SQL Query Execution Order** to avoid execution traps (such as the **Alias Trap** in `WHERE` clauses):  
1. FROM / JOIN   --> Locates and loads source tables  
2. WHERE         --> Filters raw individual rows prior to grouping  
3. GROUP BY      --> Splits remaining rows into summary buckets  
4. HAVING        --> Filters aggregated summary buckets  
5. SELECT        --> Formats projected columns & evaluates aliases  
6. ORDER BY      --> Sorts final result set  
7. LIMIT         --> Truncates final presentation records  

### Core SQL Clauses Applied
* **`SELECT`**: Formatted clear executive output projections.
* **`WHERE`**: Applied row-level filters on underlying column names prior to aggregation.
* **`GROUP BY`**: Categorized transactions by `Product` and `PaymentMethod`.
* **`HAVING`**: Filtered summarized product buckets to isolate high-revenue lines ($10,000+ threshold).
* **`ORDER BY` & `LIMIT`**: Ranked output metrics descending by revenue and volume.

---

## Key Analytical Queries & Outputs

### 1. High-Value Order & Promotional Isolation (`WHERE`)
```sql
-- Count high-value orders (> $100)
SELECT COUNT(*) AS high_value_count
FROM transactions
WHERE TotalPrice > 100;
```
-  Output: 1,137 orders

---
```sql
-- Count promotional code usage
SELECT COUNT(*) AS coupon_used_count
FROM transactions
WHERE CouponCode IS NOT NULL 
  AND CouponCode != '';
```
-  Output: 891 orders

---
### 2. Product Category Performance (GROUP BY + HAVING)
```sql  
SELECT 
    Product,
    COUNT(OrderID) AS TotalOrders,
    SUM(Quantity) AS TotalUnitsSold,
    ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
    ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM transactions
GROUP BY Product
HAVING SUM(TotalPrice) > 10000
ORDER BY TotalRevenue DESC;
```
- Top Result: Chair achieved $195,620.11 in revenue across 178 orders (562 units sold).  

---

### 3. Payment Method Volume Breakdown
```sql
SELECT 
    PaymentMethod,
    COUNT(OrderID) AS TotalOrders,
    ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM transactions
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;  
```
-  Top Result: Credit Card dominated checkout volume, processing 234 orders totaling $263,847.63.  


---
**Key Findings & Strategic Conclusions**    
| Business Dimension | Top Performer | Volume / Metric | Financial Value |  
|--------------------|---------------|-----------------|-----------------|  
| Top Revenue Category | Chair | 178 Orders (562 Units | )$195,620.11 |  
|Primary Payment Gateway | Credit Card | 234 Orders | $263,847.63 |  
|Top Delivery Address | 533 Main St | 8 Orders | $7,753.77|  

---

### Executive Insights  
- **Supply Chain Focus:** Chairs represent the primary revenue engine. Inventory and fulfillment pipelines should prioritize stock availability for this high-performing line.  
- **Checkout Integration:** Credit Card processing drives the majority of transactional revenue. Low-friction checkout user experiences and authorization monitoring should focus heavily on credit card gateways.  
- **Promotional Penetration:** Over 74% of orders used a coupon code (891 / 1,200), pointing to high consumer price sensitivity and successful coupon marketing conversion.

---
**Author: Muhammad Huzaifa Mohsin**    
**Role: Data Analyst**   
**Program: DecodeLabs Industrial Training**   
**Database Platform: MySQL Server**    
