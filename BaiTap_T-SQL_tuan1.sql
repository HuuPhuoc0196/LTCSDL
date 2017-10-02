/*
	Cho biến @n. Viết script tính tổng từ 1 đến n và xuất ra màn hình bằng lệnh
	PRINT thông báo theo dạng “Tổng từ 1 đến [@n] là [@kq]”.
*/

DECLARE @n int, @i int = 1, @tong int = 0;
SET @n = 3;

WHILE(@i <= @n)
BEGIN
	SET @tong = @tong + @i;
	SET @i += 1;
END

PRINT N'Tổng từ 1 đến ' + CAST(@n AS nvarchar) + N' là ' + CAST(@tong AS nvarchar);

/*
	Cho biến @n. Viết script tính tổng các số chẵn từ 1 đến n và xuất ra màn
	hình bằng lệnh PRINT thông báo theo dạng “Tổng các số chẵn từ 1 đến
	[@n] là [@kq]”.
*/


DECLARE @n int, @i int = 1, @tong int = 0;
SET @n = 5;
WHILE(@i <= @n)
BEGIN
	IF(@i%2 = 0)
		SET @tong+=@i;
	SET @i += 1;
END

PRINT N'Tổng các số chẳn từ 1 đến ' + CAST(@n AS nvarchar) + N' là ' + CAST(@tong AS nvarchar);


/*
	Cho biến @n. Viết script tính S với công thức sau và xuất ra thông báo theo
	dạng “S = [@kq]”
	S = 1 + 1/2 + 1/3 + ... + 1/n	
*/

DECLARE @n int, @i int = 1, @tong float = 0;
SET @n = 4;

WHILE(@i <= @n)
BEGIN
	SET @tong += 1 / CAST(@i AS float);
	SET @i +=1;
END

PRINT 'S = ' + CAST(@tong AS nvarchar);

/*
	Cho lược đồ cơ sở dữ liệu
	SinhVien (#MaSV, HoTen, DiemTB, MaLop, NamSinh, NamBD, NamKT,
			TinhTrang)
	Lop (#MaLop, MaKhoa, SiSo)
	Khoa (#MaKhoa, TenKhoa, NamThanhLap)
	MonHoc (#MaMH, TenMonHoc, SoChi, MaKhoa)
	KetQua (#MaSV, #MaMH, #LanThi, Diem)
*/

CREATE DATABASE QuanLySinhVien
GO

USE QuanLySinhVien
GO

CREATE TABLE SinhVien(
	MaSV nchar(10) PRIMARY KEY,
	HoTen nvarchar(50),
	DiemTB float,
	MaLop nchar(10),
	NamSinh Date,
	NamBD nvarchar(20),
	NamKT nvarchar(20),
	TinhTrang nvarchar(30)
)
GO

CREATE TABLE Lop(
	MaLop nchar(10) PRIMARY KEY,
	MaKhoa nchar(10),
	Siso int
)
GO

CREATE TABLE Khoa(
	MaKhoa nchar(10) PRIMARY KEY,
	TenKhoa nvarchar(30),
	NamThanhLap int
)
GO

CREATE TABLE MonHoc(
	MaMH nchar(10) PRIMARY KEY,
	TenMH nvarchar(30),
	SoChi int,
	MaKhoa nchar(10)
)
GO

CREATE TABLE KetQua(
	MaSV nchar(10),
	MaMH nchar(10),
	LanThi int,
	Diem float,
	PRIMARY KEY (MaSV, MaMH, LanThi)
)

ALTER TABLE SinhVien 
ADD CONSTRAINT PK_SinhVien_Lop FOREIGN KEY (MaLop) REFERENCES Lop(MaLop)

ALTER TABLE Lop
ADD CONSTRAINT PK_Lop_Khoa FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)

ALTER TABLE MonHoc
ADD CONSTRAINT PK_MonHoc_Khoa FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)

ALTER TABLE KetQua
ADD CONSTRAINT PK_KetQua_SinhVien FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV)
ALTER TABLE KetQua
ADD CONSTRAINT PK_KetQua_MonHoc FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
GO

INSERT INTO Khoa VALUES ('CNTT', N'Công nghệ thông tin' , 1995)
INSERT INTO Khoa VALUES ('KT', N'Kế toán' , 1996)
INSERT INTO Khoa VALUES ('QTKD', N'Quản trị kinh doanh' , 1994)
INSERT INTO Khoa VALUES ('D', N'Điện' , 1998)
INSERT INTO Khoa VALUES ('NN', N'Ngoại ngữ' , 1995)
GO

INSERT INTO Lop VALUES ('L01', 'CNTT', 45)
INSERT INTO Lop VALUES ('L02', 'KT', 47)
INSERT INTO Lop VALUES ('L03', 'QTKD', 50)
INSERT INTO Lop VALUES ('L04', 'CNTT', 56)
INSERT INTO Lop VALUES ('L05', 'D', 36)
GO

INSERT INTO MonHoc VALUES ('MH01', N'Lập trình web', 30, 'CNTT')
INSERT INTO MonHoc VALUES ('MH02', N'Lập trình CSDL', 56, 'CNTT')
INSERT INTO MonHoc VALUES ('MH03', N'Lập trình Hướng Đối Tượng', 79, 'CNTT')
INSERT INTO MonHoc VALUES ('MH04', N'Doanh nhân tương lai', 46, 'QTKD')
INSERT INTO MonHoc VALUES ('MH05', N'Tiếng anh chuyên ngàn', 56, 'NN')
GO

INSERT INTO SinhVien VALUES ('SV01', N'Lê Văn A', 7.6, 'L01', '19960906', N'Không rõ', N'Không rõ', N'Bình thường')
INSERT INTO SinhVien VALUES ('SV02', N'Lê Văn B', 6.5, 'L02', '19960409', N'Không rõ', N'Không rõ', N'Bình thường')
INSERT INTO SinhVien VALUES ('SV03', N'Lê Văn C', 9.8, 'L03', '19900809', N'Không rõ', N'Không rõ', N'Bình thường')
INSERT INTO SinhVien VALUES ('SV04', N'Lê Văn D', 7.5, 'L01', '19960506', N'Không rõ', N'Không rõ', N'Bình thường')
INSERT INTO SinhVien VALUES ('SV05', N'Lê Văn E', 8.2, 'L02', '19960706', N'Không rõ', N'Không rõ', N'Bình thường')
GO

INSERT INTO KetQua VALUES ('SV01', 'Mh01', 1, 9.2)
INSERT INTO KetQua VALUES ('SV01', 'Mh02', 1, 5.6)
INSERT INTO KetQua VALUES ('SV01', 'Mh03', 1, 7.2)
INSERT INTO KetQua VALUES ('SV02', 'Mh01', 1, 4.5)
INSERT INTO KetQua VALUES ('SV03', 'Mh01', 1, 8.6)
GO

/*
	Tạo view xuất thông tin mã sinh viên, tên sinh viên, mã môn học và điểm
	trong lần thi sau cùng của sinh viên.
*/
CREATE VIEW ThongTinSV AS
SELECT SinhVien.MaSV, HoTen, MonHoc.MaMH, DiemTB
FROM SinhVien, KetQua, MonHoc
WHERE SinhVien.MaSV = KetQua.MaSV
AND	  KetQua.MaMH = MonHoc.MaMH

/*
	Cập nhật điểm thi lần sau cùng của một sinh viên nào đó.
*/

-- TO DO ------------

/* 
	Tạo view lấy thông tin sinh viên, tuổi, mã lớp, số môn đã học của sinh viên.
*/

CREATE VIEW ThongTinSinhVien AS
SELECT SinhVien.MaSV, HoTen, DiemTB, YEAR(GETDATE()) - YEAR(NamSinh) AS Tuoi, Lop.MaLop, COUNT(MonHoc.MaMH) AS SoMonDaHoc
FROM SinhVien, Lop, Khoa, MonHoc
WHERE SinhVien.MaLop = Lop.MaLop
AND	  Lop.MaKhoa = Khoa.MaKhoa
AND	  Khoa.MaKhoa = MonHoc.MaKhoa
GROUP BY SinhVien.MaSV, HoTen, DiemTB, YEAR(GETDATE()) - YEAR(NamSinh), Lop.MaLop

/*
	Tạo view cho biết thông tin của 3 sinh viên có điểm trung bình cao nhất của
	mỗi lớp. Xếp giảm theo điểm trung bình (*).
*/

CREATE VIEW DiemTB AS
SELECT TOP 3 *
FROM SinhVien
ORDER BY DiemTB ASC

/*
	Tạo view cho biết thông tin STT, mã lớp, tên lớp, sỉ số, số sinh viên còn
	nợ, số sinh viên đậu (*).
*/

-- TO DO ----