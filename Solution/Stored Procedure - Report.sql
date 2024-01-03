/* Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code 
customer   
average_discount_percentage
*/
delimiter &&
create procedure Generate_Report(
in in_market varchar(45),
in in_fiscal_year varchar(4),
in in_top int)
Begin
	select distinct c.customer_code, customer, concat(round(avg(pre_invoice_discount_pct) * 100, 2), "%") average_discount_percentage
	from dim_customer c
	join dim_date d
	using(customer_code)
	join fact_pre_invoice_deductions p
	on p.customer_code = c.customer_code
	and d.fiscal_year = p.fiscal_year
	where market = in_market
	and d.fiscal_year = in_fiscal_year
	group by c.customer_code, customer
	order by avg(pre_invoice_discount_pct) desc
	limit in_top;
end &&
Delimiter &&;


