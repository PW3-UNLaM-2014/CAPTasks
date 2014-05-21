using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace CAPTasks.Presentacion
{
    public partial class ConfirmaRegistro : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string codac = Request.QueryString["ActivationCode"];

            UsuarioServicios us = new UsuarioServicios();
            if (us.ActivarUsuario(codac))
            {
                divRegistro.InnerHtml = "<h3>Su cuenta se habilito correctamente. Ingrese al sistema con su correo electronico y contraseña.</h3>";
               //ACA SE DEBERIA CREAR POR DEFECTO LA CARPETA General UNA VEZ QUE SE ACTIVA LA CUENTA:
                //string nombre = "General";
                //string descripcion = "Carpeta creada por defecto para tareas que no se les asocien ninguna carpeta";
                //us.CrearCarpetaDefault(nombre, descripcion);
            }
            else
            {
                divRegistro.InnerHtml = "<h3>No se ha podido habilitar su cuenta, porque ha vencido el plazo de validez del enlace, por favor vuelva a registrarse.</h3>";

            }

        }

    }
}
