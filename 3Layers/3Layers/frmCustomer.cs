using BUS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _3Layers
{
    public partial class frmCustomer : Form
    {
        public frmCustomer()
        {
            InitializeComponent();
        }

        private void frmCustomer_Load(object sender, EventArgs e)
        {
            try
            {
                dgvCustomer.DataSource = new CustomerBUS().GetData();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("...\n\n" + ex.Message, "Thông báo");
            }
        }

    }
}
