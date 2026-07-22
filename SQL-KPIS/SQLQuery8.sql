select top 5 payment_method, count(*) as clientes
from dbo.fact_ventas
group by payment_method
order by clientes desc