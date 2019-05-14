<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Repuesto.aspx.cs" Inherits="SitioWEB.BasesDatos.Repuesto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #repuestos-nav a{
            background: #5C6166;
        }

        body{
            overflow-x: hidden;
        }
    </style>
    <title>Repuestos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%--<div class="container">--%>
        <div class="row mt-4 justify-content-center no-gutters">
            <div class="col-4 p-0 m-0">
                <div class="card">
                    <div class="card-header text-center">
                        Formulario Repuestos
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                 <div class="form-group mb-4">
                                    <asp:Label Text="Código" runat="server" />
                                    <asp:TextBox ID="txtCodigo"  type="number" runat="server" CssClass="form-control" placeholder="Ingrese el código"></asp:TextBox>
                                </div>
                             </div>
                            <div class="col">
                                     <div class="form-group mb-4">
                                        <asp:Label Text="Nombre" runat="server" />
                                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Ingrese el nombre"></asp:TextBox>
                                    </div>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <div class="form-group mb-4">
                                    <asp:Label Text="Valor" runat="server" />
                                    <asp:TextBox ID="txtValor" runat="server" type="number" CssClass="form-control" placeholder="Ingrese el valor"></asp:TextBox>
                                </div>
                            </div>   
                            <div class="col">
                                <div class="form-group mb-4">
                                    <asp:Label Text="Fecha Registro" runat="server" />
                                     <asp:TextBox ID="txtFechaRegistro" runat="server" CssClass="form-control" placeholder="Ingrese la fecha"></asp:TextBox>
                                </div>         
                            </div>
                        </div>
                        <div class="form-group mb-4">
                            <asp:Label Text="Seleccione el proveedor" runat="server" />
                            <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="custom-select"></asp:DropDownList>
                        </div>
                        <div class="text-center mb-4">
                            <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger font-weight-bold"></asp:Label>
                        </div>
                            <asp:LinkButton ID="btnIngresar" runat="server" CssClass="btn btn-dark btn-block" OnClick="btnIngresar_Click" ><i class="fas fa-plus-circle mr-2"></i>Ingresar</asp:LinkButton>
                            <asp:LinkButton ID="btnActualizar" runat="server" CssClass="btn btn-success btn-block" OnClick="btnActualizar_Click" ><i class="fas fa-pen-alt mr-2"></i>Actualizar</asp:LinkButton>
                            <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn btn-danger btn-block" OnClick="btnEliminar_Click" ><i class="fas fa-trash-alt mr-2"></i>Eliminar</asp:LinkButton>
                        </div>
                </div>
            </div>
            <div class="col-8 p-0">
                <div class="card">
                    <div class="card-header text-center">
                        Tabla Repuestos
                    </div>
                    <div class="card-body">
                    <asp:GridView ID="grdServicio" runat="server" CssClass="mx-auto table table-borderless text-center mt-2" OnSelectedIndexChanged="grdServicio_SelectedIndexChanged"> 
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
