Query #5
1. Show the total sales per territory 7 day from any given date.
2. Do not use a date range. Get the past 7 days from a given date
3. Paste your solution in Solution_Exam5.sql


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