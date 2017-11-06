using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DTO;
using System.Configuration;

namespace DAO
{
    public class DataProvider
    {
        private SqlConnection cn = null;

        public DataProvider()
        {
            string strcn = ConfigurationManager.ConnectionStrings["ConnectionString_OnlineShop"].ConnectionString;
            cn = new SqlConnection(strcn);
        }

        public void Connet()
        {
            try
            {
                if (cn != null && cn.State != ConnectionState.Open)
                {
                    cn.Open();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (InvalidOperationException ex)
            {
                throw ex;
            }
            catch (ConfigurationErrorsException ex)
            {
                throw ex;
            }
        }

        public void DisConnet()
        {
            if (cn != null && cn.State != ConnectionState.Closed)
            {
                cn.Close();
            }
        }

        public SqlDataReader ExecuteReader(string sql)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(sql, cn);
                return cmd.ExecuteReader();
            }
            catch (InvalidCastException ex)
            {
                throw ex;
            }
            catch (SqlException ex)
            {

                throw ex;
            }
            catch (InvalidOperationException ex)
            {
                throw ex;
            }
        }

        public int ExecuteNonQuery(string sql, List<SqlParameter> parameters, CommandType type)
        {
            SqlCommand cmd = new SqlCommand(sql, cn);
            cmd.CommandType = type;

            if (parameters != null)
            {
                foreach (SqlParameter par in parameters)
                {
                    cmd.Parameters.Add(par);
                }
            }
            try
            {
                return cmd.ExecuteNonQuery();
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
