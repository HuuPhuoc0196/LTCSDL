using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using System.Data;
using System.Data.SqlClient;

namespace DAO
{
    public class CustomerDAO : DataProvider
    {
        public List<Customer> GetData()
        {
            List<Customer> list = new List<Customer>();
            string sql = "SELECT * FROM KHACHHANG";
            
            Connet();

            try
            {
                SqlDataReader read = ExecuteReader(sql);
                string id, pass, name, address, email, phone, status;
                int accumulation;

                while (read.Read())
                {
                    id = read["MaKhachHang"].ToString();
                    pass = read["MatKhau"].ToString();
                    name = read["HoTen"].ToString() == "" ? "NULL" : read["HoTen"].ToString();
                    address = read["DiaChi"].ToString() == "" ? "NULL" : read["DiaChi"].ToString();
                    email = read["Email"].ToString() == "" ? "NULL" : read["Email"].ToString();
                    phone = read["DienThoai"].ToString() == "" ? "NULL" : read["DienThoai"].ToString();
                    status = read["TinhTrang"].ToString() == "" ? "NULL" : read["TinhTrang"].ToString();
                    accumulation = (int)read["DiemTichLuy"];
                    Customer cus = new Customer(id, pass, name, address, email, phone, status, accumulation);
                    list.Add(cus);
                }
                read.Close();
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
            finally
            {
                DisConnet();
            }
            return list;
        }

        public int InsertCustomer(string id, string pass, string name, string address, string email, string phone, string status, int accumulation)
        {
            string sql = "INSERT INTO KHACHHANG VALUES(@MaKhachHang, @MatKhau, "
                    + "@HoTen, @DiaChi, @Email, @DienThoai, @TinhTrang, @DiemTichLuy )";
            CommandType type = CommandType.Text;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("@MaKhachHang", id));
            parameters.Add(new SqlParameter("@MatKhau", pass));
            parameters.Add(new SqlParameter("@HoTen", name));
            parameters.Add(new SqlParameter("@DiaChi", address));
            parameters.Add(new SqlParameter("@Email", email));
            parameters.Add(new SqlParameter("@DienThoai", phone));
            parameters.Add(new SqlParameter("@TinhTrang", status));
            parameters.Add(new SqlParameter("@DiemTichLuy", accumulation));
            
            Connet();
            try
            {
                return (ExecuteNonQuery(sql, parameters, type));
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (IndexOutOfRangeException ex)
            {
                throw ex;
            }
            finally
            {
                DisConnet();
            }
        }
    }
}
