/* Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/

with cte as
(
select channel, sum(round((sold_quantity * gross_price)/ 1000000, 2)) gross_sales_mln 
from dim_customer c
join fact_sales_monthly fsm
using(customer_code)
join fact_gross_price p
on fsm.product_code = p.product_code and
fsm.fiscal_year = p.fiscal_year
where p.fiscal_year = 2021
group by channel
)
select channel, gross_sales_mln, concat(round(100 * (gross_sales_mln/ sum(gross_sales_mln) over()), 2), "%") percentage
from cte
group by channel