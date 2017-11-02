using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using QLNV.DTO;
using System.Data;

namespace QLNV.DAO
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
            Connect();

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
            finally
            {
                DisConnect();
            }
        }

        public int Update(int id, string ho, string ten, string diaChi, string phone)
        {
            string sql = "usp_UpdateEmployee";
            CommandType type = CommandType.StoredProcedure;

            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("id", id));
            parameters.Add(new SqlParameter("ho", ho));
            parameters.Add(new SqlParameter("ten", ten));
            parameters.Add(new SqlParameter("diaChi", diaChi));
            parameters.Add(new SqlParameter("phone", phone));
            Connect();

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
                DisConnect();
            }

        }
    }
}
