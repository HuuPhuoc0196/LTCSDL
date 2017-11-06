using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BUS;
using DTO;
//using DAO;
namespace Review3Layer
{
    public partial class ManageCustomers : Form
    {
        public ManageCustomers()
        {
            InitializeComponent();
        }

        private void ManageCustomers_Load(object sender, EventArgs e)
        {
            try
            {
                CustomerBUS cus = new CustomerBUS();
                dataGridView1.DataSource = cus.GetData();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi " + ex.Message);
            }

        }

        private void btnBackInsert_Click(object sender, EventArgs e)
        {
            this.Hide();
            InsertCustomer frmInsert = new InsertCustomer();
            frmInsert.ShowDialog();
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Home frmHome = new Home();
            frmHome.ShowDialog();
            this.Close();
        }

    }
}
