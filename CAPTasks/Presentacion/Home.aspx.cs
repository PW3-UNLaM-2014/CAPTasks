using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAPTasks.Presentacion
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardarTarea(object sender, EventArgs e)
        {
            Tarea tarea = new Tarea();
            TareaService tareaService = new TareaService();

            if (Page.IsValid)
            {

                tarea.IdCarpeta = nuevaTareaIdCarpeta.Text;
                tarea.IdUsuario = nuevaTareaIdUsuario.Text;
                tarea.Nombre = nuevaTareaNombre.Text;
                tarea.Descripcion = nuevaTareaDescripcion.Text;
                tarea.Fecha = nuevaTareaFecha.Calendar;
                tarea.Prioridad = nuevaTareaPrioridad.Text;
                tarea.Estado = nuevaTareaEstado.Text;
                tareaService.CrearNuevoUsuario(tarea);
                nuevaTareaInformacionEstado.ForeColor = System.Drawing.Color.Green;
                nuevaTareaInformacionEstado.Text = "Tarea agregada correctamente.";
            }
            else
            {
                nuevaTareaIdCarpeta.Text = '';
                nuevaTareaIdUsuario.Text = '';
                nuevaTareaNombre.Text = '';
                nuevaTareaDescripcion.Text = '';
                nuevaTareaFecha.Calendar = '';
                nuevaTareaPrioridad.Text = '';
                nuevaTareaEstado.Text = '';
                nuevaTareaInformacionEstado.ForeColor = System.Drawing.Color.Red;
                nuevaTareaInformacionEstado.Text = "Error creando la tarea, vuelva a intentarlo";
            }
        }
    }
}