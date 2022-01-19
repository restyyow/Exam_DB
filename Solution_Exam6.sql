Query #6 - Data Paging
1. Create a select statement or stored prcedure that queries the products table 2 Display the results
of the query / stored procedure in a paginated manner.
2. Pagination should be x number of records / page
3. Paste your solution in Solution_Exam6.sql


------------------------
----- Final Answer -----
------------------------

-- x = @rowsofpage number of records to be output per page

use AdventureWorks2008R2
go

create procedure Production.uspProduct_Paging
@rowsofpage int
as
begin	
	declare @pagenumber int
	declare @maxtablepage numeric(30)
	set @pagenumber = 0
	select @maxtablepage = count(1) from Production.Product
	select @maxtablepage = CEILING(@maxtablepage/@rowsofpage)
		while @maxtablepage >= @pagenumber
			begin
				select * from Production.Product order by ProductID
				OFFSET (@pagenumber)*@rowsofpage ROWS
				FETCH NEXT @rowsofpage ROWS ONLY
			set @pagenumber = @pagenumber + 1
			end
end
go

exec Production.uspProduct_Paging 30
