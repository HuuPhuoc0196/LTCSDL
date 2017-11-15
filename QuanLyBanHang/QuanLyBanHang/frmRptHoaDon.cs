using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.Reporting.WinForms;

namespace QuanLyBanHang
{
    public partial class frmRptHoaDon : Form
    {
        public frmRptHoaDon()
        {
            InitializeComponent();
        }

        private void frmRptHoaDon_Load(object sender, EventArgs e)
        {

            string cnStr = "";
            SqlConnection cn = new SqlConnection();
            try
            {
                cnStr = ConfigurationManager.ConnectionStrings["QuanLyBanHangConnect"].ConnectionString;
                cn.ConnectionString = cnStr;
                DataTable dt = new DataTable();
                string sql = "SELECT * FROM HoaDon";
                SqlDataAdapter da = new SqlDataAdapter(sql, cn);
                da.Fill(dt);
                ReportDataSource rps = new ReportDataSource("dsInvoice", dt);
                rpvHoaDon.LocalReport.DataSources.Clear();
                rpvHoaDon.LocalReport.DataSources.Add(rps);
                rpvHoaDon.LocalReport.ReportPath = @"..\..\rptHoaDon.rdlc";
                this.rpvHoaDon.RefreshReport();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
