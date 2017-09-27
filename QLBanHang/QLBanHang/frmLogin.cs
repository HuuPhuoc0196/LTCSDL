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

namespace QLBanHang
{
    public partial class frmLogin : Form
    {
        private SqlConnection cn = null;
        private String Strcn = "";
        public frmLogin()
        {
            InitializeComponent();
        }

        private void rdSQL_CheckedChanged(object sender, EventArgs e)
        {
            txtUser.Enabled = true;
            txtPass.Enabled = true;
        }

        private void rdWindows_CheckedChanged(object sender, EventArgs e)
        {
            txtUser.Enabled = false;
            txtPass.Enabled = false;
        }

        private void frmLogin_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection();
        }

        private void Connect()
        {
            String serverName, database, windows, user, pass;
            serverName = "Server = " + txtServer.Text.Trim() + ";";
            database = "Database = " + txtDatabase.Text.Trim() + ";";
            windows = "Integrated security = true;";
            user = "User id = " + txtUser.Text.Trim() + ";";
            pass = "Password = " + txtPass.Text.Trim() + ";";
            Strcn = serverName + database;
            if (rdWindows.Checked)
                Strcn += windows;
            else
                Strcn = Strcn + user + pass;
            cn.ConnectionString = Strcn;

            try
            {
                if (cn != null && cn.State != ConnectionState.Open)
                {
                    cn.Open();
                    frmMain f = new frmMain();
                    this.Hide();
                    f.Show();
                }
            }
            catch (InvalidOperationException ex)
            {
                MessageBox.Show("Nguồn dữ liệu hoặc máy chủ không chính xác \n\n" + ex.Message);
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Đã xảy ra lỗi khi mở kết nối \n\n" + ex.Message);
            }
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            
            if (txtServer.Text == "")
            {
                MessageBox.Show("Server Name không được để trống", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (txtDatabase.Text == "")
            {
                MessageBox.Show("Database Name không được để trống", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else if (rdSQL.Checked == true && txtUser.Text == "")
            {
                MessageBox.Show("User Name không được để trống", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            Connect();
        }

        private void DisConnect()
        {
            if (cn != null && cn.State != ConnectionState.Closed)
            {
                cn.Close();
            }
        }

        private void btnDisConnect_Click(object sender, EventArgs e)
        {
            DisConnect();
        }
    }
}
