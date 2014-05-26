using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace CAPTasks.Presentacion
{
    public partial class CrearCarpeta : System.Web.UI.Page
    {
        CarpetaServicios cs = new CarpetaServicios();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardarCarpeta_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int idUsuario = Convert.ToInt32(Session["IdUsuario"]);
                string nombre = txtNombre.Text;
                string descripcion = txtDescripcion.Text;
                Carpeta carpeta;
                carpeta = cs.BuscarCarpetaNombre(nombre);
                if (txtNombre.Text == carpeta.Nombre)
                {
                    lblError.Text = "No se puede crear carpeta con igual nombre";
                }
                else
                {
                    cs.CrearNuevaCarpeta(idUsuario, nombre, descripcion);
                    Response.Redirect("~/Presentacion/Home.aspx");
                }
            }
            else
            {
                lblError.Text = "No se puede crear la carpeta, intentelo mas tarde";
            }
        }

        protected void btnCancelarCarpeta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Presentacion/Home.aspx");
        }
    }
}