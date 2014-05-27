<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Home.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="CAPTasks.Presentacion.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <div class="col-md-12">
        <div id="sidebar" class="col-md-3">
            <h2>
                Carpetas
            </h2>
            <asp:BulletedList ID="bullCarpetas" DisplayMode="LinkButton" runat="server" 
                onclick="bullCarpetas_Click">
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
            <a href="CrearCarpeta.aspx" class="btn btn-primary">Crear Carpeta</a>
        </div>
        <div id="main" class="col-md-9 page-wrapper">
            <h2>
                Lista de tareas
            </h2>
            <asp:GridView ID="gvListaTareas" runat="server" AutoGenerateColumns="False" ForeColor="#333333"
                GridLines="None" CellPadding="10" CellSpacing="4" DataKeyNames="IdTarea" 
                OnRowDataBound="gvListaTareas_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
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
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Width="400" VerticalAlign="Middle" HorizontalAlign="Center" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"
                    Height="100" Width="200" />
                <RowStyle BackColor="#EFF3FB" Height="50" Width="400" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:Label ID="lblNoHayTareas" runat="server" Text="No se encuentran tareas en esta carpeta!" Visible="false"></asp:Label>
            <asp:CheckBox ID="ckbTareasFinalizadas" runat="server" />
            <asp:Label ID="lblTareasFinalizadas" runat="server" Text="Incluir completadas"></asp:Label>
            <asp:Button ID="btnTareasFinalizadas" runat="server" class="btn btn-info" Text="Actualizar" OnClick="btnTareasFinalizadas_Click" />
            <!-- Button trigger modal -->
            <asp:Button Text="Nueva Tarea" class="btn btn-primary" PostBackUrl="~/Presentacion/CrearTarea.aspx"
                runat="server" />
        </div>
    </div>
</div>   
</asp:Content>
