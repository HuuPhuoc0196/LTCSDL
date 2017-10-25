using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using QL.BUS;
using System.Data.SqlClient;
namespace BaiTap_tuan9_3layer2._0
{
    public partial class QLNV : Form
    {
        public QLNV()
        {
            InitializeComponent();
        }

        private void QLSV_Load(object sender, EventArgs e)
        {
            try
            {
                dgvShow.DataSource = new NhanVienBUS().GetData();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("...\n\n" + ex.Message, "Thông báo");
            }
        }
    }
}
