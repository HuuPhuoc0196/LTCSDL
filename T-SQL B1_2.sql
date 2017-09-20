USE ONLINE_SHOP
GO

/*
 * Câu 1 
 */
IF OBJECT_ID('uspCau1', 'P') IS NOT NULL
	DROP PROC uspCau1
GO

CREATE PROC uspCau1
	@a float, -- default => thuc
	@b float,
	@tong float OUT --OUTPUT
AS
	--return (@a + @b)
	SET @tong = @a + @b
GO

-- Goi
DECLARE @x float = 3.2, @y float = 5.3, @tong float = 0
EXEC  uspCau1 @x, @y, @tong OUT
PRINT CAST(@x AS varchar(10)) + ' + ' +
	CAST(@y AS varchar(10)) + ' = ' +
	CAST(@tong AS varchar(10)) 
	
/*
 * Câu 2
 */
CREATE PROC usp --Cau2
AS

GO