USE QLBanHang
Go

CREATE PROC usp_DeleteNhanVien ( @id int)
AS
	DELETE FROM Nhanvien WHERE MaNV = @id
GO

EXEC dbo.usp_DeleteNhanVien

CREATE PROC usp_SelectNhanVienID (@id int)
AS
	SELECT * FROM Nhanvien WHERE MaNV = @id
GO

CREATE PROC usp_SelectNhanVienHo (@firsName nvarchar(50))
AS
	SELECT * FROM Nhanvien WHERE HoNV LIKE @firsName + '%'
GO

CREATE PROC usp_SelectNhanVienTen (@lastName nvarchar(50))
AS
	SELECT * FROM Nhanvien WHERE Ten LIKE @lastName + '%'
GO

EXEC usp_SelectNhanVienID '2'
EXEC usp_SelectNhanVienHo 'T'
EXEC usp_SelectNhanVienTen 'Th'