
3. Rank each territory according to total sales (unit price * quantity) for a given month


------------------------
----- Final Answer -----
------------------------

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

---------------------------
--------- TESTING ---------
---------------------------


select * from Sales.SalesTerritory
go
select * from Sales.SalesOrderHeader
go
select * from Sales.SalesOrderDetail
go

select * from


((select SalesOrderID,sum(UnitPrice * OrderQty)as UnitPrice_PerSID from Sales.SalesOrderDetail group by SalesOrderID)) bb


select c.TerritoryID, c.Name, c.[Group],b.* from Sales.SalesOrderHeader a 
left join (select SalesOrderID,sum(UnitPrice * OrderQty)as Total_Sales from Sales.SalesOrderDetail group by SalesOrderID) b on a.SalesOrderID = b.SalesOrderID
left join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID
order by TerritoryID
go



select TerritoryID, Monthly, sum(Total_Sales) Total_Sales, month_OrderDate, year_OrderDate from (
select *,datename(month,OrderDate)+' '+datename(year,OrderDate) as Monthly, month(OrderDate)month_OrderDate,year(OrderDate)year_OrderDate
from (select a.OrderDate, c.TerritoryID, c.Name, c.[Group], sum(b.Total_Sales)Total_Sales from Sales.SalesOrderHeader a 
left join (select SalesOrderID,sum(UnitPrice * OrderQty)as Total_Sales from Sales.SalesOrderDetail group by SalesOrderID) b on a.SalesOrderID = b.SalesOrderID
left join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID
group by a.OrderDate, c.TerritoryID, c.Name, c.[Group]) bb ) aa
group by TerritoryID, month_OrderDate, year_OrderDate, Monthly 
order by  year_OrderDate, month_OrderDate, Total_Sales desc 

select c.TerritoryID,sum(b.Total_Sales)Total_Sales from Sales.SalesOrderHeader a 
left join (select SalesOrderID,sum(UnitPrice * OrderQty)as Total_Sales from Sales.SalesOrderDetail group by SalesOrderID) b on a.SalesOrderID = b.SalesOrderID
left join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID
where c.TerritoryID = 1
group by c.TerritoryID
go
