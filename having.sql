use newschema;
select customernumber,sum(amount) as total_amount from payments group by customernumber having total_amount>=30000 order by total_amount;
select * from customers;
select * from orders;
select * from orderdetails;
select od.ordernumber,sum(quantityordered) as total_quantity ,o.status from orderdetails od inner join orders o using(ordernumber) group by status,ordernumber
having total_quantity>50 and status="shipped"; 
select customername,count(ordernumber) as no_of_orders from customers c inner join orders o using(customernumber) group by customername having no_of_orders>5;