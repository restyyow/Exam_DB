
Query #1
1. Show the top selling product in terms order quantity of sales per product category for each month



------------------------
----- Final Answer -----
------------------------

use AdventureWorks2008R2
go


begin
	with cte_1 as (select Product_SubName, ProductCategoryID, ProductSubcategoryID, Product_Category, OrderDate_Year, OrderDate_Month, MonthlySales, sum(OrderQty) OrderQty_Total from (
	select (b.Name) Product_SubName, b.ProductCategoryID, b.ProductSubcategoryID, (c.Name) Product_Category, year(e.OrderDate) OrderDate_Year, month(e.OrderDate) OrderDate_Month,
	datename(month,e.OrderDate)+' '+datename(year,e.OrderDate) as MonthlySales, d.OrderQty from Production.Product a 
	inner join Production.ProductSubcategory b on a.ProductSubcategoryID = b.ProductSubcategoryID
	inner join Production.ProductCategory c on b.ProductCategoryID = c.ProductCategoryID
	inner join Purchasing.PurchaseOrderDetail d on a.ProductID = d.ProductID
	inner join Purchasing.PurchaseOrderHeader e on d.PurchaseOrderID = e.PurchaseOrderID
	where e.Status = 4 ) bb
	group by Product_SubName, ProductCategoryID, ProductSubcategoryID, Product_Category, OrderDate_Year, OrderDate_Month, MonthlySales)

	select Product_Subname, ProductCategoryID, ProductSubcategoryID, Product_Category, MonthlySales, OrderQty_Total from (
	select *,ROW_NUMBER() OVER(PARTITION BY OrderDate_Year, OrderDate_Month order by OrderQty_Total desc) row_num
	from cte_1) aa where row_num = 1
end
go
















-----------------------------------
--------- SCRATCH TESTING ---------
-----------------------------------


use AdventureWorks2008R2
go
select * from Production.ProductSubcategory order by 1
go
select * from Production.ProductCategory order by 1
go
select * from Production.ProductDocument order by 1
go
select * from Production.ProductProductPhoto order by 1
go
select * from Production.Product order by 1
go
select * from Production.ProductListPriceHistory order by 1
go
select * from Production.ProductPhoto order by 1
go
select * from Production.ProductInventory order by 1
go
select * from Production.ProductModel order by 1
go
select * from Production.ProductDescription order by 1
go
select * from Production.ProductCostHistory order by 1
go
select * from Production.ProductReview order by 1
go
select * from Production.ProductModelProductDescriptionCulture order by 1
go
select * from Production.ProductModelIllustration order by 1
go 


-------------

select * from Production.Product where SellEndDate is not null order by 1
go
select * from Production.ProductSubcategory order by 1
go
select * from Production.ProductCategory order by 1
go

-------------

select a.ProductID, a.Name, b.Name as Product_SubCategory_Name, c.Name as Product_Category_Name, a.SellEndDate from
Production.Product a left join Production.ProductSubcategory b on a.ProductSubcategoryID = b.ProductSubcategoryID
left join Production.ProductCategory c on c.ProductCategoryID = b.ProductCategoryID
go


select a.ProductID, a.Name, b.Name as Product_SubCategory_Name, c.Name as Product_Category_Name, a.SellEndDate from
Production.Product a left join Production.ProductSubcategory b on a.ProductSubcategoryID = b.ProductSubcategoryID
left join Production.ProductCategory c on c.ProductCategoryID = b.ProductCategoryID
where a.SellEndDate is not null order by 1
go

