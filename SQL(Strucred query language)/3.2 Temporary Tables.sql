-- Temporary Tables 

Create temporary table tem(
first_name varchar(50),
last_name varchar(50),
favority_movie varchar(50)
);

select *
from tem;

insert into tem
values('Alex','frebreg','lord of the rings');

select *
from tem;

select *
from employee_salary;

create temporary table salary_over_50K
select * 
from employee_salary
where salary >= 50000;

select *
from salary_over_50K;


