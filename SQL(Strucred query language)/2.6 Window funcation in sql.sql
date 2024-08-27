-- Window functions
-- learn the difrent between group by and window funcation(over) 

Select gender, avg(salary) 
from employee_demographics as dem
join  employee_salary as sal
   on dem.employee_id = sal.employee_id
group by gender;


Select gender, avg(salary) over(partition by gender)
from employee_demographics as dem
join  employee_salary as sal
on dem.employee_id = sal.employee_id;

-- show data for employees using (over) window
Select dem.first_name,dem.last_name, dem.gender, avg(salary) over(partition by gender)
from employee_demographics as dem
join  employee_salary as sal
on dem.employee_id = sal.employee_id;
   
Select dem.first_name,dem.last_name, dem.gender, salary, sum(salary)
over(partition by gender order by dem.employee_id) as rollaing_total
from employee_demographics as dem
join  employee_salary as sal
on dem.employee_id = sal.employee_id;

-- row number funcation 
Select dem.first_name,dem.last_name, dem.gender, salary,
row_number() over(partition by gender order by salary desc)
from employee_demographics as dem
join  employee_salary as sal
on dem.employee_id = sal.employee_id;

-- rank funcation not calculate duplacat
Select dem.first_name,dem.last_name, dem.gender, salary,
row_number() over(partition by gender order by salary desc) rowNum_fun,
rank() over(partition by gender order by salary desc) runk_fun
from employee_demographics as dem
join  employee_salary as sal
on dem.employee_id = sal.employee_id;








