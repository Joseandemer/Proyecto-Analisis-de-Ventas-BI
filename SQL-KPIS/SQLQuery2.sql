with ct1 as (
select v.product_id, v.quantity 
from dbo.fact_ventas v
),
ct2 as (
select p.product_id, ot.quantity
from dbo.productos p
join ct1 ot on ot.product_id = p.product_id
)
select sum(quantity) as cantidad_productos 
from ct2
where quantity >=0