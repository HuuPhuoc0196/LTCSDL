using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using DAO;

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
        }
    }
}
