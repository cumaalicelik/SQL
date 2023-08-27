
CREATE TABLE EMPLOYEE
(
    EMP_ID      INT PRIMARY KEY,
    EMP_NAME    VARCHAR(50) NOT NULL,
    DEPT_NAME   VARCHAR(50) NOT NULL,
    SALARY      INT
);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);


select * from employee
where salary > (select avg(salary) from employee); -- subquery

select avg(salary) from employee

select * from employee
where salary > (select max(salary)/2 from employee ); -- subquery

-- Scalar Subquery
-- there is one row and one column
select e.* from employee e
join (select avg(salary) sal from employee) avg_sal
	on e.salary > avg_sal.sal;

-- Multiple row subquery
-- who is earning the highest salary?
--1
SELECT DEPT_NAME, MAX(SALARY) AS HIGHEST_SALARY
FROM EMPLOYEE
GROUP BY DEPT_NAME;

select * from employee
where (dept_name, salary) in (SELECT DEPT_NAME, MAX(SALARY) AS HIGHEST_SALARY
FROM EMPLOYEE
GROUP BY DEPT_NAME);

-- single column, multiple row subquery
/* find the department that do not have any employees */




-- correlated subquery


select avg(salary) 
from employee

select *
from employee e1
where salary > (select avg(salary) 
				from employee e2
			   	where e2.dept_name = e1.dept_name
			   )



-- using a subquery in SELECT clause
/* Fetch all employee details and add remarks to those who earn more than average*/

select * , 
(case when salary >(select avg(salary) from employee) 
then 'Higher than average' 
else null
end) as remarks
from employee

select * from employee


-- find the highest two salary for each department, each dept will be evaluated differently!!!
-- we use RANK(), it bgings the all top N(if there is more than N it also brings )
SELECT 
  emp_name, 
  dept_name, 
  highest_salary
FROM (
  SELECT 
    emp_name, 
    dept_name, 
    salary AS highest_salary,
    rank() OVER (
      PARTITION BY dept_name 
      ORDER BY salary DESC ) AS ranking 
  FROM employee
  GROUP BY dept_name, emp_name, salary
) AS ranked_spending
WHERE ranking <= 2 
;

-- we use RANK(), it only brings N pcs  
SELECT 
  emp_name, 
  dept_name, 
  highest_salary
FROM (
  SELECT 
    emp_name, 
    dept_name, 
    salary AS highest_salary,
    row_number() OVER (
      PARTITION BY dept_name 
      ORDER BY salary DESC ) AS ranking 
  FROM employee
  GROUP BY dept_name, emp_name, salary
) AS ranked_spending
WHERE ranking <= 2 
;

