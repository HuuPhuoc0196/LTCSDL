using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using QL.DAO;
using QL.DTO;

namespace QL.BUS
{
    public class NhanVienBUS
    {
        public List<NhanVien> GetData()
        {
            try
            {
                return (new NhanVienDAO().GetData());
            }
            catch (SqlException ex)
            {

                throw ex;
            }
        }

        public int Delete(int id)
        {
            try
            {
                return (new NhanVienDAO().Delete(id));
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
