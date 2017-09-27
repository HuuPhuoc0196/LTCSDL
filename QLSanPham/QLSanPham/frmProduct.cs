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

namespace QLSanPham
{
    public partial class frmProduct : Form
    {
        private SqlConnection cn = null;
        public frmProduct()
        {
            InitializeComponent();
        }

        private void frmProduct_Load(object sender, EventArgs e)
        {
            string cnStr = @"Server = HUUPHUOC\SQLEXPRESS; Database = ONLINE_SHOP; Integrated security = true;";
            cn = new SqlConnection(cnStr);
            dvgProduct.DataSource = GetData();
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

        private List<Object> GetData()
        {
            Connect();

            String sql = "SELECT * FROM SANPHAM WHERE DonGia > 300000";

            List<Object> list = new List<Object>();

            String maSP, tenSP, moTa, tinhTrang, maDanhMuc;
            try
            {
                SqlCommand cmd = new SqlCommand(sql, cn);
                SqlDataReader dr = cmd.ExecuteReader();

                while(dr.Read())
                {
                    maSP = dr.GetString(0);
                    tenSP = dr.GetString(1);
                    moTa = dr.GetString(2);
                    tinhTrang = dr.GetString(7);
                    maDanhMuc = dr.GetString(8);

                    var pro = new
                    {
                        MaSanPham = maSP,
                        TenSanPham = tenSP,
                        MoTa = moTa,
                        TinhTrang = tinhTrang,
                        MaDanhMuc = maSP
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
