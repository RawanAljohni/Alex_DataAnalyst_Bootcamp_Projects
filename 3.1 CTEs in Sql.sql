-- CTEs
with cte_example as(
Select gender, avg(salary) Avg_Sal,max(salary) Max_Sal,min(salary) Min_Sal,count(salary) count_Sal
from employee_demographics dem
join employee_salary sal
   on dem.employee_id = sal.employee_id
group by gender
)
select avg(Avg_Sal) 
from cte_example;

-- The same idea but different style writing
select avg(Avg_Sal)
from(
Select gender, avg(salary) Avg_Sal,max(salary) Max_Sal,min(salary) Min_Sal,count(salary) count_Sal
from employee_demographics dem
join employee_salary sal
   on dem.employee_id = sal.employee_id
group by gender
)subquery_example;

-- multipule CTEs
with CTEs as(
Select employee_id,gender,birth_date
from employee_demographics dem
where birth_date > '1985-01-01'
),
CTEs2 As(
Select employee_id,salary
from employee_salary
where salary >50000
)
select * 
from CTEs
join CTEs2
   on CTEs.employee_id = CTEs2.employee_id ;

