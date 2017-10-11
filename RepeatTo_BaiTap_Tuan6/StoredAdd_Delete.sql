USE ONLINE_SHOP
GO

CREATE PROC usp_AddCustomer (
			@id nchar(10), 
			@pass varchar(50), 
			@name nvarchar(50), 
			@address nvarchar(50),
			@email varchar(50),
			@phone nchar(10), 
			@status nvarchar(50),
			@cumulation int)
AS
	INSERT INTO KHACHHANG VALUES(@id, @pass, @name, @address, @email, @phone, @status, @cumulation)
GO

EXEC usp_AddCustomer 'KH0000041', '456789', 'NULL',  'NULL', 'NULL', 'NULL', 'NULL', NULL

CREATE PROC usp_DeleteCustomer (@id nchar(10))
AS
	DELETE KHACHHANG WHERE MaKhachHang = @id
GO

EXEC usp_DeleteCustomer '0'