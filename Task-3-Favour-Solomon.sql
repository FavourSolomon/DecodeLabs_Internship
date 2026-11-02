--DecodeLabs Data Analytics Project 3.


--KPI Analysis
SELECT
    SUM(TotalPrice) AS
TotalOrderValue,
    COUNT(OrderID) AS
TotalOrders,
    AVG(TotalPrice) AS
AverageOrderValue,
    SUM(Quantity) AS
TotalQuantityOrdered,
    (SELECT COUNT(OrderID)
    FROM DecodeLabs_Task_3
    WHERE OrderStatus = 'Delivered'
 ) AS DeliveredOrders
FROM DecodeLabs_Task_3;


--Business Question 1: Sales Trend
--How has the business's sales  performance changed over time?
SELECT 
    YEAR(Date) AS OrderYear,
    MONTH(Date) AS OrderMonth,
    SUM(TotalPrice) AS 
MonthlyOrderValue
FROM DecodeLabs_Task_3
GROUP BY
    YEAR(Date),
    MONTH(Date)   
ORDER BY 
    OrderYear,
    OrderMonth;


--Business Question 2: Product Performance
--Which products performed best by order value and quantity sold?
SELECT 
    Product,
    SUM(TotalPrice) AS 
TotalOrderValue,
    SUM(Quantity) AS 
TotalQuantityOrdered
FROM DecodeLabs_Task_3
GROUP BY Product  
ORDER BY TotalOrderValue DESC;


--Business Question 3: Payment Method
--Which payment method are used most often?
SELECT 
    PaymentMethod,
    COUNT(OrderID) AS 
NumberOfOrders
FROM DecodeLabs_Task_3
GROUP BY PaymentMethod 
ORDER BY NumberOfOrders DESC;


--Business Question 4: Referral Sources
--Which referral sources bring in the most orders and order value
SELECT 
     ReferralSource,
    COUNT(OrderID) AS 
NumberOfOrders
FROM DecodeLabs_Task_3
GROUP BY ReferralSource
ORDER BY NumberOfOrders DESC;
    


--Business Question 5: Order Status
--How are orders distributed across different statuses
SELECT 
    OrderStatus,
    COUNT(OrderID) AS 
NumberOfOrders
FROM DecodeLabs_Task_3
GROUP BY OrderStatus 
ORDER BY NumberOfOrders DESC;