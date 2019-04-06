/* question 1 */

SELECT s.employee_id, s.order_id, o.amount, s.action, s.order_date
FROM shipments s 
LEFT JOIN orders o
ON o.id = s.order_id
ORDER BY s.employee_id, s.order_id, s.order_date;

/* virtual table */
	CREATE VIEW shipments_and_orders AS 
	SELECT s.employee_id, s.order_id, o.amount, s.action, s.order_date
	FROM shipments s 
	LEFT JOIN orders o
	ON o.id = s.order_id
	ORDER BY s.employee_id, s.order_id, s.order_date;

	SELECT *
	FROM shipments_and_orders;














-- looking into partitions and lag could help with this version of problem 1
-- List the difference between an order amount and the previous order amount for that particular employee
	
	-- and you'd start off with this:

		SELECT *
		FROM shipments
		LEFT JOIN orders
		ON shipments.order_id = orders.id
		WHERE employee_id = 95
		ORDER BY employee_id;

SELECT 
employee_id,
order_date,
orders.amount,
LAG(orders.amount,1) OVER (
PARTITION BY employee_id
ORDER BY order_date) nextOrderDate
FROM shipments
LEFT JOIN orders 
ON shipments.order_id = orders.id;


/* question 2 */
SELECT count(*)
FROM shipments s1
WHERE s1.action = 'cancelled'
AND s1.order_date > (SELECT s2.order_date
FROM shipments s2
WHERE s2.order_id = s1.order_id
AND s2.action = 'approved')
GROUP BY s1.action; 

/* question 2 another way*/
SELECT count(*)
FROM shipments s1, shipments s2
WHERE s1.order_id = s2.order_id
AND (s1.action = 'cancelled' AND s2.action = 'approved')
AND s1.order_date > s2.order_date
GROUP BY s1.action;























