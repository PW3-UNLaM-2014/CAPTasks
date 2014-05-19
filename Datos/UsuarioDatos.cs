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
    
    public class UsuarioDatos
    {
        ConexionBD miConexion = new ConexionBD();
        
        //Metodos
        public void CrearNuevoUsuario(Usuario usuario)
        {
            if(miConexion.conectar())
            {
            SqlParameter parametroNombre = new SqlParameter("@NOMBRE",usuario.Nombre);
            SqlParameter parametroApellido = new SqlParameter("@APELLIDO",usuario.Apellido);
            SqlParameter parametroEmail = new SqlParameter("@EMAIL",usuario.Email);
            SqlParameter parametroContrasenia = new SqlParameter("@CONTRASENIA",usuario.Contrasenia);
            SqlParameter parametroCodigoActivacion = new SqlParameter("@CODIGOACTIVACION",usuario.Email);

            SqlCommand miComando = new SqlCommand("p_CrearUsuario",miConexion.Sqlconn);
            miComando.CommandType = CommandType.StoredProcedure;
            miComando.Parameters.Add(parametroNombre);
            miComando.Parameters.Add(parametroApellido);
            miComando.Parameters.Add(parametroEmail);
            miComando.Parameters.Add(parametroContrasenia);
            miComando.Parameters.Add(parametroCodigoActivacion);
            miComando.ExecuteNonQuery();         
            }
         miConexion.Sqlconn.Close();
        }
    }
}
