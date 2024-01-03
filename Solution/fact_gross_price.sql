select * from fact_gross_price
limit 5;

select distinct fiscal_year
from fact_gross_price;

select sum(gross_price) as `Total Gross Price`
from fact_gross_price;