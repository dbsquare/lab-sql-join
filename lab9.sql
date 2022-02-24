-- List the number of films per category.
select d.name, count(c.film_id) as num_rental
from category as d
join film_category c
on d.category_id = c.category_id
group by d.name;

-- Display the first and the last names, as well as the address, of each staff member.
select first_name, last_name, address
from staff s
join address a
on s.address_id = a.address_id;

-- Display the total amount rung up by each staff member in August 2005.
select * from payment;
SELECT D.first_name, D.last_name, sum(C.amount) as total_am
FROM staff AS D
JOIN payment AS C
ON D.staff_id = C.staff_id
where c.payment_date between "2005-08-01" and "2005-08-31"
group by D.first_name, D.last_name;


-- List all films and the number of actors who are listed for each film.
select f.title, count(fa.actor_id)
from film f
left join film_actor fa
on f.film_id = fa.film_id
group by f.title;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT D.first_name, D.last_name,sum(C.amount)
FROM customer AS D
left JOIN payment AS C
ON D.customer_id = C.customer_id
group by D.first_name, D.last_name
order by D.last_name asc;


