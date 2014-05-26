<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Home.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="CAPTasks.Presentacion.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Modal para guardar tarea -->
    <div class="modal fade" id="nuevaTarea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="home.aspx" method="post">
                <div class="modal-header">
                    <asp:Button Text="&times;" class="close" data-dismiss="modal" aria-hidden="true"
                        runat="server" />
                    <h4 class="modal-title" id="myModalLabel">
                        Guardar tarea</h4>
                </div>
                <div class="modal-body">
                    <asp:Label Text="" ID="lbl_nuevaTareaInformacionEstado" runat="server" />
                    <br />
                    <asp:Label Text="Nombre" runat="server" for="nuevaTareaNombre" />
                    <asp:TextBox runat="server" ID="nuevaTareaNombre" value="Escriba aqui la tarea" />
                    <br />
                    <asp:Label Text="Descripcion" runat="server" for="nuevaTareaDescripcion" />
                    <asp:TextBox runat="server" ID="nuevaTareaDescripcion" value="Escriba aqui la descripcion" />
                    <br />
                    <asp:Label Text="Fecha" runat="server" for="nuevaTareaFecha" />
                    <asp:Calendar runat="server" ID="nuevaTareaFecha" />
                    <br />
                    <asp:Label Text="Prioridad" for="nuevaTareaPrioridad" runat="server" />
                    <asp:TextBox runat="server" />
                    <asp:DropDownList ID="ddl_nueva_tarea_prioridad" class="dropdown" runat="server">
                        <asp:ListItem Text="text1" />
                        <asp:ListItem Text="text2" />
                    </asp:DropDownList>
                    <br />
                    <asp:Label Text="Carpeta" for="nuevaTareaIdCarpeta" runat="server" />
                    <asp:TextBox runat="server" ID="nuevaTareaIdCarpeta" />
                    <br />
                    <asp:Label Text="Estado" for="nuevaTareaEstado" runat="server" />
                    <asp:CheckBox Text="completada" class="disabled" runat="server" ID="nuevaTareaEstado" />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCerrarModalTarea" class="btn btn-default" data-dismiss="modal"
                        Text="Volver" runat="server" />
                    <asp:Button ID="btnGuardarTarea" Text="Guardar Tarea" runat="server" class="btn btn-primary" />
                </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div id="sidebar" class="col-md-3">
            <h2>
                Carpetas
            </h2>
            <asp:GridView ID="gvCarpetas" AutoGenerateColumns="False" runat="server" OnLoad="Page_Load"
                OnRowDataBound="gvCarpetas_RowDataBound" CellPadding="4" ForeColor="#333333"
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" Visible="false" />
                    <asp:BoundField DataField="IdCarpeta" HeaderText="IdCarpeta" Visible="false" />
                    <asp:BoundField DataField="Nombre" HeaderText="Carpeta" />
                    <asp:TemplateField HeaderText="Tareas">
                        <HeaderTemplate>
                            Tareas Asociadas</HeaderTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="comboTareas" Width="150px" runat="server">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" Visible="false" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <a href="CrearCarpeta.aspx" class="btn btn-primary">Crear Carpeta</a>
        </div>
        <div id="main" class="col-md-9">
            <h2>
                Lista de tareas
            </h2>
            <asp:GridView ID="gvListaTareas" runat="server" AutoGenerateColumns="False" ForeColor="#333333"
                GridLines="None" CellPadding="40">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Fecha" DataFormatString="{0:d}" HeaderText="Fecha" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
                    <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" />
                    <asp:BoundField DataField="IdCarpeta" HeaderText="Carpeta" />
                    <asp:BoundField DataField="Estado" HeaderText="Completada" />
                    <asp:CommandField ButtonType="Button" EditText="Completar" HeaderText="Accion" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"
                    Height="100" Width="200" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="100" Width="200" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:CheckBox ID="ckbTareasFinalizadas" runat="server" />
            <asp:Label ID="lblTareasFinalizadas" runat="server" Text="Incluir completadas"></asp:Label>
            <asp:Button ID="btnTareasFinalizadas" runat="server" Text="Actualizar" OnClick="btnTareasFinalizadas_Click" />
            <!-- Button trigger modal -->
            <asp:Button Text="Nueva Tarea" class="btn btn-primary" data-toggle="modal" data-target="#nuevaTarea"
                runat="server" />
        </div>
    </div>
</asp:Content>
