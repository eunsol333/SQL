SELECT users.name, users.email, SUM(products.price * orders.quantity) AS "total_spent"
FROM users
  INNER JOIN orders ON users.id = orders.user_id
  INNER JOIN products ON orders.product_id = products.id
    AND products.category = 'Electronics'
GROUP BY users.id, users.name, users.email
HAVING COUNT(orders.id) >= 3 AND SUM(products.price * orders.quantity) > 1000
ORDER BY total_spent DESC