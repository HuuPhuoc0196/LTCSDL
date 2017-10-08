USE ONLINE_SHOP
GO
/*
	Viết stored-procedure tính tổng 2 số a, b và in kết quả theo định dạng sau:
	‘Tổng 2 số’ + @a + ‘và’ + @b ‘là:’ + @kq
*/

CREATE PROC usp_Sum @a int , @b int, @kq int out
AS
	SET @kq = @a + @b
GO

DECLARE @a int = 5, @b int = 10, @kq int = 0;
EXEC usp_Sum @a, @b, @kq out
PRINT N'Tổng 2 số ' + CAST(@a AS nvarchar) + N' và ' + CAST(@b AS nvarchar) + N' là: ' + CAST(@kq AS nvarchar)

/*
	12.Viết thủ tục Stored Procedure (SP) tính số lượng và tổng các số chẳn từ m đến n.
	usp_TongChanMN
	Input: @m, @n
	Output: @TongChan
*/

CREATE PROC usp_TongChanMN @m int, @n int, @TongChan int out
AS
	DECLARE @soLuong int = 0;
	IF(@m < @n)
	BEGIN
		WHILE(@m <= @n)
		BEGIN
			IF(@m %2 =0)
			BEGIN
				SET @soluong += 1;
				SET @TongChan += @m;
			END
			SET @m +=1;
		END
	END
	RETURN @soluong
GO

DECLARE @m int = 1, @n int = 5, @tongChan int = 0, @soLuong int;
EXEC @soLuong = usp_TongChanMN @m, @n, @tongChan out
PRINT N'số lượng và tổng các số chẳn từ ' + CAST(@m AS nvarchar) + N' đến ' + CAST(@n AS nvarchar) + N' là: ' + CAST(@soLuong AS nvarchar) + ' - ' + CAST(@tongChan AS nvarchar)

/*
	Viết stored-procedure truyền vào 2 số nguyên, tìm ước chung lớn nhất của 2 số
	nguyên trên.
*/

CREATE PROC usp_UCLN @a int, @b int
AS
	WHILE (@a != @b)
	BEGIN	
		IF(@a > @b)
			SET @a = @a - @b;
		ELSE
			SET @b = @b - @a;
	END
	RETURN @a
GO

DECLARE @a int = 40, @b int = 30, @ucln int;
EXEC @ucln = usp_UCLN @a, @b
PRINT N'ước chung lớn nhất của 2 số nguyên trên là: ' + CAST(@ucln AS nvarchar);


/*
	Viết stored-procedure xuất danh sách các sản phẩm chưa cung cấp mô tả.
*/
USE ONLINE_SHOP
GO

CREATE PROC usp_ThongTinSPNULL
AS
	SELECT * FROM SANPHAM WHERE MoTa IS NULL
GO

EXEC usp_ThongTinSPNULL

/*
	Viết stored- procedure xuất danh sách các danh mục có tình trạng là hủy
*/

CREATE PROC usp_DanhMucHuy
AS
	SELECT * FROM DANHMUC WHERE TinhTrang = N'bị hủy'
GO

EXEC usp_DanhMucHuy

/*
	Viết stored- procedure xuất danh sách khách hàng có đơn đặt hàng chưa giao với
	số lượng sản phẩm mua > 1.
*/

CREATE PROC usp_DSKhachHangGiaoDich
AS
	SELECT * FROM KHACHHANG, PHIEUDATHANG,CHITIETPHIEUDAT 
	WHERE KHACHHANG.MaKhachHang = PHIEUDATHANG.MaKhachHang
			AND PHIEUDATHANG.MaDatHang = CHITIETPHIEUDAT.MaDatHang
			AND SoLuong > 1
GO

EXEC usp_DSKhachHangGiaoDich

/*
	Viết stored-procedure truyền vào mã sản phẩm, xuất ra thông tin sản phẩm.
*/

CREATE PROC usp_ThongTinSanPham @maSP nchar(10)
AS
	SELECT * FROM SANPHAM WHERE MaSanPham = @maSP
GO

EXEC usp_ThongTinSanPham 'SP00000004'


/*
	Viết stored-procedure truyền vào tình trạng, xuất ra thông tin các danh mục thuộc
	tình trạng đó.
*/

CREATE PROC usp_ThongTinDanhMuc @TinhTrang nvarchar(50)
AS
	SELECT * FROM DANHMUC WHERE TinhTrang = @TinhTrang
GO

EXEC usp_ThongTinDanhMuc N'đang dùng'

/*
	Viết stored-procedure truyền vào ngày bắt đầu, ngày kết thúc, xuất danh sách sản
	phẩm khuyến mãi trong khoảng thời gian trên.(Nếu không nhập ngày bắt đầu thì
	lấy ngày đầu tiên của tháng hiện hành, nếu ngày kết thúc không nhập thì lấy ngày
	hiện hành).
*/

-- TO DO--

/*
	Viết stored-procedure kiểm tra thông tin đăng nhập
	Input: tên đăng nhập, mật khẩu
	output: 1: Đăng nhập thành công
	2: Sai tên đăng nhập
	3: Sai mật khẩu
	-1: Lỗi hệ thống
*/

CREATE PROC usp_DangNhap @user nchar(10), @pass nvarchar(50)
AS
	IF((SELECT MaKhachHang FROM KHACHHANG WHERE MaKhachHang = @user AND MatKhau = @pass AND TinhTrang = N'đang dùng') IS NULL)
		PRINT N'Tài khoản hoặc mật khẩu không hợp lệ!'
	ELSE
		BEGIN
			PRINT N'Đăng nhập thành công'
		END
GO

EXEC usp_DangNhap 'KH00000002', '123'
EXEC usp_DangNhap 'KH00000002', '1235'

/*
	Viết stored-procedure thêm một sản phẩm mới
	Input: thông tin sản phẩm
	Output: 1: Thêm sản phẩm thành công
			2: Mã sản phẩm đã tồn tại
		   -1: Lỗi hệ thống
*/

ALTER PROC usp_AddProducts @MaSP nchar(10), @tenSP nvarchar(50), @MoTa nvarchar(MAX), @DonGia real, @SoLuongTon int, @SoLuongToiThieu int, @NgayDang datetime, @TinhTrang nvarchar(50), @MaDanhMuc nvarchar(10)
AS
	DECLARE @KiemTra nchar(10);
	SELECT @KiemTra = MaSanPham FROM SANPHAM WHERE MaSanPham = @MaSP
	IF(@KiemTra IS NOT NULL)
		PRINT N'Mã sản phẩm đã tồn tại'
	ELSE 
	BEGIN
		BEGIN TRY
			INSERT INTO SANPHAM VALUES(@MaSP, @tenSP, @MoTa, @DonGia, @SoLuongTon, @SoLuongToiThieu, @NgayDang, @TinhTrang, @MaDanhMuc)
			PRINT N'Thêm Thành Công'
		END TRY
		BEGIN CATCH
			PRINT N'Lỗi hệ thống'
		END CATCH
	END
GO

EXEC usp_AddProducts 'SP00000011', N'Tiệc Buffet tối Cơm Nắm Việt 23', N'Thưởng thức tiệc Buffet Cơm Nắm Việt được thay đổi hằng ngày như: Tôm nướng, mực nướng, cá kèo nướng, sò huyết xào tỏi, cua đồng rang me, các loại Salad trộn, xúc xích nướng, bánh tôm hồ tây... cùng các loại bánh đặc trưng vùng miền và kem tươi...', 259000, 2000, 300, '2009-01-01 00:00:00.000', N'Khuyến mãi', 'DM00004'
EXEC usp_AddProducts 'SP00000012', N'Tiệc Buffet tối Cơm Nắm Việt 23', N'Thưởng thức tiệc Buffet Cơm Nắm Việt được thay đổi hằng ngày như: Tôm nướng, mực nướng, cá kèo nướng, sò huyết xào tỏi, cua đồng rang me, các loại Salad trộn, xúc xích nướng, bánh tôm hồ tây... cùng các loại bánh đặc trưng vùng miền và kem tươi...', 259000, 2000, 300, '2009-01-01 00:00:00.000', N'Khuyến mãi', 'DM00004'
EXEC usp_AddProducts 'SP000000112', N'Tiệc Buffet tối Cơm Nắm Việt 23', N'Thưởng thức tiệc Buffet Cơm Nắm Việt được thay đổi hằng ngày như: Tôm nướng, mực nướng, cá kèo nướng, sò huyết xào tỏi, cua đồng rang me, các loại Salad trộn, xúc xích nướng, bánh tôm hồ tây... cùng các loại bánh đặc trưng vùng miền và kem tươi...', 2000, 300, '2009-01-01 00:00:00.000', N'Khuyến mãi', 'DM00004'
