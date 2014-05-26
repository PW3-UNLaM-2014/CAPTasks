using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace CAPTasks.Presentacion
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idUsuario;
            idUsuario = Convert.ToInt32(Session["IdUsuario"]);

            List<Tarea> misTareas = new List<Tarea>();
            TareaServicios ts = new TareaServicios();

            misTareas = ts.ListarMisTareas(idUsuario);

            gvListaTareas.DataSource = misTareas;
            gvListaTareas.DataBind();

        }

        protected void btnTareasFinalizadas_Click(object sender, EventArgs e)
        {
            if (ckbTareasFinalizadas.Checked == true)
            {
                int idUsuario;
                idUsuario = Convert.ToInt32(Session["IdUsuario"]);

                List<Tarea> todasMisTareas = new List<Tarea>();
                TareaServicios ts = new TareaServicios();

                todasMisTareas = ts.ListarTodasMisTareas(idUsuario);

                gvListaTareas.DataSource = todasMisTareas;
                gvListaTareas.DataBind();
            }
            else
            {
                int idUsuario;
                idUsuario = Convert.ToInt32(Session["IdUsuario"]);

                List<Tarea> misTareas = new List<Tarea>();
                TareaServicios ts = new TareaServicios();

                misTareas = ts.ListarMisTareas(idUsuario);

                gvListaTareas.DataSource = misTareas;
                gvListaTareas.DataBind();
            }
        }


    }
}