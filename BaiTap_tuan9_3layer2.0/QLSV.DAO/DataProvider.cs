using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace QL.DAO
{
    public class DataProvider
    {
        private SqlConnection cnn = null;

        public DataProvider()
        {
            string cnStr = ConfigurationManager.ConnectionStrings["QLBanHang_ConnectionString"].ConnectionString;
            cnn = new SqlConnection(cnStr);

        }

        public void Connect()
        {
            try
            {
                if (cnn != null && cnn.State != System.Data.ConnectionState.Open)
                {
                    cnn.Open();
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
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.CommandType = type;

            //cmd.Parameters.Add(new SqlParameter("id", id));

            if (parameters != null)
            {
                foreach (SqlParameter para in parameters)
                {
                    cmd.Parameters.Add(para);
                }
            }
            try
            {
                return (cmd.ExecuteNonQuery());
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
