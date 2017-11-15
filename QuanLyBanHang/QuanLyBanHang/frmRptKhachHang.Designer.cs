namespace QuanLyBanHang
{
    partial class frmRptKhachHang
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.rpvKhachHang = new Microsoft.Reporting.WinForms.ReportViewer();
            this.SuspendLayout();
            // 
            // rpvKhachHang
            // 
            this.rpvKhachHang.Dock = System.Windows.Forms.DockStyle.Fill;
            this.rpvKhachHang.Location = new System.Drawing.Point(0, 0);
            this.rpvKhachHang.Name = "rpvKhachHang";
            this.rpvKhachHang.Size = new System.Drawing.Size(676, 494);
            this.rpvKhachHang.TabIndex = 0;
            // 
            // frmRptKhachHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(676, 494);
            this.Controls.Add(this.rpvKhachHang);
            this.Name = "frmRptKhachHang";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.frmRptKhachHang_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer rpvKhachHang;
    }
}

