/* Provide the list of markets in which customer "Atliq Exclusive" operates its
business in the APAC region. */


Delimiter &&
create procedure Ditinct_Market(
in in_customer varchar(45), 
in in_region varchar(45)
)
Begin 
	select distinct market from dim_customer
	where customer = in_customer
	and region = in_region;
end &&
Delimiter &&;
