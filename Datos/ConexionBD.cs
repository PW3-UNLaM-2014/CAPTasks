using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;


namespace Datos
{
    class ConexionBD
    {
        SqlConnection sqlconn;
        public SqlConnection Sqlconn
        {
            get { return sqlconn; }
            set { sqlconn = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            conectar();
        }
        public bool conectar()
        {
            string conexion = cadenaDeConexion();
            sqlconn = new SqlConnection(conexion);
            sqlconn.Open();
            return (sqlconn.State == ConnectionState.Open);
        }
        public String cadenaDeConexion()
        {
            SqlConnectionStringBuilder miConexion = new SqlConnectionStringBuilder();
            miConexion.DataSource = "CECILIA\\SQLEXPRESS"; // PONER EL NOMBRE DEL SERVIDOR PROPIO
            miConexion.InitialCatalog = " ";//PONER NOMBRE DE LA BD!!!
            miConexion.IntegratedSecurity = true;
            return miConexion.ConnectionString;
        }
    }
}
