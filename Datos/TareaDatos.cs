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


        //REGISTRACION DE USUARIOS:
        public void CrearNuevaTarea(Tarea tarea)
        {
            if (miConexion.conectar())
            {
                SqlParameter parametroNombre = new SqlParameter("@NOMBRE", tarea.Nombre);
                SqlParameter parametroIdCarpeta = new SqlParameter("@ID_CARPETA", tarea.IdCarpeta);
                SqlParameter parametroIdUsuario = new SqlParameter("@ID_USUARIO", tarea.IdUsuario);
                SqlParameter parametroDescripcion = new SqlParameter("@DESCRIPCION", tarea.Descripcion);
                SqlParameter parametroFecha = new SqlParameter("@FECHA", tarea.Fecha);
                SqlParameter parametroPrioridad = new SqlParameter("@DESCRIPCION", tarea.Prioridad);
                SqlParameter parametroEstado = new SqlParameter("@FECHA", tarea.Estado);

                SqlCommand miComando = new SqlCommand("p_CrearTarea", miConexion.Sqlconn);
                miComando.CommandType = CommandType.StoredProcedure;
                miComando.Parameters.Add(parametroNombre);
                miComando.Parameters.Add(parametroIdCarpeta);
                miComando.Parameters.Add(parametroIdUsuario);
                miComando.Parameters.Add(parametroDescripcion);
                miComando.Parameters.Add(parametroFecha);
                miComando.Parameters.Add(parametroPrioridad);
                miComando.Parameters.Add(parametroEstado);
                miComando.ExecuteNonQuery();
            }
            miConexion.Sqlconn.Close();
        }


        public List<Tarea> ListaDeMisTareas(int idUsuario)
        {
            
            if (miConexion.conectar())
            {
                SqlParameter parametroUsuario = new SqlParameter("@USUARIOID", idUsuario);
                SqlCommand miComando = new SqlCommand("p_ListarTareas", miConexion.Sqlconn);
                miComando.CommandType = CommandType.StoredProcedure;
                miComando.Parameters.Add(parametroUsuario);

                SqlDataAdapter data = new SqlDataAdapter(); //Comandos de datos y conexión de BD que se usan para rellenar un DataSet
                DataSet ds = new DataSet();
                data.SelectCommand = miComando; //Le paso al objeto del SqlDataAdapter la conexion
                data.Fill(ds); //Rellena el objeto del DataSet


                List<Tarea> listaTareas = new List<Tarea>();

                foreach (DataRow item in ds.Tables[0].Rows) //Recorro fila de datos
                {
                    var tarea = new Tarea(item);

                    listaTareas.Add(tarea); //Agrego cada tarea a la lista
                }
                return listaTareas;
            }
            else return null;
        }


    }
}
