using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace DAO
{
    public class DataProvider
    {
        SqlConnection cnn = null;

        public DataProvider()
        {
            string cnStr = ConfigurationManager.ConnectionStrings["ONLINE_SHOP_ConnectionString"].ConnectionString;
            cnn = new SqlConnection(cnStr);

        }

        public void Connect()
        {
            try
            {
                if(cnn != null && cnn.State != System.Data.ConnectionState.Open)
                {
                    cnn.Open();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch(InvalidOperationException ex)
            {
                throw ex;
            }
            catch(ConfigurationErrorsException ex)
            {
                throw ex;
            }
        }

        public void DisConnect()
        {
            if (cnn != null && cnn.State != System.Data.ConnectionState.Closed)
            {
                cnn.Close();
            }
        }

        public SqlDataReader ExecuteReader(string sql)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(sql, cnn);
                return cmd.ExecuteReader();
            }
            catch(InvalidCastException ex)
            {
                throw ex;
            }
            catch (SqlException ex)
            {
                
                throw ex;
            }
            catch(InvalidOperationException ex)
            {
                throw ex;
            }
        }



    }
}
