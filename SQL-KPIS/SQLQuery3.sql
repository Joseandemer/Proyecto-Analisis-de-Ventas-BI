with ct1 as (
select c.customer_id, c.city
from dbo.clientes c
),
ct2 as (
select v.customer_id, ot.city
from dbo.fact_ventas v
join ct1 ot on ot.customer_id= v.customer_id
)
select count(distinct(city)) as ciudades_diferentes
from ct2