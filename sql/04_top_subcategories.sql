-- Highest-return sub-categories (100+ orders)
SELECT o.Product_Sub_Category AS sub_category,
       COUNT(DISTINCT o.Order_ID) AS orders,
       COUNT(DISTINCT r.Order_ID) AS returned,
       ROUND(100.0 * COUNT(DISTINCT r.Order_ID) / COUNT(DISTINCT o.Order_ID), 2) AS return_rate_pct
FROM orders o
LEFT JOIN returns r ON o.Order_ID = r.Order_ID
GROUP BY o.Product_Sub_Category
HAVING orders >= 100
ORDER BY return_rate_pct DESC
LIMIT 5;
