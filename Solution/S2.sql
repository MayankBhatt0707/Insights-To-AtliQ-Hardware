/*  What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg
*/

with product_count_2020 as 
(
select count(distinct product_code) unique_products_2020
from dim_product
join dim_date
using(product_code)
where fiscal_year = 2020
),
product_count_2021 as
(
select count(distinct product_code) unique_products_2021
from dim_product
join dim_date
using(product_code)
where fiscal_year = 2021
)
select unique_products_2020, 
	unique_products_2021,
    concat(round((unique_products_2021 - unique_products_2020)/ unique_products_2020 * 100, 2), "%") percentage_chg
from product_count_2020, product_count_2021