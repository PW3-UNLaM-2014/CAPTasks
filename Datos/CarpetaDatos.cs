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
    public class CarpetaDatos
    {

        ConexionBD miConexion = new ConexionBD();
        Carpeta miCarpeta = new Carpeta();


        //Creacion de carpeta:
        public void CrearNuevaCarpeta(int id, string nombre, string descripcion)
        {
            if (miConexion.conectar())
            {
                SqlParameter parametroIdUsuario = new SqlParameter("@ID_USUARIO", id);
                SqlParameter parametroNombre = new SqlParameter("@NOMBRE",nombre);               
                SqlParameter parametroDescripcion = new SqlParameter("@DESCRIPCION", descripcion);

                SqlCommand miComando = new SqlCommand("p_CrearCarpeta", miConexion.Sqlconn);
                miComando.CommandType = CommandType.StoredProcedure;
                miComando.Parameters.Add(parametroNombre);
                miComando.Parameters.Add(parametroIdUsuario);
                miComando.Parameters.Add(parametroDescripcion);
                miComando.ExecuteNonQuery();
            }
            miConexion.Sqlconn.Close();
        }

        //Listar carpetas del usuario logueado:
        public List<Carpeta> ListarCarpetas(int idUsuario)
        {
            if (miConexion.conectar())
            {
                DataSet ds = new DataSet();
                
                string consulta = "SELECT * FROM Carpetas where IdUsuario=" + idUsuario+"; ";
                SqlDataAdapter data = new SqlDataAdapter(consulta, miConexion.Sqlconn);
                data.Fill(ds);

                List<Carpeta> misCarpetas = new List<Carpeta>();
                foreach (DataRow item in ds.Tables[0].Rows)
                {
                    var carpeta = new Carpeta(item);
                    misCarpetas.Add(carpeta);
                }
                return misCarpetas;
            }
            else return null;
        }

        //LISTAR TAREAS DE LA CARPETA:
        //public List<Tarea> ListarTareas(int idUsuario, int idCarpeta)
        //{
        //    if (miConexion.conectar())
        //    {
        //        DataSet ds = new DataSet();

        //        string consulta = "SELECT * FROM Tareas where IdUsuario=" + idUsuario + "and IdCarpeta ="+idCarpeta+";" ;
        //        SqlDataAdapter data = new SqlDataAdapter(consulta, miConexion.Sqlconn);
        //        data.Fill(ds);

        //        List<Tarea> misTareas = new List<Tarea>();
        //        foreach (DataRow item in ds.Tables[0].Rows)
        //        {
        //            var tarea = new Tarea(item);
        //            misTareas.Add(tarea);
        //        }
        //        return misTareas;
        //    }
        //    else return null;
        //}



    }
}
