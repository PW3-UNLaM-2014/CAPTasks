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