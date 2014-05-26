﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace Datos
{
   public class ConexionBD
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

           if (sqlconn == null)
               sqlconn = new SqlConnection(conexion);

           if (sqlconn.State == ConnectionState.Closed)
               sqlconn.Open();

           return (sqlconn.State == ConnectionState.Open);
       }

       public String cadenaDeConexion()
       {
           SqlConnectionStringBuilder miConexion = new SqlConnectionStringBuilder();
           miConexion.DataSource = "PAULITTA-PC\\SQLEXPRESS"; 
           miConexion.InitialCatalog = "CAPTasks";
           miConexion.IntegratedSecurity = true;
           return miConexion.ConnectionString;
       }
   }
}