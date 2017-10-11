using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace BaiTap_Buoi_4
{
    public partial class Form1 : Form
    {
        private SqlConnection cn = null;
        String sqlSelect = "";
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            String cnStr = "Server = .; Database = QLBanHang; Integrated Security = true;";
            cn = new SqlConnection(cnStr);
            sqlSelect = "SELECT * FROM Nhanvien";
            dgvShow.DataSource = GetDataSet(sqlSelect).Tables[0];
        }

        private void Connect()
        {
            try
            {
                if (cn != null && cn.State != ConnectionState.Open)
                {
                    cn.Open();
                }
            }
            catch (InvalidOperationException ex)
            {
                MessageBox.Show("Máy chủ không hộp lệ! \n\n" + ex.Message);
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Đã xảy ra lỗi khi mở kết nối! \n\n" + ex.Message);
            }

        }

        private void DisConnect()
        {
            if (cn != null && cn.State != ConnectionState.Closed)
            {
                cn.Close();
            }
        }

        private DataSet GetDataSet(String sql)
        {
            SqlCommand cmd = new SqlCommand(sql, cn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            return ds;
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtMa.Text);
            Connect();
            SqlCommand cmd = new SqlCommand("dbo.usp_DeleteNhanVien", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@id", id));

            int numberOfRosw = 0;
            try
            {
                numberOfRosw = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Không thể xóa dòng đang bị khóa (locked). \n\n" + ex.Message, "Thông báo");
            }
            catch (InvalidOperationException ex)
            {
                MessageBox.Show("Kết nối đã đóng hoặc mất kết nối. \n\n" + ex.Message, "Thông báo");
            }
            finally
            {
                DisConnect();
                txtMa.Text = txtHo.Text = txtTen.Text = txtDiaChi.Text = txtSDT.Text = "";
            }
            if (numberOfRosw != 0)
                MessageBox.Show("Xóa thành công \n\nSố dòng đã xóa là: " + numberOfRosw.ToString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
                MessageBox.Show("Mã Loại không đúng!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            dgvShow.DataSource = GetDataSet(sqlSelect).Tables[0];
        }

        private void dgvShow_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvShow.SelectedRows.Count == 0)
                return;
            txtMa.Text = dgvShow.SelectedRows[0].Cells["MaNV"].Value.ToString();
            txtHo.Text = dgvShow.SelectedRows[0].Cells["HoNV"].Value.ToString();
            txtTen.Text = dgvShow.SelectedRows[0].Cells["Ten"].Value.ToString();
            txtDiaChi.Text = dgvShow.SelectedRows[0].Cells["Diachi"].Value.ToString();
            txtSDT.Text = dgvShow.SelectedRows[0].Cells["Dienthoai"].Value.ToString();
        }

    }
}
