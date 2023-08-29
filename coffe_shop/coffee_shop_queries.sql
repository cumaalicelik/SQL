--extract, seperate year, month and day

select 
	hire_date,
	extract (year from hire_date) as year,
 	extract (month from hire_date) as month,
  	extract (day from hire_date) as day
from employees

-- concatenate first and last names

select 
first_name || ' ' || last_name as full_name
from employees

-- or...
select 
concat(first_name, ' ', last_name) as full_name
from employees

-- make a sentence
select 
	first_name || ' ' || last_name || ' earns USD' || salary || ' monthly' as profile_text
from employees

-- if more than 50K salary or not and female, true or false

select 
salary,
concat(first_name, ' ', last_name) as full_name,
(salary < 50000 and gender ='F') as less_than_50K_female
from employees;

-- 2nd way
select 
salary,
concat(first_name, ' ', last_name) as full_name,
case 
when salary < 50000 and gender ='F' then 1
else 0
end
from employees;

--checking if mails are .com and .gov or not
select 
email,
(email like '%.com%') or (email like '%.gov%') as valid_email
from employees

-- com for 1 and gov 2 not valids are 0
select 
email,
case
when email like '%.com%' then 1
when email like '%.gov%' then 2
else 0
end as validity
from employees

-- want to see the email extensions only
select
email,
substring(email from position('@' in email))
from employees
where email is not null;

-- we also do not want to see @ sign
select
email,
substring(email from position('@' in email)+1)
from employees
where email is not null;


-- filling null instead of 'NO EMAIL PROVIDED'
select 
	email,
	coalesce(email, 'NO EMAIL PROVIDED')
from employees;

-- with different aspect
select 
	email,
	case
	when email is NULL then 'NO EMAIL PROVIDED'
	else 'OK'
	end as mail_situation
from employees;


-- we will categorize the salaries low, medium and high

select
	employee_id,
	first_name,
	last_name,
	salary,
	CASE
		when salary < 20000 then 'low pay'
		when salary between 20000 and 50000 then 'medium pay'
		when salary > 50000 then 'high pay'
		else 'no pay'
	END  as pay_category
from employees
order by salary desc;

--we will now count them

select
	count(*) as category_count,
	CASE
		when salary < 20000 then 'low pay'
		when salary between 20000 and 50000 then 'medium pay'
		when salary > 50000 then 'high pay'
		else 'no pay'
	END  as pay_category
from employees
group by pay_category
order by category_count desc

-- 2nd way with subquery

with T1 as (
select
	employee_id,
	first_name,
	last_name,
	salary,
	CASE
		when salary < 20000 then 'low pay'
		when salary between 20000 and 50000 then 'medium pay'
		when salary > 50000 then 'high pay'
		else 'no pay'
	END  as pay_category
from employees
order by salary desc
)
select 
	pay_category,
	count(*) from T1
group by pay_category
order by pay_category desc

-- transpose above; 3rd way

select
		sum(case when salary < 20000 then 1 else 0 end) as low_pay,
		sum(case when salary between 20000 and 50000 then 1 else 0 end) as medium_pay,
		sum(case when salary > 50000 then 1 else 0 end) as high_pay
from employees;	

--- show max salary in every row
select first_name,
	last_name,
	salary,
	(select max(salary) from employees)
from employees

-- if the salary is higher than average or not and bring the gap ?

select first_name,
	last_name,
	salary,
	case when salary - (select avg(salary) from employees) > 0 then 'Yes' else 'No' end as higher_than_avg,
	salary - (select round(avg(salary),0) from employees) as salary_gap
from employees

-- return all employees who work in US coffee shops

select * 
from employees
where coffeeshop_id in
	(
	select coffeeshop_id
	from shops
	where city_id in
		(select city_id from locations
		where country = 'United States')
	);
	
-- return all employees who make over 35K and work in UK coffee shops and email must not be appropriate that only ends with gov

select * 
from employees
where email like '%gov' and 
	salary >35000 and
	coffeeshop_id in
	(
	select coffeeshop_id
	from shops
	where city_id in
		(select city_id from locations
		where country = 'United Kingdom')
	);
	
	
--- 30 days moving total payment
SELECT
    hire_date,
    salary,
    SUM(salary) OVER (ORDER BY hire_date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS moving_total
FROM employees;
	
	