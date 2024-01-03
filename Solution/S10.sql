/* Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
*/

with cte as
(
select division, product_code, sum(sold_quantity), dense_rank() over(partition by division order by sum(sold_quantity) desc) as `rank`
from dim_product 
join fact_sales_monthly
using(product_code)
group by division, product_code
)
select division, product_code
from cte
where `rank` < 4