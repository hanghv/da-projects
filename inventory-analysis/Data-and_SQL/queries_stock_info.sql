use mintclassics;
drop view if exists product_instock;
create view product_instock as 
	select productCode,
    productName,
    productLine,
    quantityInStock,
    p.warehouseCode,
    buyPrice,
    MSRP,
    warehouseName,
    warehousePctCap
    from products p
    join warehouses w
    on p.warehouseCode=w.warehouseCode;

-- assume products'sizes are equal
-- check each warehouse's instock products, capacity, and available slots
select warehouseName, 
format(sum(quantityInStock),"en_US") as stock_total,
warehousePctCap,
format ((sum(quantityInStock)/warehousePctCap)*100,0, "en_US") as max_capacity,
format (((sum(quantityInStock)/warehousePctCap)*100 - sum(quantityInStock)),0, "en_US")as available_storage
from product_instock
group by warehouseName, warehousePctCap 
order by sum(quantityInStock) desc; -- sort result from highest to lowest total instock



