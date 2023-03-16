-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name
FROM customer
FULL OUTER JOIN address 
ON customer.address_id = address.address_id
WHERE district like 'Texas'
ORDER BY district DESC;


-----ANSWER: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still



-- 2. Get all payments above $6.99 with the Customer's Full Name


SELECT first_name, last_name, amount
FROM payment
RIGHT JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99
ORDER BY amount ASC;

----- ANSWER Peter Menard -----


-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) ASC
)

---- ANSWER Peter Menard ----


-- 4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM address
    WHERE district like 'Nepal'
    ORDER BY district DESC
)

---- ANSWER NONE ---

-- 5. Which staff member had the most transactions?


SELECT first_name, last_name
FROM staff
WHERE staff_id IN(
    SELECT staff_id
    FROM rental
    GROUP BY staff_id
    ORDER BY MAX(rental_id)
)


-- ANSWER Mike Hillyer (not sure if this is even correct??)


-- 6. How many movies of each rating are there?

SELECT COUNT(title), rating
FROM film
GROUP BY rating
HAVING COUNT(title) > 0

--- ANSWER:
--- NC-17 : 209
--- G : 178
--- PG-13: 223
--- PG : 194
--- R : 196

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING (amount) > 6.99
    ORDER BY (amount) ASC
)

--- ANSWER Peter Menard made MORE than one payment above $6.99, no one else made a single payment above $6.99

-- 8. How many free rentals did our stores give away?

SELECT amount
FROM payment
WHERE amount <= 0
GROUP BY amount
ORDER BY amount DESC

---ANSWER 23 free rentals ---
