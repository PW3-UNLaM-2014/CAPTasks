using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos;
using Entidades;
using System.Data;

namespace Negocio
{
   
    public class UsuarioServicios
    {
        UsuarioDatos ud = new UsuarioDatos();

        //METODOS:
        public void CrearNuevoUsuario(Usuario usuario)
        {
            ud.CrearNuevoUsuario(usuario);
        }

        public bool ActivarUsuario(string codAct)
        {
            return ud.ActivarUsuario(codAct);
        }

        public List<Usuario> VerificarEmail(string email)
        {
            return ud.VerificarEmail(email);
        }

        //public void CrearCarpetaGeneral(int idUsuario,string nombre, string descripcion)
        //{
        //    ud.CrearCarpetaGeneral(idUsuario,nombre, descripcion);
        //}
       

    }
}
