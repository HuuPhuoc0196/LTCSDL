using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace BaiTap_Buoi3
{
    public partial class Form1 : Form
    {
        private SqlConnection cn = null;
        DataSet dataset = null;
        String sqlSelect;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            String cnStr = "Server = .; Database = QLBanHang; Integrated Security = true;";
            cn = new SqlConnection(cnStr);
            sqlSelect = "SELECT * FROM LoaiSP";
           // dgvShow.DataSource = GetDataSet(sql).Tables[0];
            dgvShow.DataSource = GetData(sqlSelect);
        }
        private void Connect()
        {
            if (cn != null && cn.State != ConnectionState.Open)
                cn.Open();
        }

        private void DisConnect()
        {
            if (cn != null && cn.State != ConnectionState.Closed)
                cn.Close();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            String sql = "DELETE FROM LoaiSP WHERE MaLoaiSP = '" + txtID.Text.Trim() + "'";
            Connect();
            SqlCommand cmd = new SqlCommand(sql, cn);
            int numberOfRosw = 0;
            try
            {
                numberOfRosw = cmd.ExecuteNonQuery();

                dgvShow.DataSource = GetData(sqlSelect);
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
                txtID.Text = txtName.Text = "";
            }
            if(numberOfRosw != 0)
                MessageBox.Show("Xóa thành công \n\nSố dòng đã xóa là: " + numberOfRosw.ToString() , "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
                MessageBox.Show("Mã Loại không đúng!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            txtID.Text = txtName.Text = "";
        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            String sql = "INSERT INTO LoaiSP VALUES ('" + txtID.Text.Trim() + "', N'" + txtName.Text.Trim() + "')";
            Connect();
            SqlCommand cmd = new SqlCommand(sql, cn);
            int numberOfRosw = 0;
            try
            {
                numberOfRosw = cmd.ExecuteNonQuery();
                dgvShow.DataSource = GetData(sqlSelect);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi. \n\n" + ex.Message, "Thông báo");
            }
            finally
            {
                DisConnect();
                txtID.Text = txtName.Text = "";
            }
            if (numberOfRosw != 0)
                MessageBox.Show("Thêm loại sản phẩm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
                MessageBox.Show("Thêm khong thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            txtID.Text = txtName.Text = "";
        }

        private DataSet GetDataSet(String sql)
        {
            SqlCommand cmd = new SqlCommand(sql,cn);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds);
            return ds;
        }

        private List<Object> GetData(String sql)
        {
            Connect();

            List<Object> list = new List<Object>();
            int maSP;
            String tenSP;
            try
            {
                SqlCommand cmd = new SqlCommand(sql, cn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    maSP = dr.GetInt32(0);
                    tenSP = dr.GetString(1);

                    var pro = new
                    {
                        MaSanPham = maSP,
                        TenSanPham = tenSP
                    };
                    list.Add(pro);
                }
                dr.Close();
            }
            catch (SqlException ex) // Internet => Exception
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                DisConnect();
            }
            return list;
        }

    }
}
