select * from customer;

select first_name, last_name, email from customer

select concat(first_name, ' ', last_name) as name_surname from customer;

/* Order By */ 

select first_name, last_name from customer order by first_name;

select first_name, last_name from customer order by last_name desc;

select first_name, last_name from customer order by first_name, last_name desc;

-- name and name length and order according to the length of the names
select first_name, length(first_name) as name_length from customer order by name_length;

-- WHERE --

--bring Jamie
select first_name, last_name from customer where first_name = 'Jamie';

--bring Jamie Rice
select first_name, last_name from customer where first_name = 'Jamie'and last_name = 'Rice';

-- name rodriguez or surname Adam
select first_name, last_name from customer where first_name = 'Rodriguez' or last_name = 'Adam';

-- names Ann, Anne, Annie
select first_name, last_name from customer where first_name in ('Ann', 'Anne', 'Annie');

-- starts with A and lenght are between 3 and 5 names
select first_name, last_name, length(first_name) as name_length from customer 
where first_name like 'A%' and length(first_name) between 3 and 5
order by name_length desc;

-- name starts with Bra, surname not Matley
select first_name, last_name from customer where first_name like 'Bra%' and last_name <> 'Motley'

/* Limit and Fetch */
--film_id and title from film
select film_id, title from film;

-- first row
select film_id, title from film fetch first row only;

select film_id, title from film order by film_id fetch first row only;

-- first 5 rows
select film_id, title from film fetch first 5 row only;

select film_id, title from film limit 5;

--skip first 5 rows and fetch 7 rows
select film_id, title from film order by film_id offset 5 rows fetch next 7 rows only;

select film_id, title from film order by film_id offset 5 rows limit 7;

--
select film_id, title, release_year from film order by film_id offset 3 limit 4;

/* Between */
select * from payment

--payment table customer_id, payment_id, amount and amount gap 8 and 9 (both included)
select customer_id, payment_id, amount from payment where amount between 8 and 9;

--Between 2007-02-07 and 2007-02-15
select * from payment where payment_date between '2007-02-07' and '2007-02-15';

/* like */
--er in the name in customer
select first_name from customer where first_name like '%er%';

-- starting from 2nd letter of the name and "her" in names
select first_name, last_name from customer where first_name like '_her%';

-- ilike 
select first_name, last_name from customer where first_name ilike 'bar%';


CREATE TABLE contacts(
    id SERIAL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    PRIMARY KEY (id)
);
INSERT INTO contacts(first_name, last_name, email, phone)
VALUES ('John','Doe','john.doe@example.com',NULL),
       ('Lily','Bush','lily.bush@example.com','(408-234-2764)');
	   
select * from contacts;

--tel no null
select * from contacts where phone is NULL;

select * from contacts where id = 1;

select * from contacts where first_name = 'John';

-- not null rows
select * from contacts where phone is not NULL;




	   
	   