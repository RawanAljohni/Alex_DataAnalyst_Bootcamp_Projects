-- Stord procedures

-- create procedure
Create procedure Larg_Salaries()
Select * 
from employee_salary
where  salary >= 50000;

-- call procedure
call Larg_Salaries();

DELIMITER $$
Create procedure Larg_Salaries2()
Begin
  Select * 
  from employee_salary
  where  salary >= 50000;
  Select * 
  from employee_salary
  where  salary >= 10000;
End $$
DELIMITER ;  
 
call Larg_Salaries2();

DELIMITER $$
Create procedure Larg_Salaries3()
Begin
  Select * 
  from employee_salary
  where  salary >= 50000;
  Select * 
  from employee_salary
  where  salary >= 10000;
End $$
DELIMITER ;

call Larg_Salaries3();

call new_procedure();

-- Pramaters with procedure
DELIMITER $$
Create procedure large_Salaries4(ID Int)
Begin
   Select Salary
   From employee_salary
   where employee_id = ID
   ;
End $$
DELIMITER ;

call large_Salaries4(10);
