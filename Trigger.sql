USE ONLINE_SHOP
GO
------------------ TRIGGER-------------

/*
	34.Ngày đặt hàng không lớn hơn ngày hiện tại
*/

ALTER TRIGGER tr_NgayDatHangNhoHonNgayHienTai
ON PHIEUDATHANG FOR INSERT, UPDATE
AS
	IF(UPDATE(NgayDat))
		IF EXISTS (SELECT * FROM  PHIEUDATHANG d
			WHERE d.NgayDat > GETDATE())
		BEGIN
			PRINT N'Ngay đặt hàng không thể lớn hơn ngày hiện tại'
			rollback tran
		END
	IF EXISTS (SELECT * FROM inserted i
		WHERE i.NgayDat > GETDATE())
		BEGIN
			PRINT N'Ngay đặt hàng không thể lớn hơn ngày hiện tại'
			rollback tran
		END
GO


/*
35.Chỉ cho phép đặt hàng đối với mặt hàng còn trong kho.
*/

CREATE TRIGGER tr_DatHang
ON CHITIETPHIEUDAT FOR INSERT, UPDATE
AS
	IF EXISTS(SELECT * FROM inserted i, CHITIETPHIEUDAT c, SANPHAM s
		WHERE i.MaDatHang = c.MaDatHang
		AND c.MaSanPham = s.MaSanPham
		AND s.TinhTrang = N'Hết hàng')
	BEGIN
		PRINT N'Hàng bạn đặt đã hết hàng'
		rollback tran
	END

GO

/*
36.Số lượng đặt hàng phải nhỏ hơn số lượng hiện có
*/

CREATE TRIGGER tr_DatHang_SoLuongDat_Nho_SoLuongTon
ON CHITIETPHIEUDAT FOR INSERT, UPDATE
AS
	IF EXISTS(SELECT * FROM inserted i, CHITIETPHIEUDAT c, SANPHAM s
		WHERE i.MaDatHang = c.MaDatHang
		AND c.MaSanPham = s.MaSanPham
		AND s.SoLuongTon < i.SoLuong)
	BEGIN
		PRINT N'Hàng bạn đặt vượt quá số lượng tồn'
		rollback tran
	END

GO

/*
37.Ngày bắt đầu khuyến mãi không được sau ngày kết thúc.
*/

CREATE TRIGGER tr_KhuyenMai_NgayBD_Nho_NgayKT
ON KHUYENMAISP FOR INSERT, UPDATE
AS
	IF EXISTS(SELECT * FROM inserted i
		WHERE i.NgayBatDau > i.NgayKetThuc)
	BEGIN
		PRINT N'Ngay khuyến mãi không được lớn hơn ngày kết thúc'
		rollback tran
	END

GO