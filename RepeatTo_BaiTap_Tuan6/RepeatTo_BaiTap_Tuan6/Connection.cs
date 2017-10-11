using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace RepeatTo_BaiTap_Tuan6
{
    public class Connection
    {
        public static void Connect(SqlConnection cnn)
        {
            try
            {
                if (cnn != null && cnn.State != System.Data.ConnectionState.Open)
                    cnn.Open();
            }
            catch (InvalidOperationException ex)
            {
                throw ex;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public static void DisConnect(SqlConnection cnn)
        {
            if (cnn != null && cnn.State != System.Data.ConnectionState.Closed)
                cnn.Close();
        }

    }
}
