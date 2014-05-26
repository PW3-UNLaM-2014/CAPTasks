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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            CarpetaServicios carpetaServicio = new CarpetaServicios();
            List<Carpeta> misCarpetas = new List<Carpeta>();

            int idUsuario;
            idUsuario = Convert.ToInt32(Session["IdUsuario"]);

            // CARGAR CARPETAS EN DROPDOWN
            misCarpetas = carpetaServicio.ListarCarpetas(idUsuario);

            ddlNuevaTareaIdCarpeta.DataSource = carpetaServicio.ListarCarpetas(idUsuario);
            ddlNuevaTareaIdCarpeta.DataTextField = "Nombre";
            ddlNuevaTareaIdCarpeta.DataValueField = "IdCarpeta";
            ddlNuevaTareaIdCarpeta.DataBind();
        }

        protected void btnGuardarTarea_Click(object sender, EventArgs e)
        {
            Tarea tarea = new Tarea();
            TareaServicios tareaService = new TareaServicios();

            if (Page.IsValid)
            {
                int idUsuario;
                idUsuario = Convert.ToInt32(Session["IdUsuario"]);
                tarea.IdCarpeta = Convert.ToInt16(ddlNuevaTareaIdCarpeta.SelectedValue);
                //tarea.IdCarpeta = 1;
                tarea.IdUsuario = idUsuario;
                tarea.Nombre = txtNuevaTareaNombre.Text;
                tarea.Descripcion = txtNuevaTareaDescripcion.Text;
                tarea.Fecha = calNuevaTareaFecha.SelectedDate;
                if (tarea.Fecha == DateTime.MinValue)
                {
                    tarea.Fecha = DateTime.MinValue;
                }
                tarea.Prioridad = Convert.ToInt16(ddlNuevaTareaPrioridad.SelectedValue);
                tareaService.CrearNuevaTarea(tarea);

                lblNuevaTareaInformacionEstado.ForeColor = System.Drawing.Color.Green;
                lblNuevaTareaInformacionEstado.Text = "Tarea agregada correctamente.";
            }
            else
            {
                ddlNuevaTareaIdCarpeta.Text = "";
                txtNuevaTareaNombre.Text = "";
                txtNuevaTareaDescripcion.Text = "";
                calNuevaTareaFecha.SelectedDate = DateTime.Now;
                ddlNuevaTareaPrioridad.Text = "";
                chkNuevaTareaEstado.Text = "";
                lblNuevaTareaInformacionEstado.ForeColor = System.Drawing.Color.Red;
                lblNuevaTareaInformacionEstado.Text = "Error creando la tarea, vuelva a intentarlo";
            }
        }
    }
}