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

    public class TareaDatos
    {
        ConexionBD miConexion = new ConexionBD();
        Tarea miTarea = new Tarea();


        //Creacion de tarea:
        public void CrearNuevaTarea(Tarea tarea)
        {
            if (miConexion.conectar())
            {
                SqlParameter parametroNombre = new SqlParameter("@NOMBRE", tarea.Nombre);
                SqlParameter parametroIdCarpeta = new SqlParameter("@ID_CARPETA", tarea.IdCarpeta);
                SqlParameter parametroIdUsuario = new SqlParameter("@ID_USUARIO", tarea.IdUsuario);
                SqlParameter parametroDescripcion = new SqlParameter("@DESCRIPCION", tarea.Descripcion);
                SqlParameter parametroFecha = new SqlParameter("@FECHA", tarea.Fecha);
                SqlParameter parametroPrioridad = new SqlParameter("@PRIORIDAD", tarea.Prioridad);

                SqlCommand miComando = new SqlCommand("p_CrearTarea", miConexion.Sqlconn);
                miComando.CommandType = CommandType.StoredProcedure;
                miComando.Parameters.Add(parametroNombre);
                miComando.Parameters.Add(parametroIdCarpeta);
                miComando.Parameters.Add(parametroIdUsuario);
                miComando.Parameters.Add(parametroDescripcion);
                miComando.Parameters.Add(parametroFecha);
                miComando.Parameters.Add(parametroPrioridad);
                miComando.ExecuteNonQuery();
            }
            miConexion.Sqlconn.Close();
        }


    }
}
