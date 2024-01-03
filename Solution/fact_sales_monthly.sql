select * from fact_sales_monthly
where fiscal_year = 2021
limit 5;

select sum(sold_quantity) from fact_sales_monthly;