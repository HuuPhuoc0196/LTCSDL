using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace EmployeeManager
{
    public partial class frmManager : Form
    {
        public frmManager()
        {
            InitializeComponent();
        }

        private void frmManager_Load(object sender, EventArgs e)
        {
            using (var db = new ManagerContext())
            {
                var query = from b in db.Department
                            select b;
                dataGridView1.DataSource = query.ToList();
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            using (var db = new ManagerContext())
            {
                var dept = new Department()
                {
                    ID = 1,
                    Name = "Phong NS"
                };

                db.Department.Add(dept);
                db.SaveChanges();
                frmManager_Load(sender, e);
            }
        }
    }
}
