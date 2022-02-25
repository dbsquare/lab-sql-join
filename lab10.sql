-- Write a query to display for each store its store ID, city, and country.
select s.store_id, ci.city, co.country 
from store s
join address a
using (address_id)
join city ci
using (city_id)
join country co
using (country_id);

-- Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(p.amount) as profit
from store s
join payment p
group by store_id;

-- What is the average running time of films by category?
select avg(f.length) as avg_l, c.name
from film f
join film_category fc
using (film_id)
join category c 
using (category_id)
group by c.name;


-- Which film categories are longest?

select c.name, max(f.length)
from category c
left join film_category fc
on c.category_id = fc.category_id
join film f
on f.film_id = fc. film_id
group by c.name
order by max(f.length) desc;

-- Display the most frequently rented movies in descending order.

select f.title as movie, count(r.rental_id) as rented_times
from film f
join inventory i 
on f.film_id = i.film_id
join rental r
on r.inventory_id = i.inventory_id
group by f.film_id, f.title
order by count(rental_id) desc;

-- List the top five genres in gross revenue in descending order.
select c.name as genre, sum(p.amount) as gross_revenue
from payment p
join rental r
on r.rental_id = p.rental_id
 
join inventory i
on i.inventory_id = r.inventory_id

join film f
on f.film_id = i.film_id

join film_category fc
on f.film_id = fc.film_id

join category c
on c.category_id = fc.category_id
group by c.name
order by gross_revenue desc
limit 5;

-- Is "Academy Dinosaur" available for rent from Store 1?

select i.store_id, f.title
from film f 
join inventory i
on i.film_id = f.film_id
where i.store_id = 1 and f.title = "Academy Dinosaur";