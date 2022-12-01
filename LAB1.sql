USE sakila;

-- Join 1
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT name, COUNT(film_id) AS film_amount
FROM category
JOIN film_category
ON category.category_id = film_category.category_id
GROUP BY name;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT staff_id, COUNT(amount) AS total_amount
FROM staff
JOIN payment
USING (staff_id)
GROUP BY staff_id;

-- Which actor has appeared in the most films?
SELECT a.first_name as name, a.last_name as last_name, COUNT(DISTINCT(f.film_id)) as amount
FROM film_actor f
JOIN actor a
ON f.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY amount DESC;

-- Most active customer (the customer that has rented the most number of films)
SELECT COUNT(DISTINCT r.rental_id) AS amount_rented, first_name, last_name, c.customer_id
FROM customer c
JOIN rental r
USING (customer_id)
GROUP BY c.customer_id
ORDER BY amount_rented DESC
limit 1;

-- Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a
USING (address_id);

-- List each film and the number of actors who are listed for that film.
select count(actor_id), title
from film_actor
join film 
using(film_id)
group by title;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select a.last_name, a.first_name, COUNT(b.amount) 
from payment b
join customer a
using (customer_id)
group by customer_id
order by a.last_name;

-- List number of films per category.

SELECT name, COUNT(film_id) AS film_amount
FROM category
JOIN film_category
ON category.category_id = film_category.category_id
GROUP BY name;
