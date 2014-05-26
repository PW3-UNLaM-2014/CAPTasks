<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Home.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="CAPTasks.Presentacion.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Modal -->
    <div class="modal fade" id="nuevaCarpeta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="home.aspx" method="post">
                <div class="modal-header">
                    <asp:Button Text="&times;" runat="server" class="close" data-dismiss="modal" aria-hidden="true" />
                    <h4 class="modal-title" id="H1">
                        Nueva carpeta</h4>
                </div>
                <div class="modal-body">
                    <asp:Label Text="Nombre" for="nombre" runat="server" />
                    <asp:TextBox runat="server" name="nombre" />
                    <asp:Label ID="lblDescripcion" Text="Descripcion" runat="server" for="descripcion" />
                    <asp:TextBox ID="txtCarpetaDescripcion" runat="server" name="descripcion" />
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Cerrar" class="btn btn-default" data-dismiss="modal" runat="server" />
                    <asp:Button ID="btnGuardarCarpeta" class="btn btn-primary" Text="Guardar Carpeta"
                        runat="server" />
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
                 CellPadding="4" ForeColor="#333333"
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
                GridLines="None" CellPadding="40" DataKeyNames="IdTarea" OnRowDataBound="gvListaTareas_RowDataBound">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="IdTarea" HeaderText="IdTarea" Visible="False" />
                    <asp:BoundField DataField="Fecha" DataFormatString="{0:d}" HeaderText="Fecha" 
                        ReadOnly="True" />
                    <asp:BoundField DataField="Tarea" HeaderText="Nombre" ReadOnly="True" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" 
                        ReadOnly="True" />
                    <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" ReadOnly="True" />
                    <asp:BoundField DataField="Carpeta" HeaderText="Carpeta" ReadOnly="True" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    <asp:TemplateField HeaderText="Accion" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnCompletar" runat="server" CausesValidation="false" 
                                CommandName="Update" Text="Completar" OnClick="btnCompletar_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:Button Text="Nueva Tarea" class="btn btn-primary" PostBackUrl="~/Presentacion/CrearTarea.aspx"
                runat="server" />
        </div>
    </div>
</asp:Content>
