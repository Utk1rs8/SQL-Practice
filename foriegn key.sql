create database lotus;
use lotus;
create table product(pid int primary key,pname varchar(30),price decimal(10,2));
create table users(uid int primary key,uname varchar(30),mobile varchar(20));

#foriegn key
create table orders(oid int primary key,userid int,pid int,foreign key(userid) references users(uid));

#Adding foreign key through alter 
#alter table tablename add foreign key(columnname) refrence (columnname); 
alter table orders add foreign key(pid)references product(pid);

#drop foreign key
#alter table tablename drop foreign key keyname;
#alter table tablename drop  key keyname;
alter table orders drop foreign key orders_ibfk_1; #userid foreign key
alter table orders drop key userid;
desc orders;
alter table orders drop foreign key orders_ibfk_2; #pid foreign key
alter table orders drop key pid;

alter table product drop primary key;
alter table product modify pid int;

alter table users drop primary key;
alter table users modify uid int; 
desc orders;
desc product;
desc users;
show tables;
