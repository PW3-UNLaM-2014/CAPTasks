<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Home.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="CAPTasks.Presentacion.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Modal -->
    <div class="modal fade" id="nuevaTarea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;</button>
                    <h4 class="modal-title" id="myModalLabel">
                        Modal title</h4>
                </div>
                <div class="modal-body">
                    <form action="home.aspx" method="post">
                    <asp:Label Text="Nombre" runat="server" for="tarea" />
                    <input type="text" name="tarea" value="Escriba aqui la tarea" />
                    <asp:Label Text="Descripcion" runat="server" for="descripcion" />
                    <input type="textbox" name="descripcion" value=" " />
                    <asp:Label Text="Fecha" runat="server" />
                    <asp:Calendar runat="server" />
                    <asp:Label Text="Prioridad" for="prioridad" runat="server" />
                    <asp:Label Text="Carpeta" for="carpeta" runat="server" />
                    <asp:Label Text="Estado" for="completada" runat="server" />
                    <input type="checkbox" name="completada" value="completada" />
                    <asp:Button ID="Button1" Text="Guardar Tarea" runat="server" />
                    <asp:Button ID="Button2" Text="Volver" runat="server" />
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        Close</button>
                    <button type="button" class="btn btn-primary">
                        Save changes</button>
                </div>
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
                    <input type="text" name="nombre" />
                    <asp:Label ID="Label1" Text="Descripcion" runat="server" for="descripcion" />
                    <input type="textbox" name="descripcion" value=" " />
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
