-- Returned Order IDs with no matching order (expected: 0)
SELECT COUNT(*) AS returns_without_matching_order
FROM returns
WHERE Order_ID NOT IN (SELECT Order_ID FROM orders);
