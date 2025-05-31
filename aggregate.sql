use newschema;
select * from payments;
select * from orderdetails;
select status from orders group by status;
select sum(amount) as sum_of_amount from payments;
select sum(od.quantityordered*od.priceeach) as sum_of_quantityordered, o.status from orders o inner join orderdetails od on o.ordernumber=od.ordernumber group by o.status;
select count(od.quantityordered) as sum_of_quantityordered, o.status from orders o inner join orderdetails od on o.ordernumber=od.ordernumber group by o.status order by o.status limit 1 offset 1;