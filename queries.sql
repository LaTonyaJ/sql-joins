-- write your queries here

--Join both tables not matter if there is a owner_id

SELECT * FROM owners JOIN vehicles v
ON owner_id = v.owner_id;

-- SELECT * FROM owners LEFT JOIN vehicles v ON owner_id = v.owner_id
-- UNION ALL
-- SELECT * FROM owners RIGHT JOIN vehicles v ON owner_id = v.owner_id;

SELECT first_name, last_name, COUNT(owner_id)
FROM owners JOIN vehicles
ON owner_id = vehicles.owner_id
GROUP BY (first_name, last_name)
ORDER BY first_name;


-- third query
SELECT 
  first_name, last_name, 
  ROUND(AVG(price)) as average_price, 
  COUNT(owner_id) 
FROM owners o 
JOIN vehicles v on o.id=v.owner_id 
GROUP BY 
  (first_name, last_name) 
HAVING 
  COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 
ORDER BY first_name DESC;