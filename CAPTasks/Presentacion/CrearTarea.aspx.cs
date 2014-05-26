﻿using System;
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
        TareaServicios tareaService = new TareaServicios();
        CarpetaServicios carpetaServicio = new CarpetaServicios();

        protected void Page_Load(object sender, EventArgs e)
        {
            int idUsuario = Convert.ToInt32(Session["IdUsuario"]);
            if (!IsPostBack)
            {
                calNuevaTareaFecha.SelectedDate = DateTime.Now; //Selecciona el dia de hoy
                ddlNuevaTareaIdCarpeta.DataSource = carpetaServicio.ListarCarpetas(idUsuario);
                ddlNuevaTareaIdCarpeta.DataTextField = "Nombre";
                ddlNuevaTareaIdCarpeta.DataValueField = "IdUsuario";
                ddlNuevaTareaIdCarpeta.DataBind();
            }
           
        }
        
        protected void btnGuardarTarea_Click(object sender, EventArgs e)
        {
            Tarea tarea = new Tarea();
            
            if (Page.IsValid)
            {
                int idUsuario = Convert.ToInt32(Session["IdUsuario"]);
                int id = Convert.ToInt32(ddlNuevaTareaIdCarpeta.SelectedValue);
                tarea.IdCarpeta = id;
                tarea.IdUsuario = idUsuario;
                tarea.Nombre = txtNuevaTareaNombre.Text;
                tarea.Descripcion = txtNuevaTareaDescripcion.Text;
                tarea.Fecha = calNuevaTareaFecha.SelectedDate.Date;
                tarea.Prioridad = Convert.ToInt16(ddlNuevaTareaPrioridad.SelectedValue);
                tareaService.CrearNuevaTarea(tarea);

                Response.Redirect("~/Presentacion/Home.aspx");
            }
            else
            {
                ddlNuevaTareaIdCarpeta.Text = "";
                txtNuevaTareaNombre.Text = "";
                txtNuevaTareaDescripcion.Text = "";
                calNuevaTareaFecha.SelectedDate = DateTime.Now;
                ddlNuevaTareaPrioridad.Text = "";
                chkNuevaTareaEstado.Text = "";
                lblNuevaTareaInformacionEstado.Text = "Error creando la tarea, vuelva a intentarlo";
            }
        }

        protected void btnCancelarTarea_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Presentacion/Home.aspx");
        }
    }
}