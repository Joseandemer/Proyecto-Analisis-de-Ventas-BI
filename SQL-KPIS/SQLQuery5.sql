with ct1 as (
select p.product_id, p.product_name, p.category
from dbo.productos p
),
ct2 as (
select v.product_id,ot.product_name, ot.category, round(sum(v.quantity * v.unit_price),2) as ganancia_total 
from dbo.fact_ventas v
join ct1 ot on ot.product_id = v.product_id
where quantity >=0
GROUP BY v.product_id, ot.product_name, ot.category
),
ct3 as (
select product_name, category, ganancia_total
from ct2
),
ct4 as (
select *, DENSE_RANK() over(partition by category order by ganancia_total desc) as ranking 
from ct3
)
select * from ct4
where ranking <=1

