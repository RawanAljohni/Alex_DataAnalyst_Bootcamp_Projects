-- Unions
-- each name will only be listed once because UNION selects only distinct values. 
Select first_name, last_name
from employee_demographics
union
select first_name, last_name
from employee_salary;

-- union all  select duplicate values
Select first_name, last_name
from employee_demographics
union all
select first_name, last_name
from employee_salary;


Select first_name, last_name, 'old lady' As label1
from employee_demographics
where age >40 and gender ='female'
union
Select first_name, last_name, 'old man' As label1
from employee_demographics
where age >40 and gender = 'male'
union 
Select first_name, last_name, 'highly pad employee' As label1
from employee_salary
where salary >70000
order by first_name, last_name
; 


 