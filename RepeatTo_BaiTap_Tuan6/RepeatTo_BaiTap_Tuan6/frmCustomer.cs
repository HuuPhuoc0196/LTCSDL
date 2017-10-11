using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;

namespace RepeatTo_BaiTap_Tuan6
{
    public partial class frmCustomer : Form
    {
        private SqlConnection cnn = null;
        private string sqlSelect = "";
        public frmCustomer()
        {
            InitializeComponent();
        }

        private void frmCustomer_Load(object sender, EventArgs e)
        {
            string cnStr = ConfigurationManager.ConnectionStrings["CustomerConnectString"].ConnectionString;
            cnn = new SqlConnection(cnStr);
            sqlSelect = "SELECT * FROM KHACHHANG";
            dgvCustomer.DataSource = new DataCustomer().GetData(cnn, sqlSelect);
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            string id, pass, name, address, email, phone, status;
            id = pass = name = address = email = phone = status = "NULL";
            int cumulative = 0;
            Connection.Connect(cnn);

            if (txtID.Text == "" || txtID.Text.Length > 10)
            {
                MessageBox.Show("ID không được phép rỗng or lớn hơn 10 ký tự", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else id = txtID.Text;
            if (txtPass.Text == "" || txtPass.Text.Length > 50)
            {
                MessageBox.Show("Password không được phép rỗng or lớn hơn 50 ký tự", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else pass = txtPass.Text;
            if (txtName.Text != "") name = txtName.Text;
            if (txtAddress.Text != "") address = txtAddress.Text;
            if (txtEmail.Text != "") email = txtEmail.Text;
            if (txtPhone.Text != "") phone = txtPhone.Text;
            if (txtStatus.Text != "") status = txtStatus.Text;
            if (txtCumulation.Text != "") cumulative = Convert.ToInt32(txtCumulation.Text);

            SqlCommand cmd = new SqlCommand("usp_AddCustomer", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", id));
            cmd.Parameters.Add(new SqlParameter("@pass", pass));
            cmd.Parameters.Add(new SqlParameter("@name", name));
            cmd.Parameters.Add(new SqlParameter("@address", address));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@phone", phone));
            cmd.Parameters.Add(new SqlParameter("@status", status));
            cmd.Parameters.Add(new SqlParameter("@cumulation", cumulative));

            try
            {
                cmd.ExecuteNonQuery();
                MessageBox.Show("Thêm thành công một khách hàng", "Thông báo");
                dgvCustomer.DataSource = new DataCustomer().GetData(cnn, sqlSelect);
            }
            catch(SqlException ex)
            {
                MessageBox.Show("Mã khách hàng đã tồn tại vui lòng chọn mã khác \n\n" + ex.Message);
            }
            finally
            {
                Connection.DisConnect(cnn);
                txtID.Text = "";
                txtPass.Text = "";
                txtName.Text = "";
                txtAddress.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtStatus.Text = "";
                txtCumulation.Text = "";
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            Connection.Connect(cnn);
            string id;
            if (txtID.Text == "" || txtID.Text.Length > 10)
            {
                MessageBox.Show("ID không hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else id = txtID.Text;

            SqlCommand cmd = new SqlCommand("usp_DeleteCustomer", cnn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", id));
            int numberOfRow = 0;
            try
            {
                numberOfRow = cmd.ExecuteNonQuery();
                if(numberOfRow != 0)
                    MessageBox.Show("Xóa thành công một khách hàng", "Thông báo");
                else
                    MessageBox.Show("Mã khách hàng không tồn tại!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                dgvCustomer.DataSource = new DataCustomer().GetData(cnn, sqlSelect);
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Không tìm thấy mã khách hàng \n\n" + ex.Message);
            }
            finally
            {
                Connection.DisConnect(cnn);
                txtID.Text = "";
                txtPass.Text = "";
                txtName.Text = "";
                txtAddress.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
                txtStatus.Text = "";
                txtCumulation.Text = "";
            }
        }
    }
}
