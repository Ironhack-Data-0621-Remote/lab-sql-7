USE sakila;
-- In the table actor, which are the actors whose last names are not repeated?
SELECT last_name,
RANK() OVER(ORDER BY last_name)
FROM actor; 
-- Is there any way a rank function would work to obtain the answer?
-- AKA a way to combine a (dense/)rank function with count? 
-- Just to experiment hahah :))
SELECT last_name, COUNT(*) 
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;
-- Which last names appear more than once? 
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;
-- Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, COUNT(*)
FROM rental
GROUP BY staff_id;
-- Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(*)
FROM film
GROUP BY release_year;
-- Using the film table, find out for each rating how many films were there.
SELECT rating, COUNT(*)
FROM film
GROUP BY rating;
-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, ROUND(AVG(length), 2) as average_length
FROM film
GROUP BY rating;
-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, ROUND(AVG(length), 2) as average_length
FROM film
GROUP BY rating
HAVING ROUND(AVG(length), 2) > 120;