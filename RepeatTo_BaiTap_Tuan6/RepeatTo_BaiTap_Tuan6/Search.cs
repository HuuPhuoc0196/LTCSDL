using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;

namespace RepeatTo_BaiTap_Tuan6
{
    public partial class Search : Form
    {
        private SqlConnection cnn = null;
        public Search()
        {
            InitializeComponent();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            string sql = "";
            if(rdId.Checked){
                string id = txtInput.Text;
                sql = "SELECT * FROM KHACHHANG WHERE MaKhachHang = '" + id + "'";
            }else if(rdName.Checked){
                string name = txtInput.Text;
                sql = "SELECT * FROM KHACHHANG WHERE HoTen LIKE '%" + name + "%'";
            }
            else
            {
                string status = txtInput.Text;
                sql = "SELECT * FROM KHACHHANG WHERE TinhTrang = '" + status + "'";
            }
            dgvShow.DataSource = new DataCustomer().GetData(cnn, sql);
        }

        private void Search_Load(object sender, EventArgs e)
        {
            string cnStr = ConfigurationManager.ConnectionStrings["CustomerConnectString"].ConnectionString;
            cnn = new SqlConnection(cnStr);
        }
    }
}
