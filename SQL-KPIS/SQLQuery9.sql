with ct1 as (
select c.customer_id, c.customer_name
from dbo.clientes c
),
ct2 as (
select ot.customer_name, sum(v.quantity*v.unit_price) as venta_total
from dbo.fact_ventas v
join ct1 ot on ot.customer_id = v.customer_id
where quantity >=0
group by customer_name
)
select top 5 customer_name, venta_total
from ct2
order by venta_total desc
