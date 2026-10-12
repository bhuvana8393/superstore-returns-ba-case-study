-- Return rate by product category
-- Note: an order can span categories, so category order counts exceed the overall total.
SELECT o.Product_Category AS category,
       COUNT(DISTINCT o.Order_ID) AS orders,
       COUNT(DISTINCT r.Order_ID) AS returned,
       ROUND(100.0 * COUNT(DISTINCT r.Order_ID) / COUNT(DISTINCT o.Order_ID), 2) AS return_rate_pct
FROM orders o
LEFT JOIN returns r ON o.Order_ID = r.Order_ID
GROUP BY o.Product_Category
ORDER BY return_rate_pct DESC;
