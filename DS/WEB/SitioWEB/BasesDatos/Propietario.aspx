<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Propietario.aspx.cs" Inherits="SitioWEB.BasesDatos.Propietario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #propietario-nav a{
            background: #5C6166;
        }
        body{
            overflow-x: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <%--<div class="container">--%>
    <div class="row justify-content-around mt-5">
        <div class="col-md-4 card shadow-lg rounded">
                <div class="card-header text-center">
                    RegRegistrar Propietario
                </div>
                <div class="card-body">
                <div class="form-group">
                    <asp:Label Text="Cedula" runat="server" />
                    <asp:TextBox ID="txtCedula" CssClass="form-control" runat="server" placeholder="Ingrese la cedula"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label Text="Nombre" runat="server" />
                    <asp:TextBox ID="txtNombre" CssClass="form-control" placeholder="Ingrese el nombre" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label Text="Edad" runat="server" />
                    <asp:TextBox ID="txtEdad" CssClass="form-control" textmode="Number" placeholder="Ingrese la edad" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label Text="Telefono" runat="server" />
                    <asp:TextBox ID="txtTelefono" CssClass="form-control" placeholder="Ingrese el telefono" runat="server"></asp:TextBox>
                </div>
                <asp:LinkButton ID="btnRegistrar" CssClass="btn btn-block btn-dark" runat="server" OnClick="btnRegistrar_Click1" ><i class="fas fa-user-plus mr-2"></i>Registrar Propietario</asp:LinkButton>
                <asp:LinkButton ID="btnActualizar" runat="server" CssClass="btn btn-success btn-block" OnClick="btnActualizar_Click"  ><i class="fas fa-edit mr-2"></i>Actualizar</asp:LinkButton>
                <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn btn-danger btn-block" OnClick="btnEliminar_Click"  ><i class="fas fa-trash-alt mr-2"></i>Eliminar</asp:LinkButton>
            </div>
            <asp:Label ID="lblError" CssClass="text-success font-weight-bold" runat="server" Text=""></asp:Label>
        </div>
        <div class="col-6 card shadow-lg rounded">
            <div class="card-header text-center">
                Propietarios
            iv>
            <div class="card-body">
                <asp:GridView ID="grdPropietario" runat="server" CssClass="mx-auto table table-borderless text-center mt-2" OnSelectedIndexChanged="grdPropietario_SelectedIndexChanged"> 
                    <Columns>
                        <asp:CommandField HeaderText="Opciones" ShowHeader="True" ShowSelectButton="True" SelectText="&lt;i class=&quot;fas fa-pen-alt mr-2&quot;&gt;&lt;/i&gt;Editar" >
                        <ControlStyle CssClass="btn btn-success" />
                        </asp:CommandField>
                    </Columns>
                    <HeaderStyle CssClass="thead-dark" />
                    <SelectedRowStyle CssClass="bg-dark text-white" />
                </asp:GridView>
            </div>
        </div> 
    </div>
<%--</div>--%>
</asp:Content>
