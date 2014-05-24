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
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="myModalLabel">
                        Guardar tarea</h4>
                </div>
                <div class="modal-body">
                    
                    <asp:Label Text="" ID="nuevaTareaInformacionEstado" runat="server" />
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
                    <asp:TextBox runat="server" ID="nuevaTareaPrioridad" />
                    <br />
                    <asp:Label Text="Carpeta" for="nuevaTareaIdCarpeta" runat="server" />
                    <asp:TextBox runat="server" ID="nuevaTareaIdCarpeta" />
                    <br />
                    <asp:Label Text="Estado" for="nuevaTareaEstado" runat="server" />
                    <asp:CheckBox Text="completada" runat="server"  ID="nuevaTareaEstado" />
                   
                </div>
                <div class="modal-footer">
                
                    <asp:Button ID="btnCerrarModalTarea" class="btn btn-default" data-dismiss="modal" Text="Volver" runat="server" />
                    
                    <asp:Button ID="btnGuardarTarea" Text="Guardar Tarea" runat="server"  class="btn btn-primary" />
                    
                </div>
                 </form>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="nuevaCarpeta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="home.aspx" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="H1">
                        Modal title</h4>
                </div>
                <div class="modal-body">
                    <asp:Label Text="Nombre" for="nombre" runat="server" />
                    <asp:TextBox runat="server" name="nombre" />
                    <asp:Label ID="Label1" Text="Descripcion" runat="server" for="descripcion" />
                    <asp:TextBox ID="TextBox2" runat="server" name="descripcion" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Close</button>
                    <asp:Button ID="btn_guardar_carpeta" class="btn btn-primary" Text="Guardar Carpeta"
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
            <ul>
                <li><a href="#">Default</a></li>
            </ul>
            <!-- Button trigger modal -->
            <button class="btn btn-primary" data-toggle="modal" data-target="#nuevaCarpeta">
                Nueva Carpeta
            </button>
        </div>
        <div id="main" class="col-md-9">
            <h2>
                Lista de tareas
            </h2>
            <asp:GridView runat="server" />
            <!-- Button trigger modal -->
            <button class="btn btn-primary" data-toggle="modal" data-target="#nuevaTarea">
                Nueva Tarea
            </button>
        </div>
    </div>
</asp:Content>
