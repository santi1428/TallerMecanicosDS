<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="SitioWEB.BasesDatos.Factura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #factura-nav a{
            background: #5C6166;
        }
        body{
            overflow-x: hidden;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center mt-4">
        <div class="col-5 card shadow-lg py-2 px-4 rounded mr-5">
                    <div class="row justify-content-around mb-3">
                        <div class="col-4">
                           <asp:label text="Fecha:" runat="server" />
                        </div>
                        <div class="col p-0">
                            <asp:label text="" ID="lblFecha" runat="server" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-4">
                            <asp:label text="Numero Factura:" runat="server" />
                        </div>
                        <div class="col">
                            <asp:label text="0" ID="lblNroFactura" runat="server" />
                        </div>
                    </div>  
                    <div class="row mb-3">
                            <div class="col-4">
                                <asp:label text="Cedula Propietario:" runat="server" />
                            </div>
                            <div class="col p-0">
                                        <asp:textbox CssClass="form-control w-75 d-inline" ID="txtCedulaPro" value="0" runat="server"></asp:textbox>
                                        <asp:linkbutton ID="btnBuscarPro" CssClass="btn btn-dark d-inline" runat="server" OnClick="btnBuscarPro_Click"><i class="fas fa-search"></i></asp:linkbutton>
                            </div>
                    </div>  
                    <div class="row mb-3">
                        <div class="col-4">
                            <asp:label text="Nombre Propietario:" runat="server" />
                        </div>
                        <div class="col p-0">
                            <asp:label text="" ID="lblNombrePro" runat="server" />
                            <asp:linkbutton ID="btnCrear" CssClass="btn btn-dark d-block" runat="server" Visible="False" OnClick="btnCrear_Click"><i class="fas fa-user-plus mr-2"></i>Registrar propetario</asp:linkbutton>
                        </div>
                    </div> 
                    <div class="row mb-3">
                        <div class="col-4">
                            <asp:label runat="server" text="Vendedor: "></asp:label>
                        </div>
                        <div class="col p-0">
                            <asp:dropdownlist id="cboVendedor" CssClass="custom-select w-75" runat="server"></asp:dropdownlist>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-4">
                            <asp:label runat="server" text="Placa vehiculo:"></asp:label>
                        </div>
                        <div class="col p-0">
                                <asp:textbox  ID="txtPlaca" CssClass="form-control w-75 d-inline" runat="server" placeholder="Placa del vehiculo"></asp:textbox>
                                <asp:LinkButton ID="btnBplaca" CssClass="btn btn-dark d-inline" runat="server" OnClick="btnBplaca_Click"><i class="fas fa-search"></i></asp:LinkButton>
                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblPlacaError" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-3">
                                <div class="col-4">
                                    <asp:label text="Tipo Servicio:" runat="server"></asp:label>
                                </div>
                                <div class="col p-0">
                                    <asp:dropdownlist ID="cboTipo" CssClass="custom-select w-75" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboTipo_SelectedIndexChanged">
                                        <asp:ListItem Value="1">Repuestos</asp:ListItem>
                                        <asp:ListItem Value="2">Reparacion</asp:ListItem>
                                        <asp:ListItem Value="3">Servicios Extra</asp:ListItem>
                                    </asp:dropdownlist>
                                </div>
                    </div>  
                    <div class="row mb-3">
                        <div class="col-4">
                            <asp:label runat="server" text="Servicios: "></asp:label>
                        </div>
                        <div class="col p-0">
                                <asp:dropdownlist ID="cboServicios" CssClass="custom-select w-75 d-inline" runat="server" OnSelectedIndexChanged="cboServicios_SelectedIndexChanged" AutoPostBack="True"></asp:dropdownlist>
                                <asp:linkbutton ID="btnAgregar" CssClass="btn btn-dark d-inline" runat="server" OnClick="btnAgregar_Click"><i class="fas fa-plus"></i></asp:linkbutton>
                            <div class="row mt-1">
                                <div class="col-auto">
                                    <asp:label runat="server" text="Valor Unitario:"></asp:label>
                                </div>
                                <div class="col-auto">
                                     <asp:label ID="lblValor" runat="server" Visible="False" ></asp:label>
                                    <asp:label runat="server" ID="lblValorUnitario"></asp:label>
                                </div>
                            </div>

                        </div>
                    </div>  
                    <div class="row mb-3">
                        <div class="col-4">
                            <asp:label runat="server" text="Cantidad: "></asp:label>
                        </div>
                        <div class="col p-0">                       
                                <asp:textbox CssClass="form-control w-75" ID="txtCantidad" runat="server" OnTextChanged="txtCantidad_TextChanged"></asp:textbox>
                        </div>
                    </div>  
                     <div class="row justify-content-center mb-2">
                        <div class="col-12 p-0">
                            <asp:label runat="server" text="" ID="lblError"></asp:label>
                            <asp:linkbutton CssClass="btn btn-dark btn-block" ID="btnTerminar" runat="server" OnClick="btnTerminar_Click" ><i class="fas fa-check mr-2"></i>Terminar Factura</asp:linkbutton>
                        </div>
                    </div>         
            </div>
        <div class="col-5 card shadow-lg py-2 px-5 rounded">
            <div class="row mb-3">
                <div class="col">
                    <asp:GridView ID="grdFactura" runat="server" CssClass="mx-auto table table-borderless  text-center mt-2">
                        <HeaderStyle CssClass="thead-dark" />
                        <SelectedRowStyle CssClass="bg-dark text-white" />
                    </asp:GridView>
                </div>
            </div>
            <div class="row mb-3">
                        <div class="col-5">
                            <asp:label runat="server" CssClass="font-weight-bold" text="Total sin descuento:"></asp:label>
                        </div>
                        <div class="col p-0">
                            <asp:label runat="server" ID="lblTotal" text="0"></asp:label>
                        </div>
            </div>
            <div class="row mb-3">
                        <div class="col-5">
                            <asp:label runat="server" CssClass="font-weight-bold" text="Total con descuento:"></asp:label>
                        </div>
                        <div class="col p-0">
                            <asp:label runat="server" ID="lblValorTD" text="0"></asp:label>
                        </div>
            </div>
            <div class="row mb-3">
                        <div class="col-5">
                            <asp:label runat="server" CssClass="font-weight-bold" text="Porcentaje descuento:"></asp:label>
                        </div>
                        <div class="col p-0">
                             <asp:label runat="server" ID="lblPD" text="0"></asp:label>
                        </div>
            </div>
            <div class="row mb-3">
                        <div class="col-5">
                            <asp:label runat="server" CssClass="font-weight-bold" text="Valor descuento:"></asp:label>
                        </div>
                        <div class="col p-0">
                             <asp:label runat="server" ID="lblVD" text="0"></asp:label>
                        </div>
            </div>
            <div class="row mb-3">
                        <div class="col-5">
                            <asp:label runat="server" CssClass="font-weight-bold" text="Subtotal:"></asp:label>
                        </div>
                        <div class="col p-0">
                             <asp:label runat="server" ID="lblSubtotal"></asp:label>
                        </div>
            </div>
        </div>
</asp:Content>
