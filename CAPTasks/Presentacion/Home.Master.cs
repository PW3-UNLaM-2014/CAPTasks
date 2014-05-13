﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CAPTasks.Presentacion
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Logueado"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string usuarioLogueado = Session["Logueado"].ToString();
                lblUsuario.Text = usuarioLogueado;
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
  
        }      
    }
}