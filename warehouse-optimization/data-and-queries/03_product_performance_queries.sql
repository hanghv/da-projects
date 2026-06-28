-- Question: Where are low-performance products stored?/Which warehouse house has most low-performance products?

drop view if exists product_profit_w;
-- find total sales and total profit of each product
create view product_profit_w as(
	select productName, productLine, warehouseName, quantityInStock, p.warehouseCode,
    ifnull(sum(quantityOrdered),0) as quantity_sold, 
    ifnull(sum((priceEach-buyPrice)*quantityOrdered),0) as profit 
    -- if a product is not sold at all, there will be no data in orderdetails
    -- this means quantityOrdered will be null
    from orderdetails od
     right join products p
    on od.productCode = p.productCode
    join warehouses w
    on p.warehouseCode = w.warehouseCode
    group by productName, productLine, warehouseName, quantityInStock, p.warehouseCode
    );
    
-- find all products' quantity sold and profit
with product_profit as(
	select productName,
    sum(quantityOrdered) as quantity_sold,
    sum((priceEach-buyPrice)*quantityOrdered) as profit
    from orderdetails od
    join products p
    on od.productCode = p.productCode
    group by productName, productLine
    ),
  
  -- from product_profit,
  -- calculate average sales per product,
  -- and average profit per unit sold
 avg_benchmark as( 
	select 
	round(avg(quantity_sold),0) as avg_product_sold,
	round((sum(profit)/sum(quantity_sold)),2) as avg_profit_per_unit
	from product_profit),
  
-- find product with sales and unit profit lower than average
low_performance_product as(
	select productName,
    productLine, 
    warehouseName,
    warehouseCode,
    quantityInStock,
    quantity_sold,
    profit, 
    round(ifnull((profit/quantity_sold),0),2) as unit_profit 
	from product_profit_w pw
    cross join avg_benchmark b 
    -- cái này chỉ có 1 dòng thôi nên sẽ add vào từng dòng của bảng còn lại
    where pw.quantity_sold < avg_product_sold  -- lấy dữ liệu ở CTE thứ 2
    and round(ifnull((profit/quantity_sold),0),2) < avg_profit_per_unit -- phải bọc ifnull 
    order by warehouseName, unit_profit),
  
-- find current status of each warehouse
warehouse_info as (
	select 
    warehouseCode,
    warehouseName,
    sum(quantityInstock) as stock_total_warehouse,
    count(productName) as total_product_warehouse
    from product_profit_w
    group by warehouseName, warehouseCode
    )

-- calculate low-performance product rate
-- and calculate low-performance stock rate
select
	lp.warehouseName,
    count(lp.productName) as low_performance_product,
    total_product_warehouse,
    (count(lp.productName)/total_product_warehouse) as lowperformance_product_rate,
  -- number of low_performance products / number of products in each warehouse
    sum(lp.quantityInStock) as low_performance_stock,
    stock_total_warehouse,
    ((sum(lp.quantityInStock)/stock_total_warehouse)*100) as lowperforamnce_stock_percent
  -- stock of low-performance stock / total stock of each warehouse
from 
	low_performance_product lp
join
	warehouse_info wi
on lp.warehouseCode = wi.warehouseCode
group by lp.warehouseName, total_product_warehouse, stock_total_warehouse
order by (sum(lp.quantityInStock)/stock_total_warehouse) desc;
    
