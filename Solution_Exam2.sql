
2. Show the top performing person per territory per month in terms of total sales (unit price *
quantity)


------------------------
----- Final Answer -----
------------------------

use AdventureWorks2008R2
go

begin
	with cte_1 as (
    select distinct a.BusinessEntityID, a.JobTitle, 
    b.FirstName, b.LastName, c.TerritoryID, d.Name, d.CountryRegionCode, d.[Group],
    e.SalesPersonID, e.OrderDate, sum(UnitPrice_PerSID) Total_Sales
    from HumanResources.Employee a inner join Person.Person b on a.BusinessEntityID = b.BusinessEntityID
    inner join Sales.SalesPerson c on b.BusinessEntityID = c.BusinessEntityID
    inner join Sales.SalesTerritory d on d.TerritoryID = c.TerritoryID
    inner join Sales.SalesOrderHeader e on a.BusinessEntityID = e.SalesPersonID
    inner join (select SalesOrderID,UnitPrice * OrderQty as UnitPrice_PerSID from Sales.SalesOrderDetail) f on f.SalesOrderID = e.SalesOrderID
    group by a.BusinessEntityID, a.JobTitle, 
    b.FirstName, b.LastName, c.TerritoryID, d.Name, d.CountryRegionCode, d.[Group],
    e.SalesPersonID, e.OrderDate
    )

    select * from (select BusinessEntityID, JobTitle, 
    FirstName, LastName, TerritoryID, Name, CountryRegionCode, [Group],
    SalesPersonID, OrderDate,Total_Sales,datename(month,OrderDate)+' '+datename(year,OrderDate) as MonthlySales, 
    ROW_NUMBER() OVER(Partition by OrderDate order by Total_Sales desc) row_num
    from cte_1 ) bb where row_num = 1
end
go



















-----------------------------------
--------- SCRATCH TESTING ---------
-----------------------------------

use AdventureWorks2008R2
go

select * from Sales.SalesTaxRate
go
select * from Sales.ShoppingCartItem
go
select * from Sales.CreditCard
go
select * from Sales.PersonCreditCard
go
select * from Sales.SalesOrderHeader -- main
go
select * from Sales.CurrencyRate
go
select * from Sales.Currency
go
select * from Sales.SalesReason
go
select * from Sales.SalesOrderHeaderSalesReason
go
select * from Sales.SalesPerson
go
select * from Sales.SalesTerritory
go
select * from Sales.Customer
go
select * from Sales.SalesTerritoryHistory
go
select * from Sales.SalesPersonQuotaHistory
go
select * from Sales.SalesOrderDetail
go
select * from Sales.SpecialOfferProduct
go
select * from Sales.SpecialOffer
go

-----------

select * from HumanResources.Employee
go
select * from Person.Person
go
select * from Sales.SalesOrderHeader
go
select * from Sales.SalesPerson
go
select * from Sales.SalesTerritory
go
select * from Sales.SalesTerritoryHistory
go
select * from Sales.SalesOrderDetail
go

--------

select distinct Status from Sales.SalesOrderHeader
go

select SalesOrderID,(OrderQty)OrderQty,sum(UnitPrice) from Sales.SalesOrderDetail 
where SalesOrderID = 43659
group by SalesOrderID,OrderQty

select SalesOrderID,sum(OrderQty)OrderQty,sum(UnitPrice)UnitPrice 
from Sales.SalesOrderDetail 
where SalesOrderID = 43659
group by SalesOrderID

26

14323.7118

select SalesOrderID,ProductID,OrderQty,UnitPrice from Sales.SalesOrderDetail 
where SalesOrderID = 43659
order by 2



select distinct a.BusinessEntityID, a.JobTitle, a.Birthdate, a.MaritalStatus, a.Gender, a.HireDate, a.NationalIDNumber, b.BusinessEntityID, b.PersonType,
b.FirstName, b.MiddleName, b.LastName, c.BusinessEntityID, c.TerritoryID, d.TerritoryID, d.Name, d.CountryRegionCode, d.[Group],
e.SalesPersonID, e.OrderDate, e.OnlineOrderFlag, sum(UnitPrice_PerSID) Total_Sales
from HumanResources.Employee a inner join Person.Person b on a.BusinessEntityID = b.BusinessEntityID
inner join Sales.SalesPerson c on b.BusinessEntityID = c.BusinessEntityID
inner join Sales.SalesTerritory d on d.TerritoryID = c.TerritoryID
inner join Sales.SalesOrderHeader e on a.BusinessEntityID = e.SalesPersonID
inner join (select SalesOrderID,UnitPrice * OrderQty as UnitPrice_PerSID from Sales.SalesOrderDetail) f on f.SalesOrderID = e.SalesOrderID
where a.BusinessEntityID = 275 and e.OrderDate = '2005-07-01 00:00:00.000'
group by a.BusinessEntityID, a.JobTitle, a.Birthdate, a.MaritalStatus, a.Gender, a.HireDate, a.NationalIDNumber, b.BusinessEntityID, b.PersonType,
b.FirstName, b.MiddleName, b.LastName, c.BusinessEntityID, c.TerritoryID, d.TerritoryID, d.Name, d.CountryRegionCode, d.[Group],
e.SalesPersonID, e.OrderDate, e.OnlineOrderFlag
go


select * from 
select SalesOrderID,UnitPrice * OrderQty from Sales.SalesOrderDetail

--------

select distinct b.FirstName, b.MiddleName, b.LastName, a.JobTitle, d.Name, d.[Group],
e.SalesPersonID, e.SalesOrderID, e.OrderDate, e.OnlineOrderFlag, f.OrderQty, f.UnitPrice
from HumanResources.Employee a inner join Person.Person b on a.BusinessEntityID = b.BusinessEntityID
inner join Sales.SalesPerson c on b.BusinessEntityID = c.BusinessEntityID
inner join Sales.SalesTerritory d on d.TerritoryID = c.TerritoryID
inner join Sales.SalesOrderHeader e on a.BusinessEntityID = e.SalesPersonID
inner join (select SalesOrderID,sum(OrderQty)OrderQty,sum(UnitPrice)UnitPrice from Sales.SalesOrderDetail group by SalesOrderID) f on f.SalesOrderID = e.SalesOrderID
order by LastName,FirstName
go

---------

select distinct a.BusinessEntityID, a.JobTitle, 
b.FirstName, b.LastName, c.TerritoryID, d.Name, d.CountryRegionCode, d.[Group],
e.SalesPersonID, e.OrderDate, sum(UnitPrice_PerSID) Total_Sales, datename(month,e.OrderDate)+' '+datename(year,e.OrderDate) as MonthlySales
from HumanResources.Employee a inner join Person.Person b on a.BusinessEntityID = b.BusinessEntityID
inner join Sales.SalesPerson c on b.BusinessEntityID = c.BusinessEntityID
inner join Sales.SalesTerritory d on d.TerritoryID = c.TerritoryID
inner join Sales.SalesOrderHeader e on a.BusinessEntityID = e.SalesPersonID
inner join (select SalesOrderID,UnitPrice * OrderQty as UnitPrice_PerSID from Sales.SalesOrderDetail) f on f.SalesOrderID = e.SalesOrderID
group by a.BusinessEntityID, a.JobTitle, 
b.FirstName, b.LastName, c.TerritoryID, d.Name, d.CountryRegionCode, d.[Group],
e.SalesPersonID, e.OrderDate
order by e.OrderDate
go

