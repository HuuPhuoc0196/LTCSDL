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
    public partial class Select : Form
    {
        private SqlConnection cn = null;
        String sqlSelect = "";

        public Select()
        {
            InitializeComponent();
        }

        private void Select_Load(object sender, EventArgs e)
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

        private void btnSelect_Click(object sender, EventArgs e)
        {
            String input = txtInput.Text;
            SqlCommand cmd;
            int numberOfRosw = 0;
            Connect();
            if (rdID.Checked)
            {
                cmd = new SqlCommand("usp_SelectNhanVienID", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@id", Convert.ToInt32(input)));
            }
            else if (rdFirsName.Checked)
            {
                cmd = new SqlCommand("usp_SelectNhanVienHo", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@firsName", input));
            }
            else
            {
                cmd = new SqlCommand("usp_SelectNhanVienTen", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@lastName", input));
            }

            try
            {
                numberOfRosw = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Thông báo");
            }
            finally
            {
                DisConnect();
                txtInput.Text = "";
            }
        }


    }
}
