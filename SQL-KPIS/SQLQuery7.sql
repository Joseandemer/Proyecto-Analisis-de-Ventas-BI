with ct1 as (
select c.customer_id, c.country
from dbo.clientes c
),
ct2 as (
select ot.country, sum(v.quantity) as cantidad_productos
from dbo.fact_ventas v
join ct1 ot on ot.customer_id = v.customer_id
where quantity >=0
group by ot.country
)
select country, cantidad_productos
from ct2
order by cantidad_productos desc