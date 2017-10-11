using DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class CustomerDAO : DataProvider
    {
        public List<Customer> GetData()
        {
            Connect();
            List<Customer> list = new List<Customer>();
            string sql = "SELECT * FROM KHACHHANG";
            try
            {
                SqlDataReader dr = ExecuteReader(sql);
                string id, pass, name, address, email, phone, status;
                int cumulative;
                while (dr.Read())
                {
                    if (dr["MaKhachHang"] != DBNull.Value) id = dr.GetString(0); else id = "NULL";
                    if (dr["MatKhau"] != DBNull.Value) pass = dr.GetString(1); else pass = "NULL";
                    if (dr["HoTen"] != DBNull.Value) name = dr.GetString(2); else name = "NULL";
                    if (dr["DiaChi"] != DBNull.Value) address = dr.GetString(3); else address = "NULL";
                    if (dr["Email"] != DBNull.Value) email = dr.GetString(4); else email = "NULL";
                    if (dr["DienThoai"] != DBNull.Value) phone = dr.GetString(5); else phone = "NULL";
                    if (dr["TinhTrang"] != DBNull.Value) status = dr.GetString(6); else status = "NULL";
                    if (dr["DiemTichLuy"] != DBNull.Value) cumulative = dr.GetInt32(7); else cumulative = 0;
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
                DisConnect();
            }
        }
    }
}
