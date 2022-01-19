--------

1. Show the top selling product in terms order quantity of sales per product category for each month

------------------------
----- Final Answer -----
------------------------

begin
	with cte_1 as (select ProductID, Name, ProductNumber, ProductSubcategoryID, SellStartDate, SellEndDate, datename(month,SellEndDate)+' '+datename(year,SellEndDate) as MonthlySales
	from Production.Product)

	select count(a.ProductID) as Product_Count_Sold, b.Name as Product_SubCategory_Name, c.Name as Product_Category_Name, a.MonthlySales from
	cte_1 a left join Production.ProductSubcategory b on a.ProductSubcategoryID = b.ProductSubcategoryID
	left join Production.ProductCategory c on c.ProductCategoryID = b.ProductCategoryID
	where a.MonthlySales is not null 
	group by b.Name,c.Name,a.MonthlySales
	order by MonthlySales,Product_Count_Sold
end
go

---------------------------
--------- TESTING ---------
---------------------------


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

