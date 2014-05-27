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
    public class LecturaTareaDatos
    {
        ConexionBD miConexion = new ConexionBD();

        public List<LecturaTarea> ListaDeMisTareas(int idUsuario)
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


                List<LecturaTarea> listaTareas = new List<LecturaTarea>();

                foreach (DataRow item in ds.Tables[0].Rows) //Recorro fila de datos
                {
                    var tarea = new LecturaTarea(item);

                    listaTareas.Add(tarea); //Agrego cada tarea a la lista
                }
                return listaTareas;
            }
            else return null;
        }

        public List<LecturaTarea> ListarMisTareasPorCarpeta(int idCarpeta)
        {

            if (miConexion.conectar())
            {
                SqlParameter parametroCarpeta = new SqlParameter("@CARPETAID", idCarpeta);
                SqlCommand miComando = new SqlCommand("p_ListarTareasPorCarpeta", miConexion.Sqlconn);
                miComando.CommandType = CommandType.StoredProcedure;
                miComando.Parameters.Add(parametroCarpeta);

                SqlDataAdapter data = new SqlDataAdapter(); //Comandos de datos y conexión de BD que se usan para rellenar un DataSet
                DataSet ds = new DataSet();
                data.SelectCommand = miComando; //Le paso al objeto del SqlDataAdapter la conexion
                data.Fill(ds); //Rellena el objeto del DataSet


                List<LecturaTarea> listaTareas = new List<LecturaTarea>();

                foreach (DataRow item in ds.Tables[0].Rows) //Recorro fila de datos
                {
                    var tarea = new LecturaTarea(item);

                    listaTareas.Add(tarea); //Agrego cada tarea a la lista
                }
                return listaTareas;
            }
            else return null;
        }

        public List<LecturaTarea> ListaDeTodasMisTareas(int idUsuario)
        {

            if (miConexion.conectar())
            {
                SqlParameter parametroUsuario = new SqlParameter("@USUARIOID", idUsuario);
                SqlCommand miComando = new SqlCommand("p_ListarTodasLasTareas", miConexion.Sqlconn);
                miComando.CommandType = CommandType.StoredProcedure;
                miComando.Parameters.Add(parametroUsuario);

                SqlDataAdapter data = new SqlDataAdapter(); //Comandos de datos y conexión de BD que se usan para rellenar un DataSet
                DataSet ds = new DataSet();
                data.SelectCommand = miComando; //Le paso al objeto del SqlDataAdapter la conexion
                data.Fill(ds); //Rellena el objeto del DataSet


                List<LecturaTarea> listaTareas = new List<LecturaTarea>();

                foreach (DataRow item in ds.Tables[0].Rows) //Recorro fila de datos
                {
                    var tarea = new LecturaTarea(item);

                    listaTareas.Add(tarea); //Agrego cada tarea a la lista
                }
                return listaTareas;
            }
            else return null;
        }

    }
}
