-- subqueries 
select * 
from employee_demographics;

-- Select employes in dep=1 --
select * 
from employee_demographics
where employee_id in 
      (select employee_id
	  from employee_salary
       where dept_id = 1);
       
select first_name, salary,  
(select Avg(salary) 
from employee_salary) As avg_salary  
from employee_salary;

Select gender,Avg (Age) as Avg_age ,max(age) as Max_age ,min(age) as Min_age,count(age) count
from employee_demographics
group by gender;


select Avg(Age)
from employee_demographics
group by gender;

 -- select avg age for both gender 
Select Avg(Max_age), Avg(Min_age)
from
  (select gender,
  Avg (Age) as Avg_age,
  max(age) as Max_age ,
  min(age) as Min_age,
  count(age) count 
  from employee_demographics
   group by gender) 
as Age_table;

