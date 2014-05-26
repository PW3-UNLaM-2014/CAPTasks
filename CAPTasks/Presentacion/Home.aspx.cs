using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;

namespace CAPTasks.Presentacion
{
    public partial class Home1 : System.Web.UI.Page
    {
        CarpetaServicios cs = new CarpetaServicios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargaTabla();
                CargaCarpetas();
                
            }
        }

        public void CargaTabla()
        {

            int idUsuario;
            idUsuario = Convert.ToInt32(Session["IdUsuario"]);

            List<LecturaTarea> misTareas = new List<LecturaTarea>();
            LecturaTareaServicios lts = new LecturaTareaServicios();

            misTareas = lts.ListarMisTareas(idUsuario);

            gvListaTareas.DataSource = misTareas;
            gvListaTareas.DataBind();
        }

        public void CargaCarpetas()
        {
            int idUsuario;
            idUsuario = Convert.ToInt32(Session["IdUsuario"]);
            gvCargarCarpetas(idUsuario);
        }

 

        protected void btnTareasFinalizadas_Click(object sender, EventArgs e)
        {
            if (ckbTareasFinalizadas.Checked == true)
            {
                int idUsuario;
                idUsuario = Convert.ToInt32(Session["IdUsuario"]);

                List<LecturaTarea> todasMisTareas = new List<LecturaTarea>();
                LecturaTareaServicios lts = new LecturaTareaServicios();

                todasMisTareas = lts.ListarTodasMisTareas(idUsuario);

                gvListaTareas.DataSource = todasMisTareas;
                gvListaTareas.DataBind();
            }
            else
            {
                CargaTabla();
            }
        }

        protected void btnCompletar_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            int idTarea = int.Parse(gvListaTareas.DataKeys[row.RowIndex].Value.ToString());

            TareaServicios ts = new TareaServicios();
            ts.CompletoLaTarea(idTarea);
            CargaTabla();
        }


        //PARA CARPETAS:
        private void gvCargarCarpetas(int idBuscar)
        {
            gvCarpetas.DataSource = cs.ListarCarpetas(idBuscar);
            gvCarpetas.DataBind();          
        }

    }
}