using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Entidades;
using System.Configuration;

namespace Datos
{
    class CarpetaDatos
    {

        ConexionBD miConexion = new ConexionBD();
        Carpeta miCarpeta = new Carpeta();


        //Creacion de carpeta:
        public void CrearNuevaCarpeta(Carpeta carpeta)
        {
            if (miConexion.conectar())
            {
                SqlParameter parametroNombre = new SqlParameter("@NOMBRE", tarea.Nombre);
                SqlParameter parametroIdUsuario = new SqlParameter("@ID_USUARIO", tarea.IdUsuario);
                SqlParameter parametroDescripcion = new SqlParameter("@DESCRIPCION", tarea.Descripcion);

                SqlCommand miComando = new SqlCommand("p_CrearCarpeta", miConexion.Sqlconn);
                miComando.CommandType = CommandType.StoredProcedure;
                miComando.Parameters.Add(parametroNombre);
                miComando.Parameters.Add(parametroIdUsuario);
                miComando.Parameters.Add(parametroDescripcion);
                miComando.ExecuteNonQuery();
            }
            miConexion.Sqlconn.Close();
        }




    }
}
