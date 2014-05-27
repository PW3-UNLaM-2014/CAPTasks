<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Home.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="CAPTasks.Presentacion.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div id="sidebar" class="col-md-3 navbar-default navbar-static-side">
            <h2>
                Carpetas
            </h2>
            <asp:BulletedList ID="bullCarpetas" CssClass="nav" DisplayMode="LinkButton" runat="server" OnClick="bullCarpetas_Click">
            </asp:BulletedList>
            <%--<asp:GridView ID="gvCarpetas" AutoGenerateColumns="False" runat="server" OnLoad="Page_Load"
                 CellPadding="4" ForeColor="#333333"
                GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="IdUsuario" HeaderText="IdUsuario" Visible="false" />
                    <asp:BoundField DataField="IdCarpeta" HeaderText="IdCarpeta" Visible="false" />
                    <asp:BoundField DataField="Nombre" HeaderText="Carpeta" />
                    <asp:TemplateField HeaderText="Tareas Asociadas">
                       <asp:HyperLink runat="server">Ver</asp:HyperLink>
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
            </asp:GridView>--%>
            <br />
            <a href="CrearCarpeta.aspx" class="btn btn-primary fa-with-txt">&#xf067; Crear Carpeta</a>
        </div>
        <div id="page-wrapper" class="col-md-9">
            <h2>
                Lista de tareas
            </h2>
            <div class="panel-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvListaTareas" CssClass="table table-hover table-striped" runat="server" AutoGenerateColumns="False"
                        ForeColor="#333333" GridLines="None" CellPadding="10" CellSpacing="4" DataKeyNames="IdTarea"
                        OnRowDataBound="gvListaTareas_RowDataBound">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="IdTarea" HeaderText="IdTarea" Visible="False" />
                            <asp:BoundField DataField="Fecha" DataFormatString="{0:d}" HeaderText="Fecha" ReadOnly="True" />
                            <asp:BoundField DataField="Tarea" HeaderText="Nombre" ReadOnly="True" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" ReadOnly="True" />
                            <asp:BoundField DataField="Prioridad" HeaderText="Prioridad" ReadOnly="True" />
                            <asp:BoundField DataField="Carpeta" HeaderText="Carpeta" ReadOnly="True" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado" />
                            <asp:TemplateField HeaderText="Accion" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Button ID="btnCompletar" class="btn btn-outline btn-success btn-sm" runat="server" CausesValidation="false" CommandName="Update"
                                        Text="Completar" OnClick="btnCompletar_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        
                        <%--<HeaderStyle BackColor="#39b3d7" Font-Bold="True" VerticalAlign="Middle"
                            HorizontalAlign="Center" />
                            <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"
                            Height="100" Width="200" />
                        <RowStyle BackColor="#EFF3FB" Height="50" Width="400" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#39b3d7" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />--%>
                    </asp:GridView>
                </div>
                <!-- /.table-responsive -->
            </div>
            <asp:Label ID="lblNoHayTareas" class="alert alert-danger" runat="server" Text="No se encuentran tareas en esta carpeta!"
                Visible="false"></asp:Label>
            <asp:CheckBox ID="ckbTareasFinalizadas" CssClass="checkbox checkbox-inline" runat="server" Text="Incluir completadas" />
            <asp:Button ID="btnTareasFinalizadas" runat="server" class="btn btn-info fa-with-txt" Text="&#xf021; Actualizar"
                OnClick="btnTareasFinalizadas_Click" />
            <!-- Button trigger modal -->
            <asp:Button Text="&#xf067; Nueva Tarea" class="btn btn-primary fa-with-txt" PostBackUrl="~/Presentacion/CrearTarea.aspx"
                runat="server" />
        </div>
</asp:Content>
