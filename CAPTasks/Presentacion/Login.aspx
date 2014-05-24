<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Login.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="CAPTasks.Presentacion.Login1" %>

<%@ Register Assembly="Recaptcha" Namespace="Recaptcha" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentLogin" ContentPlaceHolderID="ContentHeaderLogin" runat="server">
    <%--INICIO DE SESSION --%>
    <div class="col-md-6">
        <div class="form-group">
            <asp:Label ID="lblEmail" class="sr-only" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" class="form-control input-sm" MaxLength=20 runat="server" placeholder="Ingrese email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEmail"
                ValidationGroup="ingresar" Display="Dynamic" runat="server" ForeColor="Red" Text="*"
                ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmail"
                ValidationGroup="ingresar" Display="Dynamic" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ForeColor="Red" runat="server" Text="!" ErrorMessage="!Formato invalido"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="lblContrasenia" class="sr-only" runat="server" Text="Contraseña:"></asp:Label>
            <asp:TextBox ID="txtContrasenia" class="form-control input-sm" TextMode="Password"
                runat="server" placeholder="Ingrese contraseña"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtContrasenia"
                ValidationGroup="ingresar" Display="Dynamic" ForeColor="Red" runat="server" Text="*"
                ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
            <asp:ValidationSummary ID="ValidationSummary1" ShowSummary="true" HeaderText="Preste atención a estos errores y vuelva a intentarlo:"
                DisplayMode="BulletList" ForeColor="Red" ValidationGroup="ingresar" runat="server"
                Width="459px" />
        </div>
        <div class="checkbox">
            <label>
                <asp:CheckBox ID="ckbRecordarme" Text="Recordar mis datos" runat="server" OnCheckedChanged="ckbRecordarme_CheckedChanged" />
            </label>
        </div>
        <asp:Button ID="Button1" runat="server" ValidationGroup="ingresar" Text="Iniciar Sesión"
            class="btn btn-primary" OnClick="btnIngresar_Click" />
    </div>
    <asp:Label ID="lblMensaje1" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRegistracion" runat="server">
    <%--REGISTRACION--%>
    <div class="container">
        <div class="col-md-6 col-md-offset-6">
            <h2>
                Abre una cuenta<small> Es gratis!</small></h2>
            <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
            <br />
            <asp:TextBox ID="txtNombre" class="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtNombre"
                ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtNombre"
                ValidationExpression=".{1,20}" ValidationGroup="registracion" Display="Dynamic"
                runat="server" ForeColor="Red" ErrorMessage="Máximo 20 caracteres"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label>
            <br />
            <asp:TextBox ID="txtApellido" class="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtApellido"
                ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtApellido"
                ValidationExpression=".{1,20}" ValidationGroup="registracion" Display="Dynamic"
                runat="server" ForeColor="Red" ErrorMessage="Máximo 20 caracteres"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblEmailR" runat="server" Text="Email:"></asp:Label>
            <br />
           <%-- Condicion que el mail no tenga mas de 20 caracteres!!--%>
            <asp:TextBox ID="txtEmailR" class="form-control" MaxLength=20  runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtEmailR"
                ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtEmailR"
                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="registracion"
                Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Formato invalido.Maximo 20 caracteres"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblContraseniaR" runat="server" Text="Contraseña:"></asp:Label>
            <br />
            <asp:TextBox ID="txtContraseniaR" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtContraseniaR"
                ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="txtContraseniaR"
                ValidationExpression="^(?=.*\d{2})(?=.*[a-z])(?=.*[A-Z]).{1,20}$" ValidationGroup="registracion"
                Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Debe contener al menos 2 números y 1 letra mayúscula. Máximo 20 caracteres"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lblContraseniaR2" runat="server" Text="Repita contraseña:"></asp:Label>
            <br />
            <asp:TextBox ID="txtContraseniaR2" class="form-control" runat="server" TextMode='Password'></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtContraseniaR2"
                ValidationGroup="registracion" Display="Dynamic" ForeColor="Red" runat="server"
                ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtContraseniaR2"
                ControlToCompare="txtContraseniaR" ValidationGroup="registracion" Display="Dynamic"
                ForeColor="Red" runat="server" ErrorMessage="Las contraseñas deben ser iguales"></asp:CompareValidator>
            <br />
            <asp:Label ID="lblSeguridad" runat="server" Text="Control de seguridad:"></asp:Label>
            <br />
            <div>
                <uc1:RecaptchaControl ID="RecaptchaControl2" runat="server" PublicKey="6LcOscwSAAAAAClgCVVWUOLx-EVBWlIbUldCPzAd "
                    PrivateKey="6LcOscwSAAAAAH6wOwoy0TAFkJBlzPcrg4I6kXuE" Language="" />
                <asp:CustomValidator ID="RecaptchaValidator" runat="server" ForeColor="Red" ValidationGroup="registracion"
                    ErrorMessage="El texto introducido no coincide con el control de seguridad" OnServerValidate="RecaptchaValidator_ServerValidate" />
            </div>
            <asp:Button ID="btnRegistrarse" runat="server" ValidationGroup="registracion" Text="Registrarse"
                class="btn btn-success btn-lg" OnClick="btnRegistrarse_Click" />
            <br />
            <asp:Label ID="lblMensaje2" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
