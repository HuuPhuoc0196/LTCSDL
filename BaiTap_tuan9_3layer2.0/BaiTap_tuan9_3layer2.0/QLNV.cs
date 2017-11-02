using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using QLNV.BUS;
using System.Data.SqlClient;
namespace BaiTap_tuan9_3layer2._0
{
    public partial class QLNV : Form
    {
        public QLNV()
        {
            InitializeComponent();
        }

        private void QLSV_Load(object sender, EventArgs e)
        {
            try
            {
                dgvShow.DataSource = new NhanVienBUS().GetData();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("...\n\n" + ex.Message, "Thông báo");
            }
        }

        private void dgvShow_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
                int id = (int)dgvShow.Rows[e.RowIndex].Cells["MaNV"].Value;
                int rowsOfColumn = new NhanVienBUS().Delete(id);
                MessageBox.Show("Xóa thành công " + rowsOfColumn + " Nhân viên");
                try
                {
                    dgvShow.DataSource = new NhanVienBUS().GetData();
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("...\n\n" + ex.Message, "Thông báo");
                }
            }

            if (e.ColumnIndex == 1)
            {
                int id = (int)dgvShow.Rows[e.RowIndex].Cells["MaNV"].Value;
                string ho = dgvShow.Rows[e.RowIndex].Cells[3].Value.ToString();
                string ten = dgvShow.Rows[e.RowIndex].Cells[4].Value.ToString();
                string diaChi = dgvShow.Rows[e.RowIndex].Cells[5].Value.ToString();
                string phone = dgvShow.Rows[e.RowIndex].Cells[6].Value.ToString();
                int rowsOfColumn = new NhanVienBUS().Update(id,ho, ten, diaChi, phone);
                MessageBox.Show("Sửa thành công " + rowsOfColumn + " Nhân viên");
                try
                {
                    dgvShow.DataSource = new NhanVienBUS().GetData();
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("...\n\n" + ex.Message, "Thông báo");
                }
            }
        }
    }
}
