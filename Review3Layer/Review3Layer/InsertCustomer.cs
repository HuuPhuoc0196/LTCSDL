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

namespace Review3Layer
{
    public partial class InsertCustomer : Form
    {
        public InsertCustomer()
        {
            InitializeComponent();
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            string id, pass, name, address, email, phone, status;
            int accumulation;

            id = txtID.Text.Trim();
            pass = txtPass.Text.Trim();
            name = txtName.Text.Trim();
            address = txtAddress.Text.Trim();
            email = txtEmail.Text.Trim();
            phone = txtPhone.Text.Trim();
            status = txtStatus.Text.Trim();
            accumulation = Convert.ToInt32(txtAccumulation.Text.Trim());

            int RowsOfNumber = 0;
            try
            {
                CustomerBUS cus = new CustomerBUS();
                RowsOfNumber = cus.InsertCustomer(id, pass, name, address, email, phone, status, accumulation);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi " + ex.Message, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            if (RowsOfNumber != 0)
            {
                MessageBox.Show("Bạn vừa thêm thành công nhân viên", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                Cancel();
            }
        }

        private void Cancel()
        {
            txtID.Text = "";
            txtPass.Text = "";
            txtName.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtStatus.Text = "";
            txtAccumulation.Text = "0"; 
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Cancel();
        }

        private void btnManageCus_Click(object sender, EventArgs e)
        {
            this.Hide();
            ManageCustomers frmManageCus = new ManageCustomers();
            frmManageCus.ShowDialog();
            this.Close();
        }

        private void InsertCustomer_Load(object sender, EventArgs e)
        {
            txtAccumulation.Text = "0"; 
        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            this.Hide();
            Home frmHome = new Home();
            frmHome.ShowDialog();
            this.Close();
        }
    }
}
