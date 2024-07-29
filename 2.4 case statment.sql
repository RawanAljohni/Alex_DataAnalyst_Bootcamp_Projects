-- Case Statments

Select first_name,
last_name , age,
case 
    when age <=30 then 'Young' 
    when age between 31 and 51 then 'old'
    when age >= 50 then 'on death'
end as age_bracket
from employee_demographics;
-- pay increase and bounse 
-- <50000 = 5%
-- >50000 =7%
-- finace = 10% bonus

select first_name, last_name, salary,
case
  when salary < 50000 then salary * 1.05
  when salary > 50000 then salary * 1.07
end As New_salary, 
case
when dept_id = 6 then salary * 0.10 
end as bouns
from employee_salary; 

select *
from employee_salary;
select* 
from parks_departments;