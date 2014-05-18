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
            //DESCOMENTAR PARA PROBAR LA SESSION:

            //if (Session["Logueado"] == null)
            //{

            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
            //    string usuarioLogueado = Session["Logueado"].ToString();
            //    lblUsuario.Text = usuarioLogueado;
            //}
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }      
    }
}