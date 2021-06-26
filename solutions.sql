-- 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, 
-- you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
-- So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", 
-- hence we would want this in our output list.
use sakila;
SELECT last_name, count(last_name) as number FROM actor
GROUP BY last_name
HAVING number = 1;

-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors
-- where the last name was present more than once.
SELECT last_name, count(last_name) as number FROM actor
GROUP BY last_name
HAVING number > 1
ORDER BY number desc;


-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT * FROM rental;
SELECT staff_id, count(staff_id) as num_rental
FROM rental
GROUP BY staff_id;


-- 4. Using the film table, find out how many films were released each year.
SELECT * FROM film;
SELECT release_year, count(release_year) as number
FROM film
GROUP BY release_year;



-- 5. Using the film table, find out for each rating how many films were there.
SELECT * FROM film;

SELECT rental_rate, count(rental_rate) 
FROM film
GROUP BY rental_rate
ORDER BY rental_rate DESC;


-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT * FROM film;
SELECT rental_rate, ROUND(AVG(length), 2)
FROM film
GROUP BY rental_rate
ORDER BY rental_rate DESC;


-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, AVG(length) AS avg_dur 
FROM film
GROUP BY rating
HAVING avg_dur > 120;