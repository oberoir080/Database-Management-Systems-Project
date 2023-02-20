SELECT c.customer_name, COUNT(o.idOrder) AS num_orders FROM customer c LEFT JOIN `order` o ON c.idCustomer = o.customer_id GROUP BY c.idCustomer;