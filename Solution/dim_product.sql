select * from dim_product
limit 5;

select count(distinct product_code) from dim_product;


select count(distinct product) from dim_product;
select distinct product from dim_product;

select distinct division from dim_product;

select distinct segment from dim_product;

select distinct category from dim_product;
select count(distinct category) from dim_product;

select distinct variant from dim_product;
select count(distinct variant) from dim_product;