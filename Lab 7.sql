use sakila;

-- 1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, 

select last_name, count(last_name) as unique_name from actor
group by last_name
having unique_name = 1
order by last_name asc;

-- 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors
-- where the last name was present more than once.
select last_name, count(last_name) as unique_name from actor
group by last_name
having unique_name > 1
order by last_name asc;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
select staff_id, count(rental_id) from rental
group by staff_id;

-- 4. Using the film table, find out how many films were released each year.
select release_year, count(film_id) from film
group by release_year;

-- 5. Using the film table, find out for each rating how many films were there.
select rental_rate, count(film_id) from film
group by rental_rate;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
ALTER TABLE film 
RENAME COLUMN length TO new_length;

select * from film; 

select round(avg(new_length),2) as average, rating from film
group by rating
order by average asc;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
select round(avg(new_length),2) as average, rating from film
group by rating
having average > 120
order by average asc;