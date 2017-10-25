using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using QL.DTO;
using System.Data;

namespace QL.DAO
{
    public class NhanVienDAO : DataProvider
    {
        public List<NhanVien> GetData()
        {
            Connect();
            List<NhanVien> list = new List<NhanVien>();
            string sql = "SELECT * FROM Nhanvien";
            try
            {
                SqlDataReader dr = ExecuteReader(sql);
                int maNV;
                string ho, ten, diaChi, dienThoai;
                while (dr.Read())
                {
                    maNV = dr.GetInt32(0);
                    ho = dr.GetString(1);
                    ten = dr.GetString(2);
                    diaChi = dr.GetString(3);
                    dienThoai = dr.GetString(4);
                    NhanVien nv = new NhanVien(maNV, ho, ten, diaChi, dienThoai);
                    list.Add(nv);
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

        public int Delete(int id)
        {
            string sql = "usp_DeleteEmployee";
            CommandType type = CommandType.StoredProcedure;

            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("id", id));

            try
            {
                return (ExecuteNonQuery(sql, parameters, type));
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch(IndexOutOfRangeException ex)
            {
                throw ex;
            }
        }
    }
}
