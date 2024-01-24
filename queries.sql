-- write your queries here

--1

SELECT *
FROM owners
FULL OUTER JOIN vehicles ON owners.id = vehicles.owner_id;


--2

SELECT owners.first_name, owners.last_name, COUNT(vehicles.id) AS vehicle_count
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.id
ORDER BY owners.first_name ASC;

--3

SELECT owners.first_name,
       owners.last_name,
       COUNT(vehicles.id) AS vehicle_count,
       ROUND(AVG(vehicles.price))::INTEGER AS average_price
FROM owners
LEFT JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.id
HAVING COUNT(vehicles.id) > 1 AND AVG(vehicles.price) > 10000
ORDER BY owners.first_name DESC;
