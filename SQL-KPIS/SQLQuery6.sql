select year(fecha_venta) as año,MONTH(fecha_venta) as mes, sum(quantity*unit_price) as ventas
from dbo.fact_ventas
where quantity >=0
GROUP by year(fecha_venta), MONTH(fecha_venta)
order by year(fecha_venta),MONTH(fecha_venta)  desc
