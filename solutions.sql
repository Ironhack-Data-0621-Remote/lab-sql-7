-- lab-sql-7
USE sakila;
-- In the table actor, which are the actors whose last names are not repeated?

SELECT DISTINCT last_name
FROM actor
GROUP BY first_name, last_name;

-- Which last names appear more than once?

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- Using the rental table, find out how many rentals were processed by each employee.

SELECT COUNT(rental_id) as rentals_processed, staff_id
FROM rental
GROUP BY staff_id;

-- Using the film table, find out how many films were released each year.

SELECT COUNT(film_id), release_year
FROM film
GROUP BY release_year;

-- Using the film table, find out for each rating how many films were there.

SELECT COUNT(film_id), rating
FROM film
GROUP BY rating;

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT ROUND(AVG(length),2) as "avg_lenght", rating
from film
GROUP BY rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?

SELECT ROUND(AVG(length),2) as "avg_lenght", rating
from film
WHERE length > 120
GROUP BY rating;

