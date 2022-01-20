Query #4
1. Show the list customers per territory who didnt place an order in any given 30-day range


------------------------
----- Final Answer -----
------------------------


begin
	select a.CustomerID,c.TerritoryID,c.Name,c.[Group],d.SalesOrderID from Sales.Customer a 
	--left join Person.Person b on a.PersonID = b.BusinessEntityID
	left join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID
	left join Sales.SalesOrderHeader d on a.CustomerID = d.CustomerID
	where d.CustomerID is null
	and datediff(dd,'2008-10-13 11:15:07.263',getdate()) >= 30
	order by TerritoryID, CustomerID
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




select datediff(dd,'2008-10-13 11:15:07.263',getdate())


2022-01-20 10:32:37.983

select getdate()

select d.*,a.*,b.*,c.* from Sales.Customer a left join Sales.SalesOrderHeader b on a.CustomerID = b.CustomerID
left join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID and b.TerritoryID = c.TerritoryID
left join Person.Person d on a.PersonID = d.BusinessEntityID
where b.CustomerID is null


select d.*,b.*,a.*,c.*  from Sales.SalesOrderHeader a 
inner join Sales.Customer b on a.CustomerID = b.CustomerID
inner join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID and b.TerritoryID = c.TerritoryID
inner join Person.Person d on b.PersonID = d.BusinessEntityID


select a.* from Sales.SalesTerritory a

where OnlineOrderFlag = 1 and datediff(dd,a.DueDate,a.OrderDate) >= 30


SELECT     Persons.LastName, Persons.FirstName
FROM       Persons
LEFT JOIN  Orders ON Persons.id = Orders.Person_id
WHERE      Orders.Person_id IS NULL;


select distinct d.PersonType from Sales.SalesOrderHeader a 
inner join Sales.Customer b on a.CustomerID = b.CustomerID
inner join Sales.SalesTerritory c on a.TerritoryID = c.TerritoryID and b.TerritoryID = c.TerritoryID
inner join Person.Person d on b.PersonID = d.BusinessEntityID


