
WITH FirstOrders as
(
SELECT customer_id, MIN(order_date) as first_order_date
FROM Delivery 
GROUP BY customer_id
),
ImmediateFirstOrders as
(
SELECT d.customer_id
FROM Delivery as d
JOIN FirstOrders as fo
ON d.customer_id = fo.customer_id AND d.order_date = fo.first_order_date
WHERE d.order_date = d.customer_pref_delivery_date
)
SELECT ROUND((SELECT COUNT(*) FROM ImmediateFirstOrders)*100/(SELECT COUNT(*) FROM FirstOrders),2) as immediate_percentage
;
