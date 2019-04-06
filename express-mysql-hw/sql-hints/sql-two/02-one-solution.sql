/* $226 difference between this order amount and the previous order amount for employee 94 */
/* $230  difference between this order amount and the previous order amount for employee 95*/

SELECT s.employee_id, s.order_id, o.amount, s.action, s.order_date
FROM shipments s 
LEFT JOIN orders o
ON o.id = s.order_id
ORDER BY s.employee_id, s.order_id, s.order_date;


SELECT * 
FROM shipments 
LEFT JOIN orders 
ON shipments.order_id = orders.id;

/* WE do  WHERE shipments.action = 'ordered' BECAUSE we want unique order_ids to show up*/
SELECT * 
FROM shipments 
LEFT JOIN orders 
ON shipments.order_id = orders.id
WHERE shipments.action = 'ordered';



SELECT shipments.order_id, shipments.order_date, shipments.employee_id,orders.amount,
    LAG(orders.amount, 1) OVER () prev_order_amount
FROM shipments 
LEFT JOIN orders 
ON shipments.order_id = orders.id
WHERE shipments.action = 'ordered';



SELECT shipments.order_id, shipments.order_date, shipments.employee_id,orders.amount,
    LAG(orders.amount, 1) OVER () prev_order_amount,
    LAG(orders.amount, 1) OVER () - orders.amount difference
FROM shipments 
LEFT JOIN orders 
ON shipments.order_id = orders.id
WHERE shipments.action = 'ordered';




SELECT shipments.order_id, shipments.order_date, shipments.employee_id,
    LAG(shipments.employee_id, 1) OVER () previous_employee_id,
	orders.amount,
    LAG(orders.amount, 1) OVER () prev_order_amount,
    LAG(orders.amount, 1) OVER () - orders.amount difference
FROM shipments 
LEFT JOIN orders 
ON shipments.order_id = orders.id
WHERE shipments.action = 'ordered';
























SELECT * FROM
	(SELECT shipments.order_id, orders.amount, shipments.order_date, shipments.employee_id,
	    LAG(shipments.employee_id, 1) OVER () previous_employee_id,
	    LAG(orders.amount, 1) OVER () prev_order_amount,
	    LAG(orders.amount, 1) OVER () - orders.amount difference
	FROM shipments 
	LEFT JOIN orders 
	ON shipments.order_id = orders.id
	WHERE shipments.action = 'ordered') t1
WHERE t1.previous_employee_id = t1.employee_id;









