Select * from [dbo].[LITA Customer Data - CSV]

--- total number of customers from each region---
SELECT Region,
COUNT(*) as NUMBER
FROM [dbo].[LITA Customer Data - CSV]
GROUP BY Region;

---most popular subscription type by the number of customers--
SELECT SubscriptionType,
COUNT(CustomerID) as Popularsub
FROM [dbo].[LITA Customer Data - CSV]
GROUP BY SubscriptionType 
ORDER BY PopularSub DESC;

---customers who canceled their subscription within 6 months---
SELECT CustomerID, SubscriptionStart, SubscriptionEnd
FROM [dbo].[LITA Customer Data - CSV]
WHERE SubscriptionEnd IS NOT NULL
  AND DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6;

  ---the average subscription duration for all customers---
  SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS AverageSubscriptionDuration
FROM [dbo].[LITA Customer Data - CSV]
WHERE SubscriptionEnd IS NOT NULL;

---customers with subscriptions longer than 12 months---
SELECT CustomerID, SubscriptionStart, SubscriptionEnd
FROM [dbo].[LITA Customer Data - CSV]
WHERE DATEDIFF(MONTH, SubscriptionStart, COALESCE(SubscriptionEnd, GETDATE())) > 12;

---total revenue by subscription type---
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].[LITA Customer Data - CSV]
GROUP BY SubscriptionType;

--- top 3 regions by subscription cancellations---
SELECT Region, COUNT(*) AS CancelCount
FROM [dbo].[LITA Customer Data - CSV]
WHERE SubscriptionEnd IS NOT NULL
GROUP BY Region
ORDER BY CancelCount DESC;

---the total number of active and canceled subscriptions---
SELECT 
    COUNT(CASE WHEN SubscriptionEnd IS NULL THEN 1 END) AS ActiveSub,
    COUNT(CASE WHEN SubscriptionEnd IS NOT NULL THEN 1 END) AS CancelSub
FROM [dbo].[LITA Customer Data - CSV];

