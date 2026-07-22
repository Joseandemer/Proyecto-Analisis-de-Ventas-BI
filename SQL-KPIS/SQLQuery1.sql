with ct1 as (
select c.customer_id, c.customer_name
from dbo.clientes c
),
ct2 as (
select v.customer_id, ot.customer_name
from dbo.fact_ventas v
join ct1 ot on ot.customer_id= v.customer_id
)
select count(distinct(customer_id)) as total
from ct2