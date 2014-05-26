<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Home.Master" AutoEventWireup="true"
    CodeBehind="CrearTarea.aspx.cs" Inherits="CAPTasks.Presentacion.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--  para guardar tarea -->
    <form action="home.aspx" method="post">
    <div class="container">
        <h4 class="page-header">
            Guardar tarea</h4>
        <asp:Label Text="" ID="lblNuevaTareaInformacionEstado" runat="server" />
        <div class="form-group">
            <asp:Label ID="lblNuevaTareaNombre" Text="Nombre" runat="server" for="txtNuevaTareaNombre" />
            <asp:TextBox class="form-control" runat="server" MaxLength="20" ID="txtNuevaTareaNombre"
                placeholder="Escriba aqui la tarea" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNuevaTareaNombre"
                Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="*Campo obligatorio"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtNuevaTareaNombre"
                ValidationExpression=".{1,20}" Display="Dynamic" runat="server" ForeColor="Red"
                ErrorMessage="Máximo 20 caracteres"></asp:RegularExpressionValidator>
        </div>
        <div class="form-group">
            <asp:Label ID="lblNuevaTareaDescripcion" Text="Descripcion" runat="server" MaxLength="200" for="txtNuevaTareaDescripcion" />
            <asp:TextBox class="form-control" runat="server" ID="txtNuevaTareaDescripcion" placeholder="Escriba aqui la descripcion" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtNuevaTareaDescripcion"
                ValidationExpression=".{1,200}" Display="Dynamic" runat="server" ForeColor="Red"
                ErrorMessage="Máximo 200 caracteres"></asp:RegularExpressionValidator>

        </div>
        <div class="form-group">
            <asp:Label ID="lblNuevaTareaFecha" Text="Fecha" runat="server" for="calNuevaTareaFecha" />
            <asp:Calendar runat="server" ID="calNuevaTareaFecha" />
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <asp:Label ID="lblNuevaTareaPrioridad" Text="Prioridad" for="ddlNuevaTareaPrioridad"
                    runat="server" />
                <asp:DropDownList ID="ddlNuevaTareaPrioridad" class="dropdown form-control" runat="server">
                    <asp:ListItem Text="Baja" Value="0" Selected="True" />
                    <asp:ListItem Text="Media" Value="1" />
                    <asp:ListItem Text="Alta" Value="2" />
                    <asp:ListItem Text="Urgente" Value="3" />
                </asp:DropDownList>
            </div>
            <div class="form-group col-md-6">
                <asp:Label ID="lblNuevaTareaIdCarpeta" Text="Carpeta" for="ddlNuevaTareaIdCarpeta"
                    runat="server" />
                <asp:DropDownList class="form-control" ID="ddlNuevaTareaIdCarpeta" runat="server">
                </asp:DropDownList>
            </div>
        </div>
        <div class="checkbox">
            <asp:CheckBox Text="Completada" class="disabled form-control" runat="server" Checked="false"
                ID="chkNuevaTareaEstado" Enabled="false" />
        </div>
        <div class="form-group">
            <asp:Button ID="btnGuardarTarea" Text="Guardar Tarea" OnClick="btnGuardarTarea_Click"
                runat="server" class="btn btn-primary" />
        </div>
    </div>
    </form>
</asp:Content>
