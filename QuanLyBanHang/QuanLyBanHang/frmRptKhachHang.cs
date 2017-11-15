using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.Reporting.WinForms;

namespace QuanLyBanHang
{
    public partial class frmRptKhachHang : Form
    {
        public frmRptKhachHang()
        {
            InitializeComponent();
        }

        private void frmRptKhachHang_Load(object sender, EventArgs e)
        {

            string cnStr = ""; 
            SqlConnection cn = new SqlConnection();
            try
            {
                cnStr = ConfigurationManager.ConnectionStrings["QuanLyBanHangConnect"].ConnectionString;
                cn.ConnectionString = cnStr;
                DataTable dt = new DataTable();
                string sql = "SELECT * FROM KhachHang";
                SqlDataAdapter da = new SqlDataAdapter(sql, cn);
                da.Fill(dt);
                ReportDataSource rps = new ReportDataSource("dsCus", dt);
                rpvKhachHang.LocalReport.DataSources.Clear();
                rpvKhachHang.LocalReport.DataSources.Add(rps);
                rpvKhachHang.LocalReport.ReportPath = @"..\..\rptKhachHang.rdlc";
                this.rpvKhachHang.RefreshReport();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
