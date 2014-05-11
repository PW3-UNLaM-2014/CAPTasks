<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CAPTasks.Presentacion.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentLogin" ContentPlaceHolderID="ContentHeaderLogin" runat="server">

    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="lblContrasenia" runat="server" Text="Contraseña"></asp:Label>
    <asp:TextBox ID="txtContrasenia" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRegistracion" runat="server">

    <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label>
    <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID="lblEmailR" runat="server" Text="Email:"></asp:Label>
    <asp:TextBox ID="txtEmailR" runat="server" TextMode="Email"></asp:TextBox>
    <br />

    <asp:Label ID="lblContraseniaR" runat="server" Text="Contraseña:"></asp:Label>
    <asp:TextBox ID="txtContraseniaR" runat="server" TextMode="Password"></asp:TextBox>
    <br />

    <asp:Label ID="lblContraseniaR2" runat="server" Text="Repita contraseña:"></asp:Label>
    <asp:TextBox ID="txtContraseniaR2" runat="server" TextMode='Password'></asp:TextBox>
    <br />

    <asp:Button ID="btnRegistrarse" runat="server" Text="Registrarse" />

</asp:Content>