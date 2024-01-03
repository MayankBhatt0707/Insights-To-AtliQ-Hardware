select * from fact_pre_invoice_deductions
limit 5;


select sum(pre_invoice_discount_pct)
from fact_pre_invoice_deductions;