<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Home.Master" AutoEventWireup="true"
    CodeBehind="CrearCarpeta.aspx.cs" Inherits="CAPTasks.Presentacion.CrearCarpeta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="col-md-6 col-md-offset-3">
        <h3>Crear carpeta nueva</h3>
            <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label>
            <asp:TextBox ID="txtNombre" class="form-control" MaxLength="20" runat="server" placeholder="Ingrese un nombre para la carpeta"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNombre" ValidationGroup="carpeta"  runat="server" ForeColor="Red" ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblDescripcion" Text="Descripción:" runat="server" />
            <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" MaxLength="200" class="form-control"
                runat="server" />
            <br />
            <asp:Button Text="Cancelar" ID="btnCancelarCarpeta" class="btn btn-default" data-dismiss="modal"
                runat="server" onclick="btnCancelarCarpeta_Click" />
            <asp:Button ID="btnGuardarCarpeta" class="btn btn-success" Text="Guardar Carpeta" ValidationGroup="carpeta"
                 runat="server" onclick="btnGuardarCarpeta_Click" />
        </div>
    </div>
</asp:Content>
