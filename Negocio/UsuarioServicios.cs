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

        public Usuario TraerDatosUsuario(string emailIngresado)
        {

            return ud.TraerDatosUsuario(emailIngresado);
        }

        public void CrearCarpetaGeneral(int id, string nombre, string descripcion)
        {
            ud.CrearCarpetaGeneral(id, nombre, descripcion);
        }

    }
}
