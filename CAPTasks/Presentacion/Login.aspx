﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Login.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="CAPTasks.Presentacion.Login1" %>

<%@ Register Assembly="Recaptcha" Namespace="Recaptcha" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentLogin" ContentPlaceHolderID="ContentHeaderLogin" runat="server">
    <%--INICIO DE SESSION --%>
    <div class="col-md-6">
        <div class="navbar-form navbar-right">
            <div class="form-group col-md-4">
                <asp:Label ID="lblEmail" class="sr-only" runat="server" Text="Email:"></asp:Label>
                <asp:TextBox ID="txtEmail" class="form-control input-sm" MaxLength="20" runat="server"
                    placeholder="Ingrese email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="validator-asterisk" ControlToValidate="txtEmail"
                    ValidationGroup="ingresar" Display="Dynamic" runat="server" ForeColor="Red" Text="*"
                    ErrorMessage="Debe ingresar su correo electronico."></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="validator-asterisk"  ControlToValidate="txtEmail"
                    ValidationGroup="ingresar" Display="Dynamic" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ForeColor="Red" runat="server" Text="!" ErrorMessage="Ingrese una direccion de correo v&aacute;lida"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group col-md-4">
                <asp:Label ID="lblContrasenia" class="sr-only" runat="server" Text="Contraseña:"></asp:Label>
                <asp:TextBox ID="txtContrasenia" class="form-control input-sm" TextMode="Password"
                    runat="server" placeholder="Ingrese contraseña"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validator-asterisk" ControlToValidate="txtContrasenia"
                    ValidationGroup="ingresar" Display="Dynamic" ForeColor="Red" runat="server" Text="*"
                    ErrorMessage="Por favor no olvide la contrase&ntilde;a."></asp:RequiredFieldValidator>
                
            </div>
            <div class="form-group col-md-4">
                <asp:Button ID="btnIngresar" runat="server" ValidationGroup="ingresar" Text="Iniciar Sesión"
                    CssClass="btn btn-primary btn-sm" OnClick="btnIngresar_Click" />
                <asp:Label ID="lblMensaje1" CssClass="col-md-12" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="form-group checkbox col-md-12 col-md-offset-1">
            <label>
                <asp:CheckBox ID="ckbRecordarme" class="text-muted" Text="Recordar mis datos" runat="server" />
            </label>
            <asp:ValidationSummary ID="ValidationSummary1" ShowSummary="true" HeaderText="Preste atención a estos errores y vuelva a intentarlo:"
                    DisplayMode="BulletList" ForeColor="Red" ValidationGroup="ingresar" runat="server"
                    Width="459px" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRegistracion" runat="server">
    <%--REGISTRACION--%>
    <div class="container  margin-bottom">
        <div class="contenedor-imagen col-md-6">
            <img src="img/task-big.png" />
        </div>
        <div class="col-md-6 ">
            <h2>
                Abre una cuenta<small> Es gratis!</small></h2>
            <div class="row">
                <div class="form-group col-md-6">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtNombre" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtNombre"
                        ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                        ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtNombre"
                        ValidationExpression=".{1,20}" ValidationGroup="registracion" Display="Dynamic"
                        runat="server" ForeColor="Red" ErrorMessage="Máximo 20 caracteres"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label>
                    <br />
                    <asp:TextBox ID="txtApellido" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtApellido"
                        ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                        ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtApellido"
                        ValidationExpression=".{1,20}" ValidationGroup="registracion" Display="Dynamic"
                        runat="server" ForeColor="Red" ErrorMessage="Máximo 20 caracteres"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEmailR" runat="server" Text="Email:"></asp:Label>
                <%-- Condicion que el mail no tenga mas de 20 caracteres!!--%>
                <asp:TextBox ID="txtEmailR" class="form-control" MaxLength="20" runat="server" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtEmailR"
                    ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                    ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtEmailR"
                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="registracion"
                    Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Formato invalido.Maximo 20 caracteres"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="lblContraseniaR" runat="server" Text="Contraseña:"></asp:Label>
                <asp:TextBox ID="txtContraseniaR" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtContraseniaR"
                    ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                    ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtContraseniaR"
                    ValidationExpression="^(?=.*\d{2})(?=.*[a-z])(?=.*[A-Z]).{1,20}$" ValidationGroup="registracion"
                    Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Debe contener al menos 2 números y 1 letra mayúscula. Máximo 20 caracteres"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="lblContraseniaR2" runat="server" Text="Repita contraseña:"></asp:Label>
                <asp:TextBox ID="txtContraseniaR2" class="form-control" runat="server" TextMode='Password'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtContraseniaR2"
                    ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                    ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtContraseniaR2"
                    ControlToCompare="txtContraseniaR" ValidationGroup="registracion" Display="Dynamic"
                    ForeColor="Red" runat="server" ErrorMessage="Las contraseñas deben ser iguales"></asp:CompareValidator>
                
            </div>
            <div class="form-group">
                <asp:Label ID="lblSeguridad" runat="server" Text="Control de seguridad:"></asp:Label>
                <uc1:RecaptchaControl ID="RecaptchaControl2" runat="server" PublicKey="6LcOscwSAAAAAClgCVVWUOLx-EVBWlIbUldCPzAd "
                    PrivateKey="6LcOscwSAAAAAH6wOwoy0TAFkJBlzPcrg4I6kXuE" Language="" />
                <asp:CustomValidator ID="RecaptchaValidator" runat="server" ForeColor="Red" ValidationGroup="registracion"
                    ErrorMessage="El texto introducido no coincide con el control de seguridad" OnServerValidate="RecaptchaValidator_ServerValidate" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegistrarse" runat="server" ValidationGroup="registracion" Text="Registrarse"
                    class="btn btn-success btn-lg" OnClick="btnRegistrarse_Click" />
                <asp:Label ID="lblMensaje2" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblMensaje3" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
