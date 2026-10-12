-- Return rate by region
SELECT o.Region AS region,
       COUNT(DISTINCT o.Order_ID) AS orders,
       COUNT(DISTINCT r.Order_ID) AS returned,
       ROUND(100.0 * COUNT(DISTINCT r.Order_ID) / COUNT(DISTINCT o.Order_ID), 2) AS return_rate_pct
FROM orders o
LEFT JOIN returns r ON o.Order_ID = r.Order_ID
GROUP BY o.Region
ORDER BY return_rate_pct DESC;
