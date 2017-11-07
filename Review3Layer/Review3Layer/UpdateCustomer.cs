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
    public partial class UpdateCustomer : Form
    {
        public UpdateCustomer()
        {
            InitializeComponent();
        }

        private void UpdateCustomer_Load(object sender, EventArgs e)
        {
            Loading();
        }

        private void Loading()
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

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtID.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtPass.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtName.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtAddress.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            txtEmail.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            txtPhone.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            txtStatus.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
            txtAccumulation.Text = dataGridView1.Rows[e.RowIndex].Cells[7].Value.ToString();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Cancel();
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

        private void btnHome_Click(object sender, EventArgs e)
        {
            this.Hide();
            Home frmHome = new Home();
            frmHome.ShowDialog();
            this.Close();
        }

        private void btnManageCus_Click(object sender, EventArgs e)
        {
            this.Hide();
            ManageCustomers frmManageCus = new ManageCustomers();
            frmManageCus.ShowDialog();
            this.Close();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            this.Hide();
            DeleteCustomers frmInsert = new DeleteCustomers();
            frmInsert.ShowDialog();
            this.Close();
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            this.Hide();
            InsertCustomer frmInsert = new InsertCustomer();
            frmInsert.ShowDialog();
            this.Close();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            string id, pass, name, address, email, phone, status;
            int accumulation;
            id = txtID.Text;
            pass = txtPass.Text;
            name = txtName.Text;
            address = txtAddress.Text;
            email = txtEmail.Text;
            phone = txtPhone.Text;
            status = txtStatus.Text;
            accumulation = Convert.ToInt32(txtAccumulation.Text);

            int RowsOfNumber = 0;
            try
            {
                CustomerBUS cus = new CustomerBUS();
                RowsOfNumber = cus.UpdateCustomer(id, pass, name, address, email, phone, status, accumulation);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi " + ex.Message, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            if (RowsOfNumber != 0)
            {
                MessageBox.Show("Bạn vừa Sửa thành công nhân viên có mã: " + txtID.Text, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                Loading();
            }
        }
    }
}
