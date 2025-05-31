select 1+1; #will return 2
select concat("welcome ","to ","cybrom"); #will return a concatenate string 
select now(); #will return date and time of present time

use dummy;
show tables;
#select syntax- select column_lsit from tablename;
select * from customers;

#order of execution from then select
select customername,customernumber,city,state,country from customers;

#orderdetails
select * from orderdetails;
#as for aliasing
select ordernumber,productcode,(quantityordered*priceeach) as ordervalue from orderdetails;

#employees
select * from employees;
select employeenumber,concat(firstname," ",lastname) as fullname,jobtitle from employees;

#write an sql query to fetch ordernumber orderdate status from orders
select * from orders;
select ordernumber,orderdate,status from orders;

#sorting
#done by order by
#synatx- select columnname from tablename order bycolumnname1[asce/desc].....n;

#wap to sort the customer by their lastname in asceding order display contactlast ans first
#ascending 
select contactlastname,contactfirstname from customers order by contactlastname;
#descending
select contactlastname,contactfirstname from customers order by contactlastname desc,contactfirstname desc;

#to fetch a orderno. and multiplication of quantityordered and priceeach as ordervalue in decending order
select ordernumber,(quantityordered*priceeach) as ordervalue from orderdetails order by ordervalue desc;

#to fetch employee no,firstname.lasyername,reportsto,jobtitle from employees sort by reportsto
select employeenumber,firstname,lastname,reportsto,jobtitle from employees order by reportsto;

#write a sql query to fetch customer details who are located in us display cusname,cusno.,city,state,country
select * from customers;
select customername,customernumber,city,state,country from customers where country="USA";
#wap to fetch empdetail whos job title is sales reprenestative display empno firstname lastname and jobtitle
select * from employees;
select employeenumber,firstname,lastname,jobtitle from employees where jobtitle="sales rep";

#wap to fetchh sql qruery except sales rep
select employeenumber,firstname,lastname,jobtitle from employees where jobtitle!="sales rep";

#wap to fetch customers detail whos credit limit is greater that 1000
select * from customers;
select customernumber,customername,creditlimit from customers where creditlimit>=10000;

#wap to fetch emmployees details whos job title are sales rep and ofice code are 1
select employeenumber,firstname,lastname,jobtitle from employees where jobtitle="sales rep" and officecode=1;
select employeenumber,firstname,lastname,jobtitle from employees where jobtitle="sales rep" or officecode=1;

#wap to find employees who are located in the office code is from 1 to 3
select employeenumber,lastname,firstname,jobtitle from employees where officecode>=1 and officecode<=3;

#betweem
select employeenumber,lastname,firstname,jobtitle,officecode from employees where officecode between 1 and 3;

#wap to find employees detail who are located in 1,3,5
select employeenumber,lastname,firstname,jobtitle,officecode from employees where officecode in(1,3,5);

#wap to fetch customer derails who are located in usa france or japan
select * from customers where country="france" or country="usa" or country="japan";
select * from customers where country in("usa","france","japan");

#is null, null only works with is operator ,it doesnt work with =
select * from customers where state is NULL;

#is not null
select * from customers where state is not NULL;

#limit
#wap to fetch top 5 customers whos credit limit is highest
select customername,customernumber,creditlimit from customers order by creditlimit desc limit 5; 

#offset
select customername,customernumber,creditlimit from customers order by creditlimit desc limit 3 offset 1; 

#limit with offset
select customername,customernumber,creditlimit from customers order by creditlimit desc limit 0,3; 

#like operator
#string matching
#wasq to fetch customers details whose  name start wiith a
select customername,customernumber,country from customers where customername like "a%";

#wasq to find the employees fullname whos lastname ends with son
select * from employees;
select concat(firstname," ",lastname)as fullname from employees where lastname like "%son";

#wasq to fetch product name who contain car keyword
show tables;
select * from products;
select productname from products where productname like "%car%";

#wasq to find customerdetails whos name starts with vovel
#wasq to find customerdetails whos name starts with vowel and end with vowel

select customername from customers where left(customername,1) in ("a","e","i","o","u");
select customername from customers where left(customername,1) in ("a","e","i","o","u") and right(customername,1) in ("a","e","i","o","u");

select * from customers;
select * from orders;

select c.customernumber,c.customername from customers c left join orders o on c.customernumber=o.customernumber where o.customernumber is null;
use dummy;
select * from customers;
select c.customernumber,customername,status from customers c cross join orders;

show tables;
select * from employees;

#wasq to fetch customername and their sales representative rep
select customername,employeenumber,concat(firstname," ",lastname) as empname from employees e 
inner join customers c on employeenumber=salesrepemployeenumber;

#wasq to fetch customernamen,ordernumber,orderdate,ordervalue,productcode,productname from customers,orderdetail,products
select * from customers;
select * from orders;
select * from orderdetails;
select * from products;

select customername,o.ordernumber,orderdate,(quantityordered*priceeach)ordervalue,p.productcode,productname from customers c
inner join orders o on c.customernumber=o.customernumber 
inner join orderdetails od on o.ordernumber=od.ordernumber 
inner join products p on od.productcode=p.productcode;


#wasq to fetch customername and their sales rep name and also fetch order date and order status
select customername,concat(firstname," ",lastname)as empname,orderdate,status from customers c 
inner join employees e on c.salesrepemployeenumber=e.employeenumber 
inner join orders o on c.customernumber=o.customernumber;

#wasq to fetch customer who have not placed any order
#wasq to fetch product who have not been sell
select * from customers;
select customername from customers c left join orders o on c.customernumber=o.customernumber where o.customernumber is null;
select productname from products p left join orderdetails od on p.productcode=od.productcode where od.productcode is null;


#wasq to fetch the customer who have nnot made any payments fetch customer name customer number 
select * from payments;
select c.customernumber,customername from customers c left join payments p on c.customernumber=p.customernumber 
where p.customernumber is null;
select * from employees;
#wasq to fetch managers and their direct report
select e1.employeenumber,concat(e1.firstname," ",e1.lastname) as managers,concat(e2.firstname," ",e2.lastname) as reports_to,e2.employeenumber from employees e2 
left join employees e1 on e1.employeenumber=e2.reportsto;

#group by- it is a clause that group similar record into a summary record based on column value or expresion it reduces the number or rows into a single record for each group
#syntax- select coulmnlist.... from tablename group by columnname;

#wasq to fetch unique  records from status column
#order of execution from->where->select,group by,having->distinct->order by->limit
use dummy;
select distinct status from orders;
select status,count(status) from orders group by status;

#wasq to fetch customer and their order count;
select * from customers;
select * from orders;
select * from orderdetails;
select * from products;
select customername,count(o.customernumber) as ordercount from customers c inner join orders o on c.customernumber=o.customernumber group by customername;
#wasq to fetch customer and thier total sales 
select c.customernumber,customername,sum(priceeach*quantityordered) as total_sales from customers c 
inner join orders o on c.customernumber=o.customernumber
inner join orderdetails od on o.ordernumber=od.ordernumber
group by c.customernumber,customername
order by total_sales desc;

select productline,sum(quantityordered*priceeach) as totalordervalue from products inner join orderdetails using (productcode) group by productline;
select productline,year(orderdate) as orderyear,sum(quantityordered*priceeach) as totalordervalue from products 
inner join orderdetails using (productcode) inner join orders using(ordernumber) group by productline,orderyear;
#wasq to fetch total sales for each year
select year(orderdate)as orderyear,sum(quantityordered*priceeach) as totalordervalue from orderdetails 
inner join orders using (ordernumber) group by orderyear having orderyear>=2004 and totalordervalue>50000;

#wasq to fetch ordernumber the no. of items sold per order and total sale for each order and find order having total sales > 10000 and total item count in >600
select ordernumber,sum(quantityordered*priceeach)as totalsales,sum(quantityordered) as itemcount 
from orderdetails group by ordernumber
having totalsales>10000 and itemcount>600;

#wasq that returns orderyear orderstatus and total ordervalue for each combo of order year and status
select * from orderdetails;
select year(orderdate) as orderyear,status,sum(quantityordered*priceeach) as totalordervalue 
from orders inner join orderdetails using(ordernumber) group by 1,2;

#wasq that returns total order value , summarized by product line and orderyear
select productline,year(orderdate) as orderyear,sum(quantityordered*priceeach) as totalordervalue from products 
inner join orderdetails using (productcode) inner join orders using(ordernumber) group by productline,orderyear;

#create a table with select query
create table sales 
select productline,year(orderdate) as orderyear,sum(quantityordered*priceeach) as totalordervalue
from products inner join orderdetails using (productcode) 
inner join orders using(ordernumber) 
group by productline,orderyear;

select * from sales;
#wasq to fetch total ordrevalue
select sum(totalordervalue) from sales;

#rollup
#wasq to fetch productline and totalordervalue sum and group by with productline
select productline,sum(totalordervalue) from sales group by productline with rollup;

#if null
#wasq to fetch productline and totalordervalue sum and group by with productline and give the name of null cell as totalsum
select ifnull(productline,"totalsum"),sum(totalordervalue) from sales group by productline with rollup;

#multiple with rollup
select productline,orderyear,sum(totalordervalue) as totalordervalue from sales group by productline,orderyear with rollup;
select productline,orderyear,sum(totalordervalue) as totalordervalue from sales group by orderyear,productline with rollup;

select * from products;
select avg(buyprice) from products;
select avg(buyprice) from products where productline="classic cars";
select count(buyprice)-count(distinct(buyprice)) from products ;
select productline,buyprice from products group by productline,buyprice having(avg(buyprice)>50);
select max(buyprice),min(buyprice),avg(buyprice) from products;


#wasq to fetch customer and their sales rep
select * from customers;
select * from employees;
select customername,concat(firstname," ",lastname)as salesrep 
from customers inner join employees 
on (salesrepemployeenumber=employeenumber);


#cte-common table expresion 

#group concat solving with
select concat(firstname," ",lastname)as salesrep,
group_concat(distinct customername order by customername separator "/") as customernames 
from customers inner join employees 
on (salesrepemployeenumber=employeenumber)
group by salesrep;


#wasq to find customer name,customernumber and thire order count
with cte as(select customername,customernumber,count(*) as ordercount
from customers inner join orders 
using(customernumber)
group by customername,customernumber
order by customername)
select *,case ordercount when 1 then "one time customer"
when 2 then "repeated customer"
when 3 then "frequent customer"
else "loyal customer"
end as customertype from cte;

with cte as(select customername,customernumber,count(*) as ordercount
from customers inner join orders 
using(customernumber)
group by customername,customernumber
order by customername)
select *,case when ordercount=1 then "one time customer"
when ordercount=2 then "repeated customer"
when ordercount=3 then "frequent customer"
else "loyal customer"
end as customertype from cte;

#wasq to fetch customername and their  total sales on the bases of total sales create a conditional column and they are if sales<10000
# then customertype is silver ,<100000 gold , >100000 platinum customer

with cte as(select customername,sum(priceeach*quantityordered) as totalsales 
from customers inner join orders using(customernumber) 
inner join orderdetails using(ordernumber) 
group by customername)
select *,
case when totalsales<10000 then "silver"
when totalsales>=10000 and totalsales<=100000 then "gold"
when totalsales>100000 then "platinum" end
as customertype from cte;

with cte as(select customername,sum(priceeach*quantityordered) as totalsales 
from customers inner join orders using(customernumber) 
inner join orderdetails using(ordernumber) 
group by customername)
select *,
case when totalsales<10000 then "silver"
when totalsales between 10000 and 100000 then "gold"
when totalsales>100000 then "platinum" end
as customertype from cte order by customername;

#multiple cte

with cte as(select customername,sum(priceeach*quantityordered) as totalsales 
from customers inner join orders using(customernumber) 
inner join orderdetails using(ordernumber) 
group by customername),cte1 as
(select *,
case when totalsales<10000 then "silver"
when totalsales between 10000 and 100000 then "gold"
when totalsales>100000 then "platinum" end
as customertype from cte)
select customertype,count(customertype) as customertypecount from cte1 
group by customertype;

select status,count(status) from orders group by status;

select sum(case status when "shipped" then 1 else 0 end) as shipped,
sum(case status when "resolved" then 1 else 0 end) as resolved,
sum(case status when "cancelled" then 1 else 0 end) as cancelled,
sum(case status when "on hold" then 1 else 0 end) as "on hold",
sum(case status when "disputed" then 1 else 0 end) as disputed,
sum(case status when "in process" then 1 else 0 end) as "in process",
count(*) as totalcount
from orders;

#if function
select 
sum(if(status="shipped",1,0)) as "shipped",
sum(if(status="resolved",1,0)) as "resolved",
sum(if(status="cancelled",1,0)) as "cancelled",
sum(if(status="on hold",1,0)) as "on hold",
sum(if(status="disputed",1,0)) as "disputed",
sum(if(status="in process",1,0)) as "in process",
count(*) as total_orders
from orders;

#wasq to fetch customername,state,country from customers sort the customers by state if state not null or sort by country if state is null 
select * from customers;

select customername,state,country 
from customers
order by (case when state is null then country else state end);

select customername,state,country 
from customers
order by if(state is null,country,state);

#if null
#it is a function that fill the null values of given column to a strinng
#syntax: ifnull(columnname,"string") 
select ifnull(state,"N/A"),country from customers;

#coalesce
#it is a function that takes n...number of columns and returns a single column 
#where it finds that in the first column there is a null value then it returns the value of other column of same row 
select coalesce(state,country) from customers;


#concat_ws
#syntax: concat_ws("seperator",catagoricalcolumnname)
select concat_ws(" ","welcome","to","bhopal");

#upper(),lower()
select upper("hello");
select lower("HELoo");

#left and right
#it is a function that helps us in fetching a substring from a string 

select left("cybrom",2);
select right("cybrom ",2);

#wasq to fetch customername whos name starts with vowel and ends with consonant
select * from customers;
select customername from customers where left(customername,1)in("a","e","i","o","u") 
and right(customername,1) not in("a","e","i","o","u",".");

#substring
#substring(string,position,no of ,character)
select substring("cybrom",1,1);
select customername from customers where  substring(customername,1,1) in ("a","e","i","o","u")
and substring(customername,-1,1) not in ("a","e","i","o","u",".");


#trim
#it have ltrim and rtrim too
#it removes leading and trailing spaces from string or categorical column
select trim("   welcome  to      cybrom     ");
select ltrim("   welcome  to      cybrom     ");
select rtrim("   welcome  to      cybrom     ");


#reverse()
select reverse("cybrom");

#replace(string,oldstring,newstring)
select replace("welcome to cybrom","cybrom","bhopal");

#length(string)
select length("cybrom");

#instr(string,substring)
#it returns position of the substring
select instr("welcome to bhopal","bhopal");

#wasq to fetch productname that contain car keyword in it
select productname from products where instr(productname,"car");

#date function

select curdate();
select current_time();
select current_time();
select sysdate();
select now();

select sysdate(),sleep(5),sysdate();
select now(),sleep(5),now();


select year(now());
select month(now());
select monthname(now());
select quarter(now());	
select date(now());
select time(now());
select week(now());
select weekday(now());
select dayname(now());

select * from products;

select * from customers;
select * from orders;
select * from employees;
select * from products;
select * from orderdetails;

select customername, concat(firstname," ",lastname) as full_name 
from customers inner join employees 
on salesrepemployeenumber=employeenumber;

select customername, concat(firstname," ",lastname) as full_name 
from customers left join employees 
on salesrepemployeenumber=employeenumber where salesrepemployeenumber is null;

select c.customernumber,ordernumber,customername 
from customers c inner join orders o 
on c.customernumber=o.customernumber;

select ordernumber,productname 
from orderdetails 
left join products using(productcode) 
where orderdetails.productcode is null;


select p.productname from products p left join orderdetails od
on p.productcode = od.productcode where od.productcode is null;

select customername,sum(quantityordered) 
from customers c inner join orders o on c.customernumber=o.customernumber
inner join orderdetails od on o.ordernumber=od.ordernumber group by customername;

select concat(firstname," ",lastname) as full_name 
from employees left join customers
on employeenumber = salesrepemployeenumber where salesrepemployeenumber is null;

select customername,concat(firstname," ",lastname) as full_name,creditlimit
from customers inner join employees on salesrepemployeenumber=employeenumber
order by creditlimit desc limit 5;

select concat(firstname," ",lastname) as full_name,count(customernumber) as customercount
from employees inner join customers
on employeenumber = salesrepemployeenumber group by full_name having customercount>5;

select ordernumber,productname 
from orders inner join orderdetails using(ordernumber)
inner join products using(productcode);

select * from products order by buyprice desc limit 1;

select concat(firstname," ",lastname) as full_name,sum(creditlimit) as total_revenue
from employees inner join customers
on employeenumber = salesrepemployeenumber group by full_name order by total_revenue desc limit 1;

select * from employees;

#view 
#it is a function which create a temporary table from a table, it is used for security purpose
create view new_view as select * from customers where city = "nantes";
select * from new_view;
create view cust_view as select customernumber,customername,state,creditlimit from customers;
select * from cust_view;

#temptable view
#have only single direction relation, cannot change in child, but if changes happen in parent then happens in child
create algorithm=temptable view contp(
customername,
firstname,
lastname,
phone)as
select customername,contactfirstname,contactlastname,phone from customers;

select * from contp;

#merge view
#have only bi-direction relation, changes can happen in both.
 
create algorithm=merge view contp1(
customername,
firstname,
lastname,
phone)as
select customername,contactfirstname,contactlastname,phone from customers;

use dummy;
select * from orders;
select * from customers c left join orders o on c.customernumber=o.customernumber where o.ordernumber is null;

select * from boats;
select * from sailors;
select * from reserves;
select sname,bid from sailors inner join reserves using(sid) inner join boats using(bid) where bid=103;
select distinct color from boats inner join reserves using(bid) inner join sailors using(sid) where sname="lubber";
select sname,color from boats inner join reserves using(bid) inner join sailors using(sid) where color="red" or color="green";
select sid,sname,count(r.sid) from sailors s inner join reserves r using(sid) group by sid,sname;
select sid,sname,count(r.sid) from sailors s left join reserves r using(sid) group by sid,sname;

SELECT s.sname 
FROM SAILORS s
LEFT JOIN RESERVES r ON s.sid = r.sid
WHERE r.sid IS NULL;

use cybrom;
select sid,sname,count(r.sid) as total_count from sailors s inner join reserves r using(sid) group by sid,sname order by total_count desc limit 1;

SELECT s.sname
FROM SAILORS s
JOIN RESERVES r ON s.sid = r.sid
GROUP BY s.sname, r.bid
HAVING COUNT(DISTINCT r.day) > 1;

SELECT DISTINCT s.sname
FROM SAILORS s
JOIN RESERVES r ON s.sid = r.sid
WHERE r.day < '1998-01-01';
	
SELECT DISTINCT s.sname
FROM SAILORS s
JOIN RESERVES r ON s.sid = r.sid
WHERE r.day = (SELECT MAX(day) FROM RESERVES);

SELECT s.sname, COUNT(r.bid) AS num_reservations
FROM SAILORS s
JOIN RESERVES r ON s.sid = r.sid
GROUP BY s.sname
ORDER BY num_reservations DESC;

SELECT DISTINCT s.sname
FROM SAILORS s
JOIN RESERVES r1 ON s.sid = r1.sid
JOIN RESERVES r2 ON s.sid = r2.sid
WHERE r1.day = r2.day - INTERVAL '1' DAY;

SELECT s.sname
FROM SAILORS s
JOIN RESERVES r ON s.sid = r.sid
GROUP BY s.sname, r.day
HAVING COUNT(DISTINCT r.bid) >= 2;

SELECT DISTINCT s.sname
FROM SAILORS s
JOIN RESERVES r ON s.sid = r.sid
WHERE s.sname LIKE 'A%';

SELECT DISTINCT b.color
FROM BOATS b
JOIN RESERVES r ON b.bid = r.bid;

SELECT DISTINCT b.bname
FROM BOATS b
JOIN RESERVES r ON b.bid = r.bid
WHERE r.day BETWEEN '1998-10-01' AND '1998-10-31';

SELECT DISTINCT s.sname
FROM SAILORS s
JOIN RESERVES r ON s.sid = r.sid
WHERE s.rating <= 5;

SELECT b.bname, COUNT(r.sid) AS num_reservations
FROM BOATS b
LEFT JOIN RESERVES r ON b.bid = r.bid
GROUP BY b.bname;

use sql_430;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    manager_id INT
);
INSERT INTO Employees (emp_id, first_name, last_name, department_id, salary, manager_id) VALUES
(1, 'Michael', 'Anderson', 1, 5000, NULL),
(2, 'Sophia', 'Williams', 2, 6000, 1),
(3, 'David', 'Martinez', 1, 4500, 1),
(4, 'Olivia', 'Garcia', 3, 7000, 2),
(5, 'James', 'Rodriguez', 2, 5500, 1);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

select concat(first_name," ",last_name) as full_name,salary 
from employees where 
salary>=(select avg(salary) from employees);

--  Find employees who earn more than the average salary of
-- their department.
--  List departments with employees earning more than 6000.
--  Find employees working in the same department as &#39;Jane
-- Smith&#39;.
--  Retrieve the name of employees who don’t have a manager.
--  Find departments with no employees.
--  Get employees whose salary is higher than their manager&#39;s
-- salary.
--  List the highest-paid employee in each department.
--  Display employees working in HR or IT using a subquery.
--  List employees with the same salary as ‘John Doe’.
--  Find the second-highest salary in the Employees table.
--  List employees who are managers.
--  Display the department with the highest average salary.
--  Get employees who work under &#39;Jane Smith&#39;.
--  Retrieve employee details whose salary is above the company
-- average.
--  Find the department with the most employees.
--  List employees whose salary is below the average of all
-- employees.
--  Find employees in the same department as their manager.
--  Get employee names who are in the IT department but not
-- managed by &#39;John Doe&#39;.
--  Find employees who have the same manager as &#39;Bob Brown&#39;.
-- Retrieve employees whose salary is above the salary of any
-- employee in HR.

select * from employees;
select * from departments;

select concat(first_name," ",last_name) as full_name,department_name,salary 
from employees inner join departments using(department_id)
where salary>=(select avg(salary) from employees);

select department_name,salary from departments
inner join employees using(department_id)
where salary>=(select 6000);

select department_id,concat(first_name," ",last_name) as employee_name from employees
where department_id=(select department_id
from employees where first_name="James");

