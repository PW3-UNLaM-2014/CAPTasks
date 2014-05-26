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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargaTabla();
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

        protected void btnGuardarTarea_Click(object sender, EventArgs e)
        {
            Tarea tarea = new Tarea();
            TareaServicios tareaService = new TareaServicios();

            if (Page.IsValid)
            {

                //tarea.IdCarpeta = nuevaTareaIdCarpeta.Text;
                //tarea.IdUsuario = Session.SessionID;
                tarea.Nombre = nuevaTareaNombre.Text;
                tarea.Descripcion = nuevaTareaDescripcion.Text;
                tarea.Fecha = nuevaTareaFecha.SelectedDate;
                //tarea.Prioridad = nuevaTareaPrioridad.Text;
                //tarea.Estado = Convert.ToBoolean(nuevaTareaEstado.Checked);
                tareaService.CrearNuevaTarea(tarea);

                lbl_nuevaTareaInformacionEstado.ForeColor = System.Drawing.Color.Green;
                lbl_nuevaTareaInformacionEstado.Text = "Tarea agregada correctamente.";
            }
            else
            {
                //nuevaTareaIdCarpeta.Text = ' ';
                //nuevaTareaNombre.Text = ' ';
                //nuevaTareaDescripcion.Text = ' ';
                //nuevaTareaFecha.SelectedDate = ' ';
                //nuevaTareaPrioridad.Text = ' ';
                //nuevaTareaEstado.Text = ' ';
                lbl_nuevaTareaInformacionEstado.ForeColor = System.Drawing.Color.Red;
                lbl_nuevaTareaInformacionEstado.Text = "Error creando la tarea, vuelva a intentarlo";
            }
        }

    }
}