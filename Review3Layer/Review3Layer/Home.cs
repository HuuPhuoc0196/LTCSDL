using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Review3Layer
{
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            this.Hide();
            ManageCustomers frmManageCus = new ManageCustomers();
            frmManageCus.ShowDialog();
            this.Close();
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            this.Hide();
            InsertCustomer frmInsert = new InsertCustomer();
            frmInsert.ShowDialog();
            this.Close();
        }
    }
}
