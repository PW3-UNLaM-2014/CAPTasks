using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace CAPTasks.Presentacion
{
    public partial class Login1 : System.Web.UI.Page
    {
        UsuarioServicios us = new UsuarioServicios();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["Preferencias"] != null)
            {
                txtEmail.Text = Request.Cookies["Preferencias"]["Email"];
                txtContrasenia.Attributes.Add("Value", Request.Cookies["Preferencias"]["Contrasenia"].ToString());
            }
        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                lblMensaje2.ForeColor = System.Drawing.Color.Green;
                lblMensaje2.Text = "Datos ingresados correctamente, revise su correo para confirmar su registración";
            }
            else
            {
                txtNombre.Text = "";
                txtApellido.Text = "";
                txtEmailR.Text = "";
                txtContraseniaR.Text = "";
                txtContraseniaR2.Text = "";
                lblMensaje2.ForeColor = System.Drawing.Color.Red;
                lblMensaje2.Text = "Error, vuelva a intentarlo";
            }
        }

        protected void RecaptchaValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            this.RecaptchaControl2.Validate();
            args.IsValid = this.RecaptchaControl2.IsValid;
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Session["Logueado"] = txtEmail.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblMensaje1.Text = "El Email y/o la contraseña no coinciden, verifique sus datos";
            }

        } 

        protected void ckbRecordarme_CheckedChanged(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["Preferencias"];
            if (cookie == null)
                cookie = new HttpCookie("Preferencias");
            cookie.Values["Email"] = txtEmail.Text;
            cookie.Values["Contrasenia"] = Encryptor.MD5Hash(txtContrasenia.Text);
            cookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie);

        }
    }
}