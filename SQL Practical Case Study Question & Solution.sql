#Practical Case Study

-- Query 1:

-- Write a SQL query to fetch all the duplicate records from a table.

-- Tables Structure:

drop table users;
create table users
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

insert into users values
(1, 'Sumit', 'sumit@gmail.com'),
(2, 'Reshma', 'reshma@gmail.com'),
(3, 'Farhana', 'farhana@gmail.com'),
(4, 'Robin', 'robin@gmail.com'),
(5, 'Robin', 'robin@gmail.com');

select * from users;

-- Solution:  Using window function.

SELECT user_id, user_name, email
FROM (
	SELECT *,
		RANK() OVER (PARTITION BY user_name ORDER BY user_id) as rn
	FROM users
order by user_id) x
WHERE x.rn > 1
;

-- Query 2:

-- Write a SQL query to fetch the second last record from a employee table.

-- Tables Structure:
drop table employee;
create table employee
( emp_ID int primary key
, emp_NAME varchar(50) not null
, DEPT_NAME varchar(50)
, SALARY int);

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

select * from employee;

-- Solution:

SELECT emp_id, emp_name, dept_name, salary 
FROM(
	SELECT *,
	row_number() OVER (ORDER BY emp_id desc) as rn
	FROM employee) x
WHERE x.rn=2;

-- Query 3:

-- Write a SQL query to display only the details of employees who either earn the highest salary
-- or the lowest salary in each department from the employee table.

-- Tables Structure:
drop table employee;
create table employee
( emp_ID int primary key
, emp_NAME varchar(50) not null
, DEPT_NAME varchar(50)
, SALARY int);

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

select * from employee;

-- Solution:

select * from employee;

SELECT x.*
FROM employee e
JOIN (SELECT *,
	MAX(salary) OVER (PARTITION BY dept_name) as max_salary,
	MIN(salary) OVER (PARTITION BY dept_name) as min_salary
FROM employee) x
	ON e.emp_id=x.emp_id
AND (e.salary = x.max_salary OR e.salary = x.min_salary)
ORDER BY x.dept_name, x.salary;
;

-- Query 4:

-- From the doctors table, fetch the details of doctors who work in the same hospital but in different speciality.

-- Table Structure:

drop table doctors;
create table doctors
(
id int primary key,
name varchar(50) not null,
speciality varchar(100),
hospital varchar(50),
city varchar(50),
consultation_fee int
);

insert into doctors values
(1, 'Dr. Shashank', 'Ayurveda', 'Apollo Hospital', 'Bangalore', 2500),
(2, 'Dr. Abdul', 'Homeopathy', 'Fortis Hospital', 'Bangalore', 2000),
(3, 'Dr. Shwetha', 'Homeopathy', 'KMC Hospital', 'Manipal', 1000),
(4, 'Dr. Murphy', 'Dermatology', 'KMC Hospital', 'Manipal', 1500),
(5, 'Dr. Farhana', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1700),
(6, 'Dr. Maryam', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1500);

select * from doctors;

-- Solution:

select d1.name, d1.speciality,d1.hospital
from doctors d1
join doctors d2
on d1.hospital = d2.hospital
and d1.id <> d2.id;

-- Sub Question:
-- Now find the doctors who work in same hospital irrespective of their speciality.
SELECT d1.* 
FROM doctors d1
JOIN doctors d2
	ON d1.id <> d2.id AND d1.hospital=d2.hospital AND d1.speciality <> d2.speciality;
    
-- Query 5:

-- From the login_details table, fetch the users who logged in consecutively 3 or more times.

-- Table Structure:

drop table login_details;
create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);

delete from login_details;
insert into login_details values
(101, 'Michael', current_date),
(102, 'James', current_date),
(103, 'Stewart', current_date+1),
(104, 'Stewart', current_date+1),
(105, 'Stewart', current_date+1),
(106, 'Michael', current_date+2),
(107, 'Michael', current_date+2),
(108, 'Stewart', current_date+3),
(109, 'Stewart', current_date+3),
(110, 'James', current_date+4),
(111, 'James', current_date+4),
(112, 'James', current_date+5),
(113, 'James', current_date+6);

select * from login_details;

-- Solution:

select user_name, COUNT(user_name) as repeat_login
from login_details
GROUP BY user_name
;

SELECT DISTINCT user_name
FROM (
	SELECT *,
		CASE
			WHEN user_name = LEAD(user_name) OVER(ORDER BY login_id)
				AND  user_name = LEAD(user_name, 2) OVER (ORDER BY login_id)
			THEN user_name
			ELSE null
			END AS repeated_users
FROM login_details) as x
WHERE x.repeated_users is not null;


-- Query 6:

-- From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.

-- Note: Weather is considered to be extremely cold then its temperature is less than zero.

-- Table Structure:

drop table weather;
create table weather
(
id int,
city varchar(50),
temperature int,
day date
);
delete from weather;
insert into weather values
(1, 'London', -1, '2021-01-01'),
(2, 'London', -2, '2021-01-02'),
(3, 'London', 4, '2021-01-03'),
(4, 'London', 1, '2021-01-04'),
(5, 'London', -2, '2021-01-05'),
(6, 'London', -5, '2021-01-06'),
(7, 'London', -7, '2021-01-07'),
(8, 'London', 5, '2021-01-08');

select * from weather;

-- Solution:

SELECT id, city, temperature, day
FROM
(SELECT * ,
	CASE
		WHEN temperature < 0
			AND lead(temperature) OVER (ORDER BY id) < 0
            AND lead(temperature, 2) OVER (ORDER BY id) < 0
		THEN 'Yes'
        WHEN temperature < 0
			AND lag(temperature) OVER (ORDER BY id) < 0
            AND lead(temperature) OVER (ORDER BY id) < 0
		THEN 'Yes'
		WHEN temperature < 0
			AND lag(temperature) OVER (ORDER BY id) < 0
            AND lag(temperature, 2) OVER (ORDER BY id) < 0
		THEN 'Yes'
        ELSE NULL
	END AS flag
FROM weather) as x
WHERE x.flag = 'Yes';


-- Query 7:

-- Find the top 2 accounts with the maximum number of unique patients on a monthly basis.

-- Note: Prefer the account if with the least value in case of same number of unique patients

-- Table Structure:

drop table patient_logs;
create table patient_logs
(
  account_id int,
  date date,
  patient_id int
);

insert into patient_logs values (1, '2020-01-02', 100);
insert into patient_logs values (1, '2020-01-27', 200);
insert into patient_logs values (2, '2020-01-01', 300);
insert into patient_logs values (2, '2020-01-21', 400);
insert into patient_logs values (2, '2020-01-21', 300);
insert into patient_logs values (2, '2020-01-01', 500);
insert into patient_logs values (3, '2020-01-20', 400);
insert into patient_logs values (1, '2020-03-04', 500);
insert into patient_logs values (3, '2020-01-20', 450);

select * from patient_logs;


-- Solution:

/*
SELECT * FROM patient_logs;
 MONTH account no_of_patients unique patients
 jan	1		2				2				<--YES
 jan	2		4				3				<--YES
 jan	3		2				2				<--NO
 mar	1		1				1				<--YES
 */
 
 SELECT month, account_id, no_of_patients
 FROM (
 SELECT *,
 RANK() OVER (PARTITION BY month ORDER BY no_of_patients DESC, account_id) AS rnk 
 FROM(SELECT month, account_id, COUNT(1) as no_of_patients
 FROM (SELECT 
 DISTINCT DATE_FORMAT(DATE, '%M') as month,
 account_id, 
 patient_id
 FROM patient_logs) pl
 GROUP BY month, account_id) as x
 ) temp
 WHERE temp.rnk IN (1,2)
 ;