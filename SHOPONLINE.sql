IF DB_ID('ONLINE_SHOP') IS NULL 
	CREATE DATABASE ONLINE_SHOP
GO
USE [ONLINE_SHOP]
GO
/****** Object:  ForeignKey [FK_BINHLUAN_KHACHHANG]    Script Date: 02/27/2012 09:10:45 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BINHLUAN_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[BINHLUAN]'))
ALTER TABLE [dbo].[BINHLUAN] DROP CONSTRAINT [FK_BINHLUAN_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_BINHLUAN_SANPHAM]    Script Date: 02/27/2012 09:10:45 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BINHLUAN_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[BINHLUAN]'))
ALTER TABLE [dbo].[BINHLUAN] DROP CONSTRAINT [FK_BINHLUAN_SANPHAM]
GO
/****** Object:  ForeignKey [FK_CHITIETPHIEUDAT_PHIEUDATHANG]    Script Date: 02/27/2012 09:10:45 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CHITIETPHIEUDAT_PHIEUDATHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]'))
ALTER TABLE [dbo].[CHITIETPHIEUDAT] DROP CONSTRAINT [FK_CHITIETPHIEUDAT_PHIEUDATHANG]
GO
/****** Object:  ForeignKey [FK_CHITIETPHIEUDAT_SANPHAM]    Script Date: 02/27/2012 09:10:45 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CHITIETPHIEUDAT_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]'))
ALTER TABLE [dbo].[CHITIETPHIEUDAT] DROP CONSTRAINT [FK_CHITIETPHIEUDAT_SANPHAM]
GO
/****** Object:  ForeignKey [FK_KHUYENMAISP_SANPHAM]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KHUYENMAISP_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[KHUYENMAISP]'))
ALTER TABLE [dbo].[KHUYENMAISP] DROP CONSTRAINT [FK_KHUYENMAISP_SANPHAM]
GO
/****** Object:  ForeignKey [FK_LICHSUTHAOTAC_KHACHHANG]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC] DROP CONSTRAINT [FK_LICHSUTHAOTAC_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_LICHSUTHAOTAC_LOAITHAOTAC]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_LOAITHAOTAC]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC] DROP CONSTRAINT [FK_LICHSUTHAOTAC_LOAITHAOTAC]
GO
/****** Object:  ForeignKey [FK_LICHSUTHAOTAC_SANPHAM]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC] DROP CONSTRAINT [FK_LICHSUTHAOTAC_SANPHAM]
GO
/****** Object:  ForeignKey [FK_PHIEUDATHANG_KHACHHANG]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PHIEUDATHANG_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[PHIEUDATHANG]'))
ALTER TABLE [dbo].[PHIEUDATHANG] DROP CONSTRAINT [FK_PHIEUDATHANG_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_SANPHAM_DANHMUC]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SANPHAM_DANHMUC]') AND parent_object_id = OBJECT_ID(N'[dbo].[SANPHAM]'))
ALTER TABLE [dbo].[SANPHAM] DROP CONSTRAINT [FK_SANPHAM_DANHMUC]
GO
/****** Object:  Table [dbo].[BINHLUAN]    Script Date: 02/27/2012 09:10:45 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BINHLUAN_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[BINHLUAN]'))
ALTER TABLE [dbo].[BINHLUAN] DROP CONSTRAINT [FK_BINHLUAN_KHACHHANG]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BINHLUAN_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[BINHLUAN]'))
ALTER TABLE [dbo].[BINHLUAN] DROP CONSTRAINT [FK_BINHLUAN_SANPHAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BINHLUAN]') AND type in (N'U'))
DROP TABLE [dbo].[BINHLUAN]
GO
/****** Object:  Table [dbo].[CHITIETPHIEUDAT]    Script Date: 02/27/2012 09:10:45 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CHITIETPHIEUDAT_PHIEUDATHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]'))
ALTER TABLE [dbo].[CHITIETPHIEUDAT] DROP CONSTRAINT [FK_CHITIETPHIEUDAT_PHIEUDATHANG]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CHITIETPHIEUDAT_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]'))
ALTER TABLE [dbo].[CHITIETPHIEUDAT] DROP CONSTRAINT [FK_CHITIETPHIEUDAT_SANPHAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]') AND type in (N'U'))
DROP TABLE [dbo].[CHITIETPHIEUDAT]
GO
/****** Object:  Table [dbo].[KHUYENMAISP]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KHUYENMAISP_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[KHUYENMAISP]'))
ALTER TABLE [dbo].[KHUYENMAISP] DROP CONSTRAINT [FK_KHUYENMAISP_SANPHAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KHUYENMAISP]') AND type in (N'U'))
DROP TABLE [dbo].[KHUYENMAISP]
GO
/****** Object:  Table [dbo].[LICHSUTHAOTAC]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC] DROP CONSTRAINT [FK_LICHSUTHAOTAC_KHACHHANG]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_LOAITHAOTAC]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC] DROP CONSTRAINT [FK_LICHSUTHAOTAC_LOAITHAOTAC]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC] DROP CONSTRAINT [FK_LICHSUTHAOTAC_SANPHAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]') AND type in (N'U'))
DROP TABLE [dbo].[LICHSUTHAOTAC]
GO
/****** Object:  Table [dbo].[PHIEUDATHANG]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PHIEUDATHANG_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[PHIEUDATHANG]'))
ALTER TABLE [dbo].[PHIEUDATHANG] DROP CONSTRAINT [FK_PHIEUDATHANG_KHACHHANG]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PHIEUDATHANG]') AND type in (N'U'))
DROP TABLE [dbo].[PHIEUDATHANG]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SANPHAM_DANHMUC]') AND parent_object_id = OBJECT_ID(N'[dbo].[SANPHAM]'))
ALTER TABLE [dbo].[SANPHAM] DROP CONSTRAINT [FK_SANPHAM_DANHMUC]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SANPHAM]') AND type in (N'U'))
DROP TABLE [dbo].[SANPHAM]
GO
/****** Object:  Table [dbo].[LOAITHAOTAC]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOAITHAOTAC]') AND type in (N'U'))
DROP TABLE [dbo].[LOAITHAOTAC]
GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DANHMUC]') AND type in (N'U'))
DROP TABLE [dbo].[DANHMUC]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 02/27/2012 09:10:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KHACHHANG]') AND type in (N'U'))
DROP TABLE [dbo].[KHACHHANG]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 02/27/2012 09:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KHACHHANG]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KHACHHANG](
	[MaKhachHang] [nchar](10) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DienThoai] [nchar](10) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[DiemTichLuy] [int] NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000001', N'123', N'Trương Mỹ Dung', N'222 Nguyễn Trãi Q5', N'mydung2010@yahoo.com', N'0909212321', N'đang dùng', 25)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000002', N'123', N'Hà Anh Dũng', N'78 Tháp Mười Q6', N'anhdung@gmail.com', N'0934122321', N'đang dùng', 20)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000003', N'123', N'Trần Trọng Khiêm', N'23 Hai Bà Trưng Q3', N'trongkhiem_2001@yahoo.com', N'0902341342', N'đang dùng', 0)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000004', N'123', N'Mai Tuấn Hào', N'45 Trương Định Q1', N'tuanhao@gmail.com', N'0939098980', N'đang dùng', 2)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000005', N'123', N'Trương Chính Hùng', N'1234 3 Tháng 2 Q11', NULL, NULL, N'đang dùng', 0)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000006', N'123', N'Trịnh Thanh Hào', N'12 Hậu Giang Q6', NULL, NULL, N'đang dùng', 30)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000007', N'123', N'Nguyễn Minh', NULL, N'minhnguyen@yahoo.com', N'0990909090', N'đang dùng', 0)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000008', N'123', N'Hà Tuấn Anh', N'12 Nguyễn Trãi Q5', NULL, NULL, N'bị hủy', 0)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000009', N'123', N'Nguyễn Văn Trung', NULL, N'trungvn@yahoo.com', N'0930090909', N'đang dùng', 0)
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [MatKhau], [HoTen], [DiaChi], [Email], [DienThoai], [TinhTrang], [DiemTichLuy]) VALUES (N'KH00000010', N'123', N'Nguyễn Văn Hạo', N'12 Nguyễn Cư Trinh Q1', NULL, NULL, N'bị hủy', 0)
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 02/27/2012 09:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DANHMUC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DANHMUC](
	[MaDanhMuc] [nchar](10) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[MoTa] [nvarchar](150) NULL,
	[SoSanPhamDangBan] [int] NULL,
	[NgayTao] [datetime] NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_DANHMUC] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00001   ', N'Thời trang', N'Quần áo, nữ trang, phụ kiện', 0, '2002-01-01 00:00:00.000', N'đang dùng')
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00002   ', N'Hàng gia dụng', N'Thiết bị nhà bếp', 0, '2002-01-01 00:00:00.000', N'đang dùng')
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00003   ', N'Hàng kỹ thuật', N'Máy tính, hàng điện tử', 2, '2002-01-01 00:00:00.000', N'đang dùng')
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00004   ', N'Ăn uống', N'Phiếu ăn uống', 1, '2002-01-01 00:00:00.000', N'đang dùng')
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00005   ', N'Du lịch', N'Vé máy bay, tour du lịch', 0, '2002-01-01 00:00:00.000', N'đang dùng')
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00006   ', N'Mỹ phẩm', N'Các loại mỹ phẩm trong và ngoài nước', 2, '2002-01-01 00:00:00.000', N'đang dùng')
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00007   ', N'Xe cộ', N'bảo hiểm xe máy, thiết bị cho xe', 1,'2002-01-01 00:00:00.000', N'đang dùng')
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00008   ', N'Quà tặng', N'Quà lưu niệm', 1, '2002-01-01 00:00:00.000', N'đang dùng')
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00009   ', N'Làm đẹp', N'', 2, '2002-01-01 00:00:00.000', N'bị hủy')
INSERT [dbo].[DANHMUC] ([MaDanhMuc], [TenDanhMuc], [MoTa], [SoSanPhamDangBan], [NgayTao], [TinhTrang]) VALUES (N'DM00010   ', N'Giáo dục', N'sách giáo khoa', 1, '2002-01-01 00:00:00.000', N'đang dùng')
/****** Object:  Table [dbo].[LOAITHAOTAC]    Script Date: 02/27/2012 09:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOAITHAOTAC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LOAITHAOTAC](
	[MaLoaiThaoTac] [nchar](10) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_LOAITHAOTAC] PRIMARY KEY CLUSTERED 
(
	[MaLoaiThaoTac] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[LOAITHAOTAC] ([MaLoaiThaoTac], [MoTa]) VALUES (N'LTT01     ', N'XEM')
INSERT [dbo].[LOAITHAOTAC] ([MaLoaiThaoTac], [MoTa]) VALUES (N'LTT02     ', N'CẬP NHẬT')
INSERT [dbo].[LOAITHAOTAC] ([MaLoaiThaoTac], [MoTa]) VALUES (N'LTT03     ', N'HỦY')
INSERT [dbo].[LOAITHAOTAC] ([MaLoaiThaoTac], [MoTa]) VALUES (N'LTT04     ', N'CHỌN LIÊN KẾT HOẶC NÚT')
INSERT [dbo].[LOAITHAOTAC] ([MaLoaiThaoTac], [MoTa]) VALUES (N'LTT05     ', N'Bình luận')
INSERT [dbo].[LOAITHAOTAC] ([MaLoaiThaoTac], [MoTa]) VALUES (N'LTT06     ', N'Đặt mua')
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 02/27/2012 09:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SANPHAM]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SANPHAM](
	[MaSanPham] [nchar](10) NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[DonGia] [real] NULL,
	[SoLuongTon] [int] NULL,
	[SoLuongToiThieu] [int] NULL,
	[NgayDang] [datetime] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[MaDanhMuc] [nchar](10) NULL,
 CONSTRAINT [PK_SAN_PHAM] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000001', N'Mỹ phẩm AAA', NULL, 300000, 2000, 30, '2009-01-01 00:00:00.000', N'Còn bán được', N'DM00006   ')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000002', N'Kem lót trang điểm B.B', N'Kem lót làm min và sáng da không gây kích ứng da', 250000, 2000, 30, '2009-01-01 00:00:00.000', N'Hết hàng', N'DM00006   ')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000003', N'Bảo hiểm xe máy PJico', N'Bảo hiểm xe máy an toàn cho người tham gia giao thông', 55000, 2000, 30, '2009-01-01 00:00:00.000', N'Còn bán được', N'DM00007   ')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000004', N'Sản Phẩm Cỏ 4 Lá - TONYLAND', N' Món quà ý nghĩa, chan chứa yêu thương, gửi gắm tình yêu, niềm tin, may mắn, hi vọng đến những người thân yêu của mình - móc điện thoại và các sản phẩm cỏ 04 lá tại cửa hàng TonyLand', 140000, 300, 30, '2009-01-01 00:00:00.000', N'Còn bán được', N'DM00008   ')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000005', N'Hoa Trà Xanh Spa', N'Tỏa sáng cùng làn da trắng hồng mịn màng với dịch vụ làm trắng da cơ bản bằng mặt nạ bùn tại SPA HOA TRÀ XANH', 350000, 400, 20, '2009-01-01 00:00:00.000', N'Khuyến mãi', N'DM00009   ')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000006', N'Nha Khoa Thiên Đức', N'Hàm răng chắc khỏe, sáng bóng cùng nụ cười rạng ngời tỏa sáng với các dịch vụ làm răng tại NHA KHOA THIÊN ĐỨC', 200000, 50, 20, '2009-01-01 00:00:00.000', N'Khuyến mãi', N'DM00009   ')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000007', N'Anh Ngữ Smart', N'Hoàn Thiện Kỹ Năng Anh Ngữ Với Khóa Học Anh Văn Tổng Quát 12 Tuần Tại Học Viện Anh Ngữ Smart, Đảm Bảo Trình Độ Đầu Ra. ', 1500000, 500, 30, '2009-01-01 00:00:00.000', N'Khuyến mãi', N'DM00010   ')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000008', N'Bàn ủi Powerful Steam Brush', N'Ủi đồ theo phong cách mới với bàn ủi hơi nước cầm tay Powerful Steam Brush', 7000000, 120, 30, '2009-01-01 00:00:00.000', N'Đã hủy', N'DM00003   ')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000009', N'Bộ làm tóc SOKANY', N'Tự do biến hóa với mái tóc của bạn với bộ dụng cụ làm tóc 06 món SOKANY', 799000, 100, 30, '2009-01-01 00:00:00.000', N'Còn bán được', N'DM00003   ')
INSERT [dbo].[SANPHAM] ([MaSanPham], [TenSanPham], [MoTa], [DonGia], [SoLuongTon], [SoLuongToiThieu], [NgayDang], [TinhTrang], [MaDanhMuc]) VALUES (N'SP00000010', N'iệc Buffet tối Cơm Nắm Việt', N'Thưởng thức tiệc Buffet Cơm Nắm Việt được thay đổi hằng ngày như: Tôm nướng, mực nướng, cá kèo nướng, sò huyết xào tỏi, cua đồng rang me, các loại Salad trộn, xúc xích nướng, bánh tôm hồ tây... cùng các loại bánh đặc trưng vùng miền và kem tươi...', 259000, 200, 30, '2009-01-01 00:00:00.000', N'Khuyến mãi', N'DM00004   ')
/****** Object:  Table [dbo].[PHIEUDATHANG]    Script Date: 02/27/2012 09:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PHIEUDATHANG]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PHIEUDATHANG](
	[MaDatHang] [nchar](10) NOT NULL,
	[NgayDat] [datetime] NULL,
	[MaKhachHang] [nchar](10) NULL,
	[TriGiaSP] [real] NULL,
	[TinhTrang] [nchar](50) NULL,
	[PhiVanChuyen] [real] NULL,
 CONSTRAINT [PK_PHIEUDATHANG] PRIMARY KEY CLUSTERED 
(
	[MaDatHang] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[PHIEUDATHANG] ([MaDatHang], [NgayDat], [MaKhachHang], [TriGiaSP], [TinhTrang], [PhiVanChuyen]) VALUES (N'PDH0000001', '2012-01-27 12:30:00.000', N'KH00000001', 250000, N'Đang chờ giao                                     ', 0)
INSERT [dbo].[PHIEUDATHANG] ([MaDatHang], [NgayDat], [MaKhachHang], [TriGiaSP], [TinhTrang], [PhiVanChuyen]) VALUES (N'PDH0000002', '2012-02-01 00:00:00.000', N'KH00000002', 1080000, N'Đã giao                                           ', 0)
INSERT [dbo].[PHIEUDATHANG] ([MaDatHang], [NgayDat], [MaKhachHang], [TriGiaSP], [TinhTrang], [PhiVanChuyen]) VALUES (N'PDH0000003', '2012-02-01 00:00:00.000', N'KH00000006', 1040000, N'Đang chờ giao                                     ', 0)
INSERT [dbo].[PHIEUDATHANG] ([MaDatHang], [NgayDat], [MaKhachHang], [TriGiaSP], [TinhTrang], [PhiVanChuyen]) VALUES (N'PDH0000004', '2012-01-31 00:00:00.000', N'KH00000004', 55000, N'Đang chờ giao                                     ', 0)
INSERT [dbo].[PHIEUDATHANG] ([MaDatHang], [NgayDat], [MaKhachHang], [TriGiaSP], [TinhTrang], [PhiVanChuyen]) VALUES (N'PDH0000005', '2012-01-21 00:00:00.000', N'KH00000006', 390000, N'Đang chờ giao                                     ', 0)
INSERT [dbo].[PHIEUDATHANG] ([MaDatHang], [NgayDat], [MaKhachHang], [TriGiaSP], [TinhTrang], [PhiVanChuyen]) VALUES (N'PDH0000006', '2012-01-11 00:00:00.000', N'KH00000001', 540000, N'Đã hủy                                            ', 0)
/****** Object:  Table [dbo].[LICHSUTHAOTAC]    Script Date: 02/27/2012 09:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LICHSUTHAOTAC](
	[LoaiThaoTac] [nchar](10) NULL,
	[MaSanPham] [nchar](10) NULL,
	[MaKhachHang] [nchar](10) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
 CONSTRAINT [PK_LICHSUTHAOTAC] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC,
	[ThoiGian] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT06     ', N'SP00000002', N'KH00000001', '2012-01-11 00:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT01     ', N'SP00000001', N'KH00000001', '2012-01-23 00:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT05     ', N'SP00000001', N'KH00000001', '2012-01-23 12:30:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT01     ', N'SP00000001', N'KH00000001', '2012-01-24 00:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT05     ', N'SP00000001', N'KH00000001', '2012-01-24 12:30:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT06     ', N'SP00000001', N'KH00000001', '2012-01-27 12:30:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT03     ', N'SP00000002', N'KH00000001', '2012-02-01 00:50:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT01     ', N'SP00000001', N'KH00000002', '2012-01-25 12:30:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT06     ', N'SP00000001', N'KH00000002', '2012-02-01 00:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT01     ', N'SP00000002', N'KH00000003', '2012-01-01 00:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT05     ', N'SP00000002', N'KH00000003', '2012-01-02 08:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT01     ', N'SP00000002', N'KH00000004', '2012-01-01 04:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT05     ', N'SP00000002', N'KH00000004', '2012-01-01 04:50:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT01     ', N'SP00000003', N'KH00000004', '2012-01-21 00:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT06     ', N'SP00000003', N'KH00000004', '2012-01-31 00:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT05     ', N'SP00000003', N'KH00000004','2012-02-21 01:05:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT01     ', N'SP00000005', N'KH00000005', '2012-02-01 00:02:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT05     ', N'SP00000005', N'KH00000005', '2012-02-01 00:32:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT06     ', N'SP00000001', N'KH00000006', '2012-01-21 00:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT06     ', N'SP00000002', N'KH00000006', '2012-01-21 00:03:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT06     ', N'SP00000004', N'KH00000006', '2012-02-01 00:00:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT05     ', N'SP00000004', N'KH00000006', '2012-02-01 00:30:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT01     ', N'SP00000004', N'KH00000006', '2012-02-01 00:50:00.000')
INSERT [dbo].[LICHSUTHAOTAC] ([LoaiThaoTac], [MaSanPham], [MaKhachHang], [ThoiGian]) VALUES (N'LTT01     ', N'SP00000003', N'KH00000006', '2012-02-01 01:50:00.000')
/****** Object:  Table [dbo].[KHUYENMAISP]    Script Date: 02/27/2012 09:10:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KHUYENMAISP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KHUYENMAISP](
	[MaKhuyenMai] [nchar](10) NOT NULL,
	[MaSanPham] [nchar](10) NOT NULL,
	[PhanTramGiam] [int] NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHUYENMAISP] PRIMARY KEY CLUSTERED 
(
	[MaKhuyenMai] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000001 ', N'SP00000005', 10, '2009-01-01 00:00:00.000', '2009-01-09 00:00:00.000', N'Đã hủy')
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000002 ', N'SP00000005', 10, '2011-01-01 00:00:00.000', '2012-04-09 00:00:00.000', N'đang dùng')
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000003 ', N'SP00000001', 10, '2009-01-01 00:00:00.000', '2009-01-09 00:00:00.000', N'Đã hủy')
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000004 ', N'SP00000006', 10, '2012-01-01 00:00:00.000','2012-03-09 00:00:00.000', N'đang dùng')
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000005 ', N'SP00000007', 10, '2012-02-01 00:00:00.000','2012-03-09 00:00:00.000', N'đang dùng')
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000006 ', N'SP00000008', 10, '2009-01-01 00:00:00.000', '2009-01-09 00:00:00.000', N'Đã hủy')
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000007 ', N'SP00000010', 10, '2009-01-01 00:00:00.000', '2009-01-09 00:00:00.000', N'Đã hủy')
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000008 ', N'SP00000006', 10, '2012-02-01 00:00:00.000', '2009-03-29 00:00:00.000', N'đang dùng')
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000009 ', N'SP00000009', 10, '2009-01-01 00:00:00.000', '2009-01-09 00:00:00.000', N'Đã hủy')
INSERT [dbo].[KHUYENMAISP] ([MaKhuyenMai], [MaSanPham], [PhanTramGiam], [NgayBatDau], [NgayKetThuc], [TinhTrang]) VALUES (N'KM0000010 ', N'SP00000001', 10, '2009-01-01 00:00:00.000', '2009-01-09 00:00:00.000', N'Đã hủy')
/****** Object:  Table [dbo].[CHITIETPHIEUDAT]    Script Date: 02/27/2012 09:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CHITIETPHIEUDAT](
	[MaChiTietPD] [nchar](10) NOT NULL,
	[MaSanPham] [nchar](10) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [real] NULL,
	[MaDatHang] [nchar](10) NULL,
 CONSTRAINT [PK_CHITIETPHIEUDAT] PRIMARY KEY CLUSTERED 
(
	[MaChiTietPD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[CHITIETPHIEUDAT] ([MaChiTietPD], [MaSanPham], [SoLuong], [DonGia], [MaDatHang]) VALUES (N'CT00000001', N'SP00000002', 1, 250000, N'PDH0000001')
INSERT [dbo].[CHITIETPHIEUDAT] ([MaChiTietPD], [MaSanPham], [SoLuong], [DonGia], [MaDatHang]) VALUES (N'CT00000002', N'SP00000001', 1, 300000, N'PDH0000006')
INSERT [dbo].[CHITIETPHIEUDAT] ([MaChiTietPD], [MaSanPham], [SoLuong], [DonGia], [MaDatHang]) VALUES (N'CT00000003', N'SP00000001', 2, 300000, N'PDH0000002')
INSERT [dbo].[CHITIETPHIEUDAT] ([MaChiTietPD], [MaSanPham], [SoLuong], [DonGia], [MaDatHang]) VALUES (N'CT00000004', N'SP00000003', 1, 55000, N'PDH0000004')
INSERT [dbo].[CHITIETPHIEUDAT] ([MaChiTietPD], [MaSanPham], [SoLuong], [DonGia], [MaDatHang]) VALUES (N'CT00000005', N'SP00000001', 1, 300000, N'PDH0000003')
INSERT [dbo].[CHITIETPHIEUDAT] ([MaChiTietPD], [MaSanPham], [SoLuong], [DonGia], [MaDatHang]) VALUES (N'CT00000006', N'SP00000002', 2, 250000, N'PDH0000003')
INSERT [dbo].[CHITIETPHIEUDAT] ([MaChiTietPD], [MaSanPham], [SoLuong], [DonGia], [MaDatHang]) VALUES (N'CT00000007', N'SP00000004', 2, 140000, N'PDH0000005')
INSERT [dbo].[CHITIETPHIEUDAT] ([MaChiTietPD], [MaSanPham], [SoLuong], [DonGia], [MaDatHang]) VALUES (N'CT00000008', N'SP00000003', 2, 55000, N'PDH0000005')
/****** Object:  Table [dbo].[BINHLUAN]    Script Date: 02/27/2012 09:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BINHLUAN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BINHLUAN](
	[MaBL] [nchar](10) NOT NULL,
	[NoiDung] [nvarchar](350) NULL,
	[NgayDang] [datetime] NULL,
	[MaKhachHang] [nchar](10) NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[MaSanPham] [nchar](10) NULL,
 CONSTRAINT [PK_BINHLUAN] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[BINHLUAN] ([MaBL], [NoiDung], [NgayDang], [MaKhachHang], [TinhTrang], [MaSanPham]) VALUES (N'BL00000001', N'sản phẩm này chất lượng thế nào?', '2012-01-23 00:00:00.000', N'KH00000001', N'Đang dùng', N'SP00000001')
INSERT [dbo].[BINHLUAN] ([MaBL], [NoiDung], [NgayDang], [MaKhachHang], [TinhTrang], [MaSanPham]) VALUES (N'BL00000002', N'Sản phẩm này do nước nào sản xuất?', '2012-01-24 00:00:00.000', N'KH00000001', N'Đang dùng', N'SP00000001')
INSERT [dbo].[BINHLUAN] ([MaBL], [NoiDung], [NgayDang], [MaKhachHang], [TinhTrang], [MaSanPham]) VALUES (N'BL00000003', N'Mình đọc trên mạng thấy sản phẩm này chất lượng rất ok', '2012-01-25 00:00:00.000', N'KH00000002', N'Đang dùng', N'SP00000001')
INSERT [dbo].[BINHLUAN] ([MaBL], [NoiDung], [NgayDang], [MaKhachHang], [TinhTrang], [MaSanPham]) VALUES (N'BL00000005', N'XXXXXXX', '2012-02-01 00:00:00.000', N'KH00000001', N'Đã hủy', N'SP00000001')
INSERT [dbo].[BINHLUAN] ([MaBL], [NoiDung], [NgayDang], [MaKhachHang], [TinhTrang], [MaSanPham]) VALUES (N'BL00000006', N'Bảo hiểm này của công ty nào vậy?', '2012-03-01 00:00:00.000', N'KH00000004', N'Đang dùng', N'SP00000003')
INSERT [dbo].[BINHLUAN] ([MaBL], [NoiDung], [NgayDang], [MaKhachHang], [TinhTrang], [MaSanPham]) VALUES (N'BL00000007', N'Có được sử dụng các dịch vụ khác trong spa ko?', '2012-03-01 00:00:00.000', N'KH00000005', N'Đang dùng', N'SP00000005')
INSERT [dbo].[BINHLUAN] ([MaBL], [NoiDung], [NgayDang], [MaKhachHang], [TinhTrang], [MaSanPham]) VALUES (N'BL00000008', N'Chất liệu của nó là thủy tinh hay nhựa thế?', '2012-03-01 00:00:00.000', N'KH00000006', N'Đang dùng', N'SP00000004')
INSERT [dbo].[BINHLUAN] ([MaBL], [NoiDung], [NgayDang], [MaKhachHang], [TinhTrang], [MaSanPham]) VALUES (N'BL00000009', N'Cái này có giống cái đang giới thiệu trên vi ti không?', '2012-03-01 00:00:00.000', N'KH00000004', N'Đang dùng', N'SP00000002')
INSERT [dbo].[BINHLUAN] ([MaBL], [NoiDung], [NgayDang], [MaKhachHang], [TinhTrang], [MaSanPham]) VALUES (N'BL00000010', N'Hình như cùng loại sản phẩm đó', '2012-03-01 00:00:00.000', N'KH00000003', N'Đã hủy', N'SP00000002')
/****** Object:  ForeignKey [FK_BINHLUAN_KHACHHANG]    Script Date: 02/27/2012 09:10:45 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BINHLUAN_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[BINHLUAN]'))
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_KHACHHANG] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KHACHHANG] ([MaKhachHang])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BINHLUAN_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[BINHLUAN]'))
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_BINHLUAN_SANPHAM]    Script Date: 02/27/2012 09:10:45 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BINHLUAN_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[BINHLUAN]'))
ALTER TABLE [dbo].[BINHLUAN]  WITH CHECK ADD  CONSTRAINT [FK_BINHLUAN_SANPHAM] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SANPHAM] ([MaSanPham])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BINHLUAN_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[BINHLUAN]'))
ALTER TABLE [dbo].[BINHLUAN] CHECK CONSTRAINT [FK_BINHLUAN_SANPHAM]
GO
/****** Object:  ForeignKey [FK_CHITIETPHIEUDAT_PHIEUDATHANG]    Script Date: 02/27/2012 09:10:45 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CHITIETPHIEUDAT_PHIEUDATHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]'))
ALTER TABLE [dbo].[CHITIETPHIEUDAT]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUDAT_PHIEUDATHANG] FOREIGN KEY([MaDatHang])
REFERENCES [dbo].[PHIEUDATHANG] ([MaDatHang])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CHITIETPHIEUDAT_PHIEUDATHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]'))
ALTER TABLE [dbo].[CHITIETPHIEUDAT] CHECK CONSTRAINT [FK_CHITIETPHIEUDAT_PHIEUDATHANG]
GO
/****** Object:  ForeignKey [FK_CHITIETPHIEUDAT_SANPHAM]    Script Date: 02/27/2012 09:10:45 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CHITIETPHIEUDAT_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]'))
ALTER TABLE [dbo].[CHITIETPHIEUDAT]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETPHIEUDAT_SANPHAM] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SANPHAM] ([MaSanPham])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CHITIETPHIEUDAT_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[CHITIETPHIEUDAT]'))
ALTER TABLE [dbo].[CHITIETPHIEUDAT] CHECK CONSTRAINT [FK_CHITIETPHIEUDAT_SANPHAM]
GO
/****** Object:  ForeignKey [FK_KHUYENMAISP_SANPHAM]    Script Date: 02/27/2012 09:10:46 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KHUYENMAISP_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[KHUYENMAISP]'))
ALTER TABLE [dbo].[KHUYENMAISP]  WITH CHECK ADD  CONSTRAINT [FK_KHUYENMAISP_SANPHAM] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SANPHAM] ([MaSanPham])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KHUYENMAISP_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[KHUYENMAISP]'))
ALTER TABLE [dbo].[KHUYENMAISP] CHECK CONSTRAINT [FK_KHUYENMAISP_SANPHAM]
GO
/****** Object:  ForeignKey [FK_LICHSUTHAOTAC_KHACHHANG]    Script Date: 02/27/2012 09:10:46 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC]  WITH CHECK ADD  CONSTRAINT [FK_LICHSUTHAOTAC_KHACHHANG] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KHACHHANG] ([MaKhachHang])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC] CHECK CONSTRAINT [FK_LICHSUTHAOTAC_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_LICHSUTHAOTAC_LOAITHAOTAC]    Script Date: 02/27/2012 09:10:46 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_LOAITHAOTAC]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC]  WITH CHECK ADD  CONSTRAINT [FK_LICHSUTHAOTAC_LOAITHAOTAC] FOREIGN KEY([LoaiThaoTac])
REFERENCES [dbo].[LOAITHAOTAC] ([MaLoaiThaoTac])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_LOAITHAOTAC]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC] CHECK CONSTRAINT [FK_LICHSUTHAOTAC_LOAITHAOTAC]
GO
/****** Object:  ForeignKey [FK_LICHSUTHAOTAC_SANPHAM]    Script Date: 02/27/2012 09:10:46 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC]  WITH CHECK ADD  CONSTRAINT [FK_LICHSUTHAOTAC_SANPHAM] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SANPHAM] ([MaSanPham])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LICHSUTHAOTAC_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[LICHSUTHAOTAC]'))
ALTER TABLE [dbo].[LICHSUTHAOTAC] CHECK CONSTRAINT [FK_LICHSUTHAOTAC_SANPHAM]
GO
/****** Object:  ForeignKey [FK_PHIEUDATHANG_KHACHHANG]    Script Date: 02/27/2012 09:10:46 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PHIEUDATHANG_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[PHIEUDATHANG]'))
ALTER TABLE [dbo].[PHIEUDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUDATHANG_KHACHHANG] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KHACHHANG] ([MaKhachHang])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PHIEUDATHANG_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[PHIEUDATHANG]'))
ALTER TABLE [dbo].[PHIEUDATHANG] CHECK CONSTRAINT [FK_PHIEUDATHANG_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_SANPHAM_DANHMUC]    Script Date: 02/27/2012 09:10:46 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SANPHAM_DANHMUC]') AND parent_object_id = OBJECT_ID(N'[dbo].[SANPHAM]'))
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_DANHMUC] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DANHMUC] ([MaDanhMuc])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SANPHAM_DANHMUC]') AND parent_object_id = OBJECT_ID(N'[dbo].[SANPHAM]'))
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_DANHMUC]
GO
