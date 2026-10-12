-- Return rate trend by order year (SQLite: substr on the date text)
SELECT substr(o.Order_Date, 1, 4) AS order_year,
       COUNT(DISTINCT o.Order_ID) AS orders,
       COUNT(DISTINCT r.Order_ID) AS returned,
       ROUND(100.0 * COUNT(DISTINCT r.Order_ID) / COUNT(DISTINCT o.Order_ID), 2) AS return_rate_pct
FROM orders o
LEFT JOIN returns r ON o.Order_ID = r.Order_ID
GROUP BY order_year
ORDER BY order_year;
