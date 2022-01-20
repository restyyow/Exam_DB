Query #5
1. Show the total sales per territory 7 day from any given date.
2. Do not use a date range. Get the past 7 days from a given date
3. Paste your solution in Solution_Exam5.sql


------------------------
----- Final Answer -----
------------------------

begin
	select TerritoryID,Name,[Group],sum(Total_Sales)Total_Sales
	from (select a.OrderDate, c.TerritoryID, c.Name, c.[Group], sum(b.Total_Sales)Total_Sales from Sales.SalesOrderHeader a 
	left join (select SalesOrderID,sum(UnitPrice * OrderQty)as Total_Sales from Sales.SalesOrderDetail group by SalesOrderID) b on a.SalesOrderID = b.SalesOrderID
	left join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID
	group by a.OrderDate, c.TerritoryID, c.Name, c.[Group]) bb 
	where datediff(dd,OrderDate,getdate()) >= 7
	group by TerritoryID,Name,[Group]
	order by TerritoryID
end
go



















-----------------------------------
--------- SCRATCH TESTING ---------
-----------------------------------

use AdventureWorks2008R2
go

begin
	with cte_1 as (
	select TerritoryID, Monthly, sum(Total_Sales) Total_Sales, month_OrderDate, year_OrderDate from (
	select *,datename(month,OrderDate)+' '+datename(year,OrderDate) as Monthly, month(OrderDate)month_OrderDate,year(OrderDate)year_OrderDate
	from (select a.OrderDate, c.TerritoryID, c.Name, c.[Group], sum(b.Total_Sales)Total_Sales from Sales.SalesOrderHeader a 
	left join (select SalesOrderID,sum(UnitPrice * OrderQty)as Total_Sales from Sales.SalesOrderDetail group by SalesOrderID) b on a.SalesOrderID = b.SalesOrderID
	left join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID
	group by a.OrderDate, c.TerritoryID, c.Name, c.[Group]) bb ) aa
	group by TerritoryID, month_OrderDate, year_OrderDate, Monthly 
)

    select TerritoryID,Monthly,Total_Sales,DENSE_RANK() OVER(PARTITION BY month_OrderDate, year_OrderDate order by Total_Sales desc) Ranking from cte_1
    order by  year_OrderDate, month_OrderDate, Total_Sales desc 
end
go


	with cte_1 as (
	select TerritoryID, Monthly, sum(Total_Sales) Total_Sales, month_OrderDate, year_OrderDate from (
	select *,datename(month,OrderDate)+' '+datename(year,OrderDate) as Monthly, month(OrderDate)month_OrderDate,year(OrderDate)year_OrderDate
	from (select a.OrderDate, c.TerritoryID, c.Name, c.[Group], sum(b.Total_Sales)Total_Sales from Sales.SalesOrderHeader a 
	left join (select SalesOrderID,sum(UnitPrice * OrderQty)as Total_Sales from Sales.SalesOrderDetail group by SalesOrderID) b on a.SalesOrderID = b.SalesOrderID
	left join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID
	group by a.OrderDate, c.TerritoryID, c.Name, c.[Group]) bb ) aa
	group by TerritoryID, month_OrderDate, year_OrderDate, Monthly 
)

    select TerritoryID,Monthly,Total_Sales,DENSE_RANK() OVER(PARTITION BY month_OrderDate, year_OrderDate order by Total_Sales desc) Ranking from cte_1
    order by  year_OrderDate, month_OrderDate, Total_Sales desc 


begin
	select TerritoryID,Name,[Group],sum(Total_Sales)Total_Sales
	from (select a.OrderDate, c.TerritoryID, c.Name, c.[Group], sum(b.Total_Sales)Total_Sales from Sales.SalesOrderHeader a 
	left join (select SalesOrderID,sum(UnitPrice * OrderQty)as Total_Sales from Sales.SalesOrderDetail group by SalesOrderID) b on a.SalesOrderID = b.SalesOrderID
	left join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID
	group by a.OrderDate, c.TerritoryID, c.Name, c.[Group]) bb 
	where datediff(dd,OrderDate,getdate()) >= 7
	group by TerritoryID,Name,[Group]
	order by TerritoryID
end
go




use AdventureWorks2008R2
go

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



