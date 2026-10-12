-- Baseline return rate (per unique Order ID)
SELECT COUNT(DISTINCT o.Order_ID) AS total_orders,
       COUNT(DISTINCT r.Order_ID) AS returned_orders,
       ROUND(100.0 * COUNT(DISTINCT r.Order_ID) / COUNT(DISTINCT o.Order_ID), 2) AS return_rate_pct
FROM orders o
LEFT JOIN returns r ON o.Order_ID = r.Order_ID;
