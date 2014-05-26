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
            int idUsuario = Convert.ToInt32(Session["IdUsuario"]);
            string nombre = txtNombre.Text;
            string descripcion = txtDescripcion.Text;
            cs.CrearNuevaCarpeta(idUsuario, nombre, descripcion);
            Response.Redirect("~/Presentacion/Home.aspx");
        }

        protected void btnCancelarCarpeta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Presentacion/Home.aspx");
        }
    }
}