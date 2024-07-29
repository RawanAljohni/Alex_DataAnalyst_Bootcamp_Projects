-- Group by --

Select gender 
from employee_demographics
group by gender
;

Select gender , AVG(age) 
from employee_demographics
group by gender
;

Select gender , AVG(age) ,max(age),min(age), count(age)
from employee_demographics
group by gender
;

Select occupation , salary 
from employee_salary
group by occupation , salary
;

-- order by--

Select *
from employee_demographics
order by first_name DESC;

select * 
from employee_demographics
order by age, gender; 