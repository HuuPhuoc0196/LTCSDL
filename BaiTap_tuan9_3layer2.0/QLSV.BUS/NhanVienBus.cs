using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using QLNV.DAO;
using QLNV.DTO;

namespace QLNV.BUS
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

        public int Update(int id, string ho, string ten, string diaChi, string phone)
        {
            try
            {
                return (new NhanVienDAO().Update(id, ho, ten, diaChi, phone));
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (IndexOutOfRangeException ex)
            {
                throw ex;
            }

        }
    }
}
