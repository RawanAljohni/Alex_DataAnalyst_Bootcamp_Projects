-- Having VS Wehrer 

Select gender , Avg (age)
from employee_demographics
group by gender
Having avg(Age) > 40;


Select occupation,Avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 70000
;