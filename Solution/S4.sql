/* Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference
*/

with product_count_2020 as 
(
select segment, count(distinct product_code) product_count_2020
from dim_product
join dim_date
using(product_code)
where fiscal_year = 2020
group by segment
order by product_count_2020 desc
),
product_count_2021 as
(
select segment, count(distinct product_code) product_count_2021
from dim_product
join dim_date
using(product_code)
where fiscal_year = 2021
group by segment
order by product_count_2021 desc
)

select segment, product_count_2020, product_count_2021,
	product_count_2021 - product_count_2020 as difference,
    concat(round((product_count_2021 - product_count_2020)/ product_count_2020 * 100, 2), "%") as `%difference`
    from product_count_2021
    join product_count_2020
    using(segment)