/*  Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount
*/

select Month(date) `Month`, fiscal_year `Year`, sum(round(gross_price * sold_quantity, 2))
 `Gross sales Amount`
from fact_gross_price gp
join fact_sales_monthly fsm
using(product_code, fiscal_year)
join dim_customer 
using(customer_code)
group by `Month`, `Year`

