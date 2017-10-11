namespace BaiTap_Buoi_4
{
    partial class Select
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnSelect = new System.Windows.Forms.Button();
            this.rdLastName = new System.Windows.Forms.RadioButton();
            this.rdFirsName = new System.Windows.Forms.RadioButton();
            this.rdID = new System.Windows.Forms.RadioButton();
            this.txtInput = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvShow = new System.Windows.Forms.DataGridView();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvShow)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnSelect);
            this.groupBox1.Controls.Add(this.rdLastName);
            this.groupBox1.Controls.Add(this.rdFirsName);
            this.groupBox1.Controls.Add(this.rdID);
            this.groupBox1.Controls.Add(this.txtInput);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(29, 26);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(613, 205);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Tìm Kiếm Nhân Viên";
            // 
            // btnSelect
            // 
            this.btnSelect.Location = new System.Drawing.Point(231, 153);
            this.btnSelect.Name = "btnSelect";
            this.btnSelect.Size = new System.Drawing.Size(123, 35);
            this.btnSelect.TabIndex = 5;
            this.btnSelect.Text = "Tìm kiếm";
            this.btnSelect.UseVisualStyleBackColor = true;
            this.btnSelect.Click += new System.EventHandler(this.btnSelect_Click);
            // 
            // rdLastName
            // 
            this.rdLastName.AutoSize = true;
            this.rdLastName.Location = new System.Drawing.Point(397, 107);
            this.rdLastName.Name = "rdLastName";
            this.rdLastName.Size = new System.Drawing.Size(184, 29);
            this.rdLastName.TabIndex = 4;
            this.rdLastName.Text = "Tìm kiếm theo tên";
            this.rdLastName.UseVisualStyleBackColor = true;
            // 
            // rdFirsName
            // 
            this.rdFirsName.AutoSize = true;
            this.rdFirsName.Location = new System.Drawing.Point(212, 107);
            this.rdFirsName.Name = "rdFirsName";
            this.rdFirsName.Size = new System.Drawing.Size(179, 29);
            this.rdFirsName.TabIndex = 3;
            this.rdFirsName.Text = "Tìm kiếm theo họ";
            this.rdFirsName.UseVisualStyleBackColor = true;
            // 
            // rdID
            // 
            this.rdID.AutoSize = true;
            this.rdID.Checked = true;
            this.rdID.Location = new System.Drawing.Point(22, 107);
            this.rdID.Name = "rdID";
            this.rdID.Size = new System.Drawing.Size(184, 29);
            this.rdID.TabIndex = 2;
            this.rdID.TabStop = true;
            this.rdID.Text = "Tìm kiếm theo mã";
            this.rdID.UseVisualStyleBackColor = true;
            // 
            // txtInput
            // 
            this.txtInput.Location = new System.Drawing.Point(88, 49);
            this.txtInput.Name = "txtInput";
            this.txtInput.Size = new System.Drawing.Size(506, 30);
            this.txtInput.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(17, 45);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "Nhập:";
            // 
            // dgvShow
            // 
            this.dgvShow.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvShow.Location = new System.Drawing.Point(29, 262);
            this.dgvShow.Name = "dgvShow";
            this.dgvShow.Size = new System.Drawing.Size(613, 245);
            this.dgvShow.TabIndex = 1;
            // 
            // Select
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(670, 541);
            this.Controls.Add(this.dgvShow);
            this.Controls.Add(this.groupBox1);
            this.Name = "Select";
            this.Text = "Tìm Kiếm";
            this.Load += new System.EventHandler(this.Select_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvShow)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton rdLastName;
        private System.Windows.Forms.RadioButton rdFirsName;
        private System.Windows.Forms.RadioButton rdID;
        private System.Windows.Forms.TextBox txtInput;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnSelect;
        private System.Windows.Forms.DataGridView dgvShow;
    }
}