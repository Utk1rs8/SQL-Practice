use cybrom;
select * from employees;
Delimiter //
create procedure getdeptinfo(in deptid int)
begin
select first_name,last_name,salary from employees where department_id=deptid;
end //
delimiter ;
desc employees;

call getdeptinfo(2);

Delimiter //
create procedure getdeptout(out total int)
begin
select count(*) as total from employees;
end //
delimiter ;

call getdeptout(@total);

select * from departments;
select * from employees;