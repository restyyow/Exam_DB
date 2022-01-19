Query #4
1. Show the list customers per territory who didnt place an order in any given 30-day range


------------------------
----- Final Answer -----
------------------------































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
select * from Sales.SalesOrderHeader 
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
select * from Sales.Customer
go
select * from Sales.Store
go
select * from Person.Person
go
select * from Purchasing.PurchaseOrderHeader
go





4. Show the list customers per territory who didnt place an order in any given 30-day range


select d.*,b.*,a.*,c.*  from Sales.SalesOrderHeader a 
inner join Sales.Customer b on a.CustomerID = b.CustomerID
inner join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID and b.TerritoryID = c.TerritoryID
inner join Person.Person d on b.PersonID = d.BusinessEntityID

where OnlineOrderFlag = 1 and datediff(dd,a.DueDate,a.OrderDate) >= 30



select distinct d.PersonType from Sales.SalesOrderHeader a 
inner join Sales.Customer b on a.CustomerID = b.CustomerID
inner join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID and b.TerritoryID = c.TerritoryID
inner join Person.Person d on b.PersonID = d.BusinessEntityID


