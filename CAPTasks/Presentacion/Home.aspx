<%@ Page Title="" Language="C#" MasterPageFile="~/Presentacion/Home.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="CAPTasks.Presentacion.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div id="sidebar" class="col-md-3">
            <h2>
                Carpetas
            </h2>
            <ul>
                <li><a href="#">Default</a></li>
            </ul>
        </div>
        <div id="main" class="col-md-9">
            <h2>
                Lista de tareas
            </h2>
            <asp:GridView runat="server" />
        </div>
    </div>
    <%--modal--%>
    <div id="new-task" class="modal">
        <form action="default.aspx" method="post">
        </form>
    </div>
    <div id="new-folder" class="modal">
        <form action="default.aspx" method="post">
        </form>
    </div>
</asp:Content>
