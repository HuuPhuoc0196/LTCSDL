using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace RepeatTo_BaiTap_Tuan6
{
    public class DataCustomer
    {
        public List<Customer> GetData(SqlConnection cnn, string sql)
        {
            Connection.Connect(cnn);
            List<Customer> list = new List<Customer>();
            try
            {
                SqlCommand cmd = new SqlCommand(sql, cnn);
                SqlDataReader dr = cmd.ExecuteReader();
                string id, pass, name, address, email, phone, status;
                int cumulative;
                while (dr.Read())
                {
                    if (dr["MaKhachHang"] != DBNull.Value) id = (string)dr["MaKhachHang"]; else id = "NULL";
                    if (dr["MatKhau"] != DBNull.Value) pass = (string)dr["MatKhau"]; else pass = "NULL";
                    if (dr["HoTen"] != DBNull.Value) name = (string)dr["HoTen"]; else name = "NULL";
                    if (dr["DiaChi"] != DBNull.Value) address = (string)dr["DiaChi"]; else address = "NULL";
                    if (dr["Email"] != DBNull.Value) email = (string)dr["Email"]; else email = "NULL";
                    if (dr["DienThoai"] != DBNull.Value) phone = (string)dr["DienThoai"]; else phone = "NULL";
                    if (dr["TinhTrang"] != DBNull.Value) status = (string)dr["TinhTrang"]; else status = "NULL";
                    if (dr["DiemTichLuy"] != DBNull.Value) cumulative = (int)dr["DiemTichLuy"]; else cumulative = 0;
                    Customer cus = new Customer(id, pass, name, address, email, phone, status, cumulative);
                    list.Add(cus);
                }
                dr.Close();
                return list;
            }
            catch (SqlException ex)
            {

                throw ex;
            }
            finally
            {
                Connection.DisConnect(cnn);
            }

            return list;
        }
    }
}
