USE ONLINE_SHOP
GO

/*
14. Viết stored-procedure xuất danh sách các sản phẩm chưa cung cấp mô tả.
*/
IF OBJECT_ID('DanhSachSPChuaCCMT', 'p') IS NOT NULL
	DROP PROC DanhSachSPChuaCCMT
GO

CREATE PROC DanhSachSPChuaCCMT
AS
	SELECT * FROM SANPHAM WHERE MoTa IS NULL
GO

exec DanhSachSPChuaCCMT
GO
SELECT * FROM SANPHAM
/*
15. Viết stored- procedure xuất danh sách các danh mục chưa có sản phẩm nào.
*/
IF OBJECT_ID('DanhSachDMChuaSP', 'P') IS NOT NULL
	DROP PROC DanhSachDMChuaSP
GO

CREATE PROC DanhSachDMChuaSP
AS
	SELECT * FROM DANHMUC WHERE SoSanPhamDangBan = 0
GO

exec DanhSachDMChuaSP
GO
SELECT * FROM DANHMUC
/*
16. Viết stored- procedure xuất danh sách khách hàng có đơn đặt hàng chưa giao với
số lượng sản phẩm mua > 1.
o Thủ tục có tham số vào
*/
IF OBJECT_ID('DSKH', 'P') IS NOT NULL
	DROP PROC DSKH
GO
CREATE PROC DSKH(@soluong int)
AS
	SELECT * FROM KHACHHANG 
	WHERE MaKhachHang IN (
		SELECT MaKhachHang FROM PHIEUDATHANG
		WHERE TinhTrang = N'Đang chờ giao'
		AND MaDatHang IN(
			SELECT MaDatHang FROM CHITIETPHIEUDAT
			WHERE SoLuong > @soluong
		)
	)
GO

exec DSKH '0'
GO

SELECT K.*, CT.SoLuong FROM KHACHHANG AS K,PHIEUDATHANG AS P, CHITIETPHIEUDAT AS CT
WHERE K.MaKhachHang = P.MaKhachHang
AND P.MaDatHang = CT.MaDatHang
/*
17. Viết stored-procedure truyền vào mã sản phẩm, xuất ra thông tin sản phẩm.
*/
IF OBJECT_ID('TTSP', 'P') IS NOT NULL
	DROP PROC TTSP
GO

CREATE PROC TTSP(@maSP nchar(10))
AS
	IF EXISTS(SELECT * FROM SANPHAM WHERE MaSanPham = @maSP)
		SELECT * FROM SANPHAM WHERE MaSanPham = @maSP
	ELSE
		PRINT N'Mã truyền vào không tồn tại'
GO

exec TTSP 'SP00000001'
exec TTSP 'SP0000001'
exec TTSP null
SELECT * FROM SANPHAM

/*
Viết stored-procedure truyền vào tình trạng, xuất ra thông tin các danh mục thuộc
tình trạng đó.
*/


IF OBJECT_ID('TTTT', 'P') IS NOT NULL
	DROP PROC TTTT
GO

CREATE PROC TTTT(@tinhTrang nchar(50))
AS
	IF EXISTS(SELECT * FROM PHIEUDATHANG WHERE TinhTrang = @tinhTrang)
		SELECT * FROM PHIEUDATHANG WHERE TinhTrang = @tinhTrang
	ELSE
		PRINT N'Tình trạng truyền vào không tồn tại'
GO

exec TTTT 'SP00000001'
exec TTTT N'đang chờ giao'
exec TTTT null
SELECT * FROM PHIEUDATHANG

/*
	Viết stored-procedure truyền vào ngày bắt đầu, ngày kết thúc, xuất danh sách sản
phẩm khuyến mãi trong khoảng thời gian trên.(Nếu không nhập ngày bắt đầu thì
lấy ngày đầu tiên của tháng hiện hành, nếu ngày kết thúc không nhập thì lấy ngày
hiện hành).
*/

IF OBJECT_ID('DSKM', 'P') IS NOT NULL
	DROP PROC DSKM
GO

CREATE PROC DSKM(@ngayBD datetime, @ngayKT datetime)
AS
	SELECT * FROM KHUYENMAISP WHERE NgayBatDau <= @ngayBD
	AND NgayKetThuc = @ngayKT
GO
SELECT * FROM KHUYENMAISP

/*
	20.Viết stored-procedure kiểm tra thông tin đăng nhập
	Input: tên đăng nhập, mật khẩu
	Output: 1: Đăng nhập thành công
	2: Sai tên đăng nhập
	3: Sai mật khẩu
	-1: Lỗi hệ thống
*/

CREATE PROC usp_Login(@MaKhachHang nchar(10), @MatKhau varchar(50))
AS
	IF NOT EXISTS(SELECT MaKhachHang FROM KHACHHANG WHERE MaKhachHang = @MaKhachHang)
		PRINT N'Sai tên đăng nhập'
	ELSE IF NOT EXISTS(SELECT MaKhachHang FROM KHACHHANG WHERE MaKhachHang = @MaKhachHang AND MatKhau = @MatKhau)
		PRINT N'Sai mật khẩu'
	ELSE
		PRINT N'Đăng nhập thành công'
	IF(@@ERROR <> 1)
		RETURN(-1)
GO

EXEC usp_Login 'KH00000001', 123

/*
21. Viết stored-procedure thêm một sản phẩm mới
Input: thông tin sản phẩm
Output: 1: Thêm sản phẩm thành công
2: Mã sản phẩm đã tồn tại
-1: Lỗi hệ thống
*/

IF OBJECT_ID('TTTT', 'P') IS NOT NULL
	DROP PROC TTTT
GO

CREATE PROC InsertSP(@MaSanPham nchar(10), 
					@TenSanPham nvarchar(50),
					@MoTa nvarchar(max),
					@DonGia real ,
					@SoLuongTon int,
					@SoLuongToiThieu int,
					@NgayDang datetime,
					@TinhTrang nvarchar(50),
					@MaDanhMuc nchar(10))
AS
	IF(@MaSanPham = '' OR @MaSanPham IS NULL)
		PRINT N'Không thêm Sản Phẩm được vì mã SP trống'
	ELSE IF(@MaDanhMuc = '' OR @MaDanhMuc IS NULL)
		PRINT N'Không thêm Sản Phẩm được vì mã DM trống'
	ELSE IF EXISTS(SELECT * FROM SANPHAM WHERE MaSanPham = @MaSanPham)
		PRINT N'Không thêm Sản Phẩm được vì mã đã tồn tại'
	ELSE
	BEGIN
		INSERT INTO SANPHAM VALUES(@MaSanPham,@TenSanPham,@MoTa,@DonGia,@SoLuongTon,@SoLuongToiThieu
					,@NgayDang,@TinhTrang,@MaDanhMuc)
		PRINT N'Thêm thành công'
	END
GO

exec InsertSP 
exec InsertSP 
exec InsertSP 
SELECT * FROM SANPHAM

/*
22. Viết stored-procedure lấy thông tin đơn giá của sản phẩm
Input: mã sản phẩm
Output: 1: Lấy thông tin thành công. Trả về đơn giá sản phẩm
2: Sản phẩm không tồn tại
-1: Lỗi hệ thống
*/


IF OBJECT_ID('TTDonGiaSP', 'P') IS NOT NULL
	DROP PROC TTDonGiaSP
GO

CREATE PROC TTDonGiaSP(@MaSanPham nchar(10))
AS
	IF EXISTS(SELECT DonGia FROM SANPHAM WHERE MaSanPham = @MaSanPham)
		SELECT DonGia FROM SANPHAM WHERE MaSanPham = @MaSanPham
	ELSE
		PRINT N'Sản phẩm không tồn tại'
GO

exec TTDonGiaSP 'SP00000001'
exec TTDonGiaSP ''
SELECT * FROM SANPHAM

/*
	23. Viết stored-procedure xóa thông tin sản phẩm
Input: mã sản phẩm
Output: 1: Xóa sản phẩm thành công
2: Sản phẩm không tồn tại
3: Sản phẩm đang bị tham chiếu
-1: Lỗi hệ thống
*/


IF OBJECT_ID('DeleteSP', 'P') IS NOT NULL
	DROP PROC DeleteSP
GO

CREATE PROC DeleteSP(@MaSanPham nchar(10))
AS
	IF(@MaSanPham = '' OR @MaSanPham IS NULL)
		PRINT N'Mã sản phẩm rỗng!'
	ELSE IF NOT EXISTS (SELECT * FROM SANPHAM WHERE MaSanPham = @MaSanPham)
		PRINT N'Sản phẩm không tồn tại'
	ELSE
	BEGIN
		DELETE SANPHAM WHERE MaSanPham = @MaSanPham	
		PRINT N'Xóa thánh công'
	END
	IF(@@ERROR <> 1)
		RETURN(-1)
GO

exec DeleteSP 'SP00000001'
exec DeleteSP 'SP000001'
SELECT * FROM SANPHAM


----------------------------------------------------------------------------------------------------------

/*
	Tuần 3
*/

/*
	30. Viết hàm truyền vào mã sản phẩm xuất đơn giá của sản phẩm đó.
*/

IF OBJECT_ID('DGSP') IS NOT NULL
	DROP FUNCTION DGSP
GO

CREATE FUNCTION DGSP(@MaSP nchar(10))
RETURNS int
AS
	BEGIN
		DECLARE @dongia int
		SELECT @dongia = DonGia FROM SANPHAM WHERE MaSanPham = @MaSP
		RETURN @dongia
	END
GO

PRINT dbo.DGSP ('SP00000004')

SELECT * FROM SANPHAM

/*
	31. Viết hàm truyền vào mã khách hàng, xuất thông tin phiếu đặt hàng, số lượng chi
tiết phiếu đặt, tổng giá trị của từng phiếu đặt của khách hàng đó.
*/


IF OBJECT_ID('TTDatHang') IS NOT NULL
	DROP FUNCTION TTDatHang
GO

CREATE FUNCTION TTDatHang(@maKH nchar(10))
RETURNS @datHang TABLE(MaDatHang nchar(10), NgayDatHang datetime, SoCTPD int, TongGiaTriPD int)
AS
BEGIN
	INSERT INTO @datHang
		SELECT pd.MaDatHang, pd.NgayDat, COUNT(ct.MaChiTietPD), SUM(ct.SoLuong * ct.DonGia)
		FROM KHACHHANG AS kh, PHIEUDATHANG AS pd, CHITIETPHIEUDAT AS ct
		WHERE kh.MaKhachHang = pd.MaKhachHang
		AND pd.MaDatHang = ct.MaDatHang
		AND kh.MaKhachHang = @maKH
		GROUP BY pd.MaDatHang, pd.NgayDat
	RETURN
END
GO

SELECT * FROM dbo.TTDatHang('KH00000001')
GO


----------------------------------------------------------------------------------------------------------------------------
-- Triger

/*
34.Ngày đặt hàng không lớn hơn ngày hiện tại
*/