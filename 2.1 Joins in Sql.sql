-- joins 

select * 
from employee_demographics;

select * 
from employee_salary;

select *
from employee_demographics As dem
inner join employee_salary As sal
  on dem.employee_id =  sal.employee_id;
  
  Select dem.employee_id , age, occupation
  from employee_demographics as dem
  inner join employee_salary as sal
  on dem.employee_id = sal.employee_id;
  
  
  -- Outer join -- lift and rirht --
   Select *
  from employee_demographics as dem
  right outer join employee_salary as sal
  on dem.employee_id = sal.employee_id;
  
   Select *
  from employee_demographics as dem
  left outer join employee_salary as sal
  on dem.employee_id = sal.employee_id;
  
  -- self join, in same table -- 
            -- Eid gift --	
  select emp1.first_name as gift_giver ,emp2.first_name as gift_recipient
  from employee_salary emp1
  join employee_salary emp2
  on emp1.employee_id + 1 = emp2.employee_id;
  
  -- joining multiple tables (3 tables) --
  select *
from employee_demographics As dem
inner join employee_salary As sal
  on dem.employee_id =  sal.employee_id
  inner join parks_departments pd
  on sal.dept_id =pd.department_id ; 
  
  
  
  
