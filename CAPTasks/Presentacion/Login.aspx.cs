﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Net.Mail;
using Negocio;
using Entidades;
using System.Net;
using System.Web.Security;

namespace CAPTasks.Presentacion
{
    public partial class Login1 : System.Web.UI.Page
    {
        UsuarioServicios us = new UsuarioServicios();
        Usuario usuario = new Usuario();

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
            string email = Convert.ToString(txtEmailR.Text);
            int usuarioMismoMail = (us.VerificarEmail(email).Count); //cantidad de usuarios con ese mail y que estan activos
            if (usuarioMismoMail >= 1) //si hay por lo menos uno, ya no se se puede registrar con otro usuario con ese mismo mail
            {
                txtNombre.Text = "";
                txtApellido.Text = "";
                txtEmailR.Text = "";
                txtContraseniaR.Text = "";
                txtContraseniaR2.Text = "";
                lblMensaje2.ForeColor = System.Drawing.Color.Red;
                lblMensaje2.Text = "Email existente";
            }
            else
            {
                if (Page.IsValid)
                {
                    usuario.CodigoActivacion = Encryptor.MD5Hash(txtEmailR.Text); //Encripto el email
                    usuario.Nombre = txtNombre.Text;
                    usuario.Apellido = txtApellido.Text;
                    usuario.Email = txtEmailR.Text;
                    usuario.Contrasenia = Encryptor.MD5Hash(txtContraseniaR.Text); //Encripto contrasenia
                    us.CrearNuevoUsuario(usuario);
                    lblMensaje2.ForeColor = System.Drawing.Color.Green;
                    lblMensaje2.Text = "Datos ingresados correctamente, revise su correo para confirmar su registración";

                    //ENVIO DE MAIL:
                    System.Net.Mail.MailMessage msj = new System.Net.Mail.MailMessage();
                    msj.To.Add(new MailAddress(txtEmailR.Text));
                    msj.From = new MailAddress("nuestra.aplicacion2014@gmail.com");
                    msj.Subject = "Activación de cuenta";
                    msj.SubjectEncoding = System.Text.Encoding.UTF8;
                    string body = "Hola " + txtNombre.Text.Trim() + ",";
                    body += "<br/><br/>Por favor, haga click en el siguiente link para activar su cuenta:<br/>";
                    body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("/Presentacion/Login.aspx", "/Presentacion/ConfirmaRegistro.aspx?ActivationCode=" + usuario.CodigoActivacion) + "'>Haga click aqui para activar su cuenta</a>";
                    body += "<br /><br />Muchas gracias, CAPTasks!";
                    msj.Body = body;
                    msj.IsBodyHtml = true;

                    SmtpClient client = new SmtpClient();
                    client.Host = "smtp.gmail.com";
                    client.EnableSsl = true;
                    NetworkCredential netcred = new NetworkCredential("nuestra.aplicacion2014", "napp2014");
                    client.UseDefaultCredentials = true;
                    client.Credentials = netcred;
                    client.Port = 587;
                    client.Send(msj);
                }
            }
        }

        protected void RecaptchaValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            this.RecaptchaControl2.Validate();
            args.IsValid = this.RecaptchaControl2.IsValid;
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string contraseniaIngresada = Encryptor.MD5Hash(txtContrasenia.Text); //Encripto contrasenia
            string emailIngresado = txtEmail.Text;
            Usuario miUsuario;
            miUsuario = us.TraerDatosUsuario(emailIngresado);
            if ((miUsuario != null) && (contraseniaIngresada == miUsuario.Contrasenia))
            {
                Session["Nombre"] = miUsuario.Nombre;
                Session["IdUsuario"] = miUsuario.IdUsuario;
                Session["Email"] = miUsuario.Email;
                ejecutarAccion(miUsuario);
            }

            else
            {
                txtEmail.Text = "";
                txtContrasenia.Text = "";
                lblMensaje1.ForeColor = System.Drawing.Color.Red;
                lblMensaje1.Text = "Verifique usuario y/o contraseña";
            }
        }

        protected void ejecutarAccion(Usuario miUsuario)
        {

            if (miUsuario.Estado == 1)
            {
                int id = Convert.ToInt32(Session["IdUsuario"]);
                string nombre = "General";
                string descripcion = "Carpeta creada por defecto para las tareas a las que no se les asigna carpeta";
                us.CrearCarpetaGeneral(id, nombre, descripcion);
                Response.Redirect("Home.aspx");
            }

            if (usuario.Estado == 0)
            {
                txtEmail.Text = "";
                txtContrasenia.Text = "";
                lblMensaje1.ForeColor = System.Drawing.Color.Red;
                lblMensaje1.Text = "Usuario inexistente";
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