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
    public partial class DeleteCustomers : Form
    {
        public DeleteCustomers()
        {
            InitializeComponent();
        }

        private void DeleteCustomers_Load(object sender, EventArgs e)
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
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (txtID.Text.Trim() == "")
            {
                MessageBox.Show("Mã khách hàng không được trống: " + txtID.Text.Trim(), "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                CustomerBUS cus = new CustomerBUS();
                int RowsOFNumber = cus.DeleteCustomer(txtID.Text.Trim());
                Loading();
                if(RowsOFNumber != 0)
                    MessageBox.Show("Bạn vừa xóa thành công khách hàng có mã: " + txtID.Text.Trim(), "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                else
                    MessageBox.Show("Mã khách hàng: " + txtID.Text.Trim() + " không tồn tại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi " + ex.Message);
            }
        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            this.Hide();
            Home frmHome = new Home();
            frmHome.ShowDialog();
            this.Close();
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

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            this.Hide();
            UpdateCustomer frmInsert = new UpdateCustomer();
            frmInsert.ShowDialog();
            this.Close();
        }
    }
}
