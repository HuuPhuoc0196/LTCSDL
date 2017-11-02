using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace QLNV.DTO
{
    public class NhanVien
    {
        public int maNV { get; set; }
        public string ho { get; set; }

        public string ten { get; set; }

        public string diaChi { get; set; }

        public string dienThoai { get; set; }

        public NhanVien(int maNV, string ho, string ten, string diaChi, string dienThoai)
        {
            this.maNV = maNV; 
            this.ho = ho;
            this.ten = ten;
            this.diaChi = diaChi;
            this.dienThoai = dienThoai;
        }
    }
}
