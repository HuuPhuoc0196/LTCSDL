using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace LINQ2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            using (var db = new QLBanHangEntities())
            {
                var Customers = from cus in db.KhachHangs
                                orderby cus.TenKH
                                select cus;
                dataGridView1.DataSource = Customers.ToList();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string id = textBox1.Text.Trim();
            using (var db = new QLBanHangEntities())
            {
                KhachHang CusToDelete = null;
                try
                {
                    CusToDelete = (from cus in db.KhachHangs
                                   where cus.MaKH == id
                                   select cus).Single();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Không tìm thấy mã khách hàng\n" + ex.Message, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                if (CusToDelete != null)
                {
                    db.KhachHangs.DeleteObject(CusToDelete);
                    try
                    {
                        db.SaveChanges();
                        MessageBox.Show("Xóa thành công một khách hàng có mã : " + id, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        Form1_Load(sender, e);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Lỗi không thể xóa\n" + ex.Message);
                    }
                }

            }
        }
    }
}
