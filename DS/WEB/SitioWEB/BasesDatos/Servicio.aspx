<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Servicio.aspx.cs" Inherits="SitioWEB.BasesDatos.Servicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #servicios-nav a{
            background: #5C6166;
        }
    </style>
    <title>Servicios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="container">--%>
        <div class="row mt-5 justify-content-center no-gutters">
            <div class="col-3 p-0">
                <div class="card">
                    <div class="card-header text-center">
                        Formulario Servicios
                    </div>
                    <div class="card-body">
                         <div class="form-group mb-4">
                            <asp:Label Text="Código" runat="server" />
                            <asp:TextBox ID="txtCodigo"  type="number" runat="server" CssClass="form-control" placeholder="Ingrese el código del servicio"></asp:TextBox>
                        </div>
                        <div class="form-group mb-4">
                            <asp:Label Text="Nombre" runat="server" />
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Ingrese el nombre del servicio"></asp:TextBox>
                        </div>
                        <div class="form-group mb-4">
                            <asp:Label Text="Valor" runat="server" />
                            <asp:TextBox ID="txtValor" runat="server" type="number" CssClass="form-control" placeholder="Ingrese el valor del servicio"></asp:TextBox>
                        </div>
                        <div class="text-center mb-4">
                            <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger font-weight-bold"></asp:Label>
                        </div>
                            <asp:LinkButton ID="btnIngresar" runat="server" CssClass="btn btn-dark btn-block" OnClick="btnIngresar_Click1"><i class="fas fa-plus-circle mr-2"></i>Ingresar</asp:LinkButton>
                            <asp:LinkButton ID="btnActualizar" runat="server" CssClass="btn btn-success btn-block" OnClick="btnActualizar_Click"><i class="fas fa-pen-alt mr-2"></i>Actualizar</asp:LinkButton>
                            <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn btn-danger btn-block" OnClick="btnEliminar_Click"><i class="fas fa-trash-alt mr-2"></i>Eliminar</asp:LinkButton>
                        </div>
                </div>
            </div>
            <div class="col-8 ml-5 p-0">
                <div class="card">
                    <div class="card-header text-center">
                        Tabla Servicios
                    </div>
                    <div class="card-body">
                        <%--<asp:GridView ID="grdServicio" runat="server" CssClass="mx-auto table table-hover text-center"></asp:GridView>--%>
                    <asp:GridView ID="grdServicio" runat="server" CssClass="mx-auto table table-borderless  text-center mt-2" OnSelectedIndexChanged="grdServicio_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField HeaderText="Opciones" ShowHeader="True" ShowSelectButton="True" />
                        </Columns>
                        <HeaderStyle CssClass="thead-dark" />
                        <SelectedRowStyle CssClass="bg-dark text-white" />
                    </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    <%--</div>--%>
</asp:Content>
