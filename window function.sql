create database windows;
use windows;
CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);
      
select * from sales;
select sales_employee,fiscal_year,sale,
row_number() over(order by sale desc)
as no from sales;

select sales_employee,fiscal_year,sale,
row_number() over(partition by sales_employee order by sale desc)
as no from sales;

select sales_employee,sale,
sum(sale) over(partition by sales_employee order by sale) 
as sum from sales;

#window function kpi(key performancce indicator)
#row_number
# dense_rank
# rank
# ntile
# first_value
# last_value

use windows;
select sales_employee,fiscal_year,sale,
first_value(sale) over(partition by sales_employee order by sale desc) 
as sum from sales;

select sales_employee,fiscal_year,sale,
cume_dist() over(partition by sales_employee order by sale desc) 
as sum from sales;