#join is a clause which is used to combine the records of 2 or more table on the bases of related cloumns btw them

#cross join 
#it is also known as cartisian join(cross product ) 
#no. of records of table one multipy by no. of records of table 2

#inner join 
#it returns matched records 
#note: without ON condition inner join behaves like cross join

#left join
#inner + remaining value of left table

#right join 
#inner + remaining valuue of right table

#full join 
#inner + remaining value of left + remianing value of right

#natural join works on common column name

create database joins;
use joins;

create table table1(id int);
create table table2(id int);

insert into table1 (id) values (1),(1),(1),(2),(3),(3),(3),(null);
insert into table2 (id) values (1),(1),(2),(4),(null);

#cross join
#select cloumnlist from tablename cross join tablename;
#note if on is used then it works like inner jion

select * from table1 cross join table2;
select count(*) from table1 cross join table2;    
select * from table1 t1 cross join table2 t2 on t1.id=t2.id; 

#inner join 
#select columnlist from tablename inner join/join tablename on tablename.column=tablename.columnname;
#note it behave like cross join if on not written

select * from table1 join table2 on table1.id=table2.id; 
select count(*) from table1 join table2 on table1.id=table2.id;
select * from table1 join table2;
select count(*) from table1 join table2;

#left join
select * from table1 t1 left join table2 t2 on t1.id=t2.id;

#right join
select * from table1 t1 right join table2 t2 on t1.id=t2.id; 

#natural join
select * from table1 natural join table2;
alter table table1 rename column eid to id;

#full join 
#remaining value of left table + remaing value of right table+ inner join
use joins;
select * from table1 t1 left join table2 t2 on t1.id=t2.id
union all 
select * from table1 t1 right join table2 t2 on t1.id=t2.id where t1.id is null;

select * from table1 t1 left join table2 t2 on t1.id=t2.id where t2.id is null
union all 
select * from table1 t1 right join table2 t2 on t1.id=t2.id;
