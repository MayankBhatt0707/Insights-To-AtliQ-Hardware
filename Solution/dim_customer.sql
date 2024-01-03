show tables;

select * from dim_customer
limit 5;

select count(customer_code) from dim_customer;

select count(distinct customer) from dim_customer;

select distinct customer from dim_customer;

select distinct platform from dim_customer;

select distinct channel from dim_customer;

select distinct market from dim_customer;
select count(distinct market) from dim_customer;

select distinct sub_zone from dim_customer;
select count(distinct sub_zone) from dim_customer;

select distinct region from dim_customer;