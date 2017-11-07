using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;
using System.Data.SqlClient;
using DAO;
using System.Windows.Forms;

namespace BUS
{
    public class CustomerBUS
    {
        public List<Customer> GetData()
        {
            try
            {
                return (new CustomerDAO().GetData());
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int InsertCustomer(string id, string pass, string name, string address, string email, string phone, string status, int accumulation)
        {
            try
            {
                return (new CustomerDAO().InsertCustomer( id, pass, name, address, email, phone, status, accumulation));
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int DeleteCustomer(string id)
        {
            try
            {
                return (new CustomerDAO().DeleteCustomer(id));
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int UpdateCustomer(string id, string pass, string name, string address, string email, string phone, string status, int accumulation)
        {
            try
            {
                return (new CustomerDAO().UpdateCustomer(id, pass, name, address, email, phone, status, accumulation));
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
