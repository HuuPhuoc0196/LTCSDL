using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLSanPham
{
    class Product
    {
        private String maSP, tenSP, moTa, ngayDang, tinhTrang, maDanhMuc;
        private int donGia, soLuong, soLuongToiThieu;

        Product(String maSP, String tenSP, String moTa, int donGia, int soLuong, int soLuongToiThieu, String ngayDang, String tinhTrang, String danhMuc)
        {
            this.maSP = maSP;
            this.tenSP = tenSP;
            this.moTa = moTa;
            this.donGia = donGia;
            this.soLuong = soLuong;
            this.soLuongToiThieu = soLuongToiThieu;
            this.ngayDang = ngayDang;
            this.tinhTrang = tinhTrang;
            this.maDanhMuc = danhMuc;
        }
    }
}
