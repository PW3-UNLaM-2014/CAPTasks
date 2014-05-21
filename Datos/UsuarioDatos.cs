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

        //REGISTRACION DE USUARIOS:
        public void CrearNuevoUsuario(Usuario usuario)
        {
            if (miConexion.conectar())
            {
                SqlParameter parametroNombre = new SqlParameter("@NOMBRE", usuario.Nombre);
                SqlParameter parametroApellido = new SqlParameter("@APELLIDO", usuario.Apellido);
                SqlParameter parametroEmail = new SqlParameter("@EMAIL", usuario.Email);
                SqlParameter parametroContrasenia = new SqlParameter("@CONTRASENIA", usuario.Contrasenia);
                SqlParameter parametroCodigoActivacion = new SqlParameter("@CODIGOACTIVACION", usuario.CodigoActivacion);

                SqlCommand miComando = new SqlCommand("p_CrearUsuario", miConexion.Sqlconn);
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

        //ACTIVACION DE REGISTRACION:
        public bool ActivarUsuario(string codac)
        {
            if (miConexion.conectar())
            {
                SqlParameter parametroCodac = new SqlParameter("@CODIGOACTIVACION", codac);
                SqlCommand miComando = new SqlCommand("p_ConfirmaRegistro", miConexion.Sqlconn);
                miComando.CommandType = CommandType.StoredProcedure;
                miComando.Parameters.Add(parametroCodac);
                try
                {
                    miComando.ExecuteNonQuery();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            miConexion.Sqlconn.Close();
            return false;

        }
  
        //VERIFICAR SI YA EXISTE UN USUARIO REGISTRADO ACTIVO CON ESE MAIL EN LA LISTA DE USUARIOS:
        //public List<Usuario> VerificarEmail(string email)
        //{
        //    if (miConexion.conectar())
        //    {
        //        SqlParameter parametroUsuario = new SqlParameter("@EMAIL", email);
        //        SqlCommand miComando = new SqlCommand("p_VerificarEmail", miConexion.Sqlconn);
        //        miComando.CommandType = CommandType.StoredProcedure;
        //        miComando.Parameters.Add(parametroUsuario);

        //        SqlDataAdapter data = new SqlDataAdapter(); //Comandos de datos y conexión de BD que se usan para rellenar un DataSet
        //        DataSet ds = new DataSet();
        //        data.SelectCommand = miComando; //Le paso al objeto del SqlDataAdapter la conexion
        //        data.Fill(ds); //Rellena el objeto del DataSet
        //        List<Usuario> usuarioExistente = new List<Usuario>();
        //        foreach (DataRow item in ds.Tables[0].Rows) //Recorro fila de datos
        //        {
        //            var usuario = new Usuario();
        //            usuarioExistente.Add(usuario);
        //        }
        //        return usuarioExistente;
        //    }
        //    else return null;
        //}
    }
}
