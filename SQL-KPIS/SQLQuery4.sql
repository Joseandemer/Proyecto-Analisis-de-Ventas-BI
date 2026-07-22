select round(sum(quantity * unit_price),2) as ganancias_total 
from dbo.fact_ventas
where quantity >=0