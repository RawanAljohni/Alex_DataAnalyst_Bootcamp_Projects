-- Triggers and Events

Select *
from employee_demographics;

Select *
From employee_salary;

 -- automatically add data in table employee_demographics when added in employee_salary
DElIMITER $$
Create trigger emp_insert
    After insert on employee_salary
    for each row 
Begin
    INSERT INTO employee_demographics (employee_id,first_name,last_name)   
    VALUES (NEW.employee_id,NEW.first_name,NEW.last_name);   
End $$
DElIMITER ;

-- TRY code 
INSERT INTO employee_salary
values(13,'Jean-Ralphio', 'Saperstein', 'Exntertainment 720 CEO', 1000000 , NULL)


-- Events 







    