SELECT c.customer_name, c.address FROM customer c INNER JOIN `order` o ON c.idCustomer = o.customer_id WHERE o.total_amount > 75000;
