-- Sales and profit booked on returned orders
SELECT ROUND(SUM(CASE WHEN r.Order_ID IS NOT NULL THEN o.Sales END), 0) AS returned_sales,
       ROUND(SUM(o.Sales), 0) AS total_sales,
       ROUND(100.0 * SUM(CASE WHEN r.Order_ID IS NOT NULL THEN o.Sales END) / SUM(o.Sales), 2) AS returned_sales_pct,
       ROUND(SUM(CASE WHEN r.Order_ID IS NOT NULL THEN o.Profit END), 0) AS profit_on_returned_orders
FROM orders o
LEFT JOIN returns r ON o.Order_ID = r.Order_ID;
