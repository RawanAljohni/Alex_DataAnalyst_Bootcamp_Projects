-- limit & Aliasing 

Select * 
from employee_demographics
order by Age DESC;

Select * 
from employee_demographics
order by Age DESC
limit 3;

Select * 
from employee_demographics
order by Age DESC
limit 3,1;


-- Aliasing 

Select gender , Avg(age) AS Avg_Age
from employee_demographics
group by gender
having Avg(age) > 40 ;