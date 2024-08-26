-- where clause 

select * 
from employee_salary
where first_name = "leslie";

select * 
from employee_demographics
where gender = "female";

select * 
from employee_demographics
where gender != "female";

select * 
from employee_demographics
where birth_date > "1985-01-01";


select * 
from employee_salary
where salary >= 50000;

select * 
from employee_salary
where salary > 50000;

-- And or Not -- logical Operators
select * 
from employee_demographics
where birth_date > "1985-01-01"
and gender = "male";

select * 
from employee_demographics
where birth_date > "1985-01-01"
or gender = "male";

select * 
from employee_demographics
where birth_date > "1985-01-01"
or not gender = "male";

select * 
from employee_demographics
where (first_name= "leslie" And age = 44) or age > 55;

--  like statment -- 
-- % and _--
Select *
from employee_demographics
where first_name Like 'jer%';

Select *
from employee_demographics
where first_name Like 'a___%';

Select *
from employee_demographics
where first_name Like '%1980';
