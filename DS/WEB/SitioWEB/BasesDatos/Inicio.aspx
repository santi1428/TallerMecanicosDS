<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="SitioWEB.BasesDatos.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       #inicio-nav a{
            background: #5C6166;
        }
        body{
            overflow-x: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-center mt-5">
           <div class="col-md-4 card shadow-lg rounded">
                <div class="card-header text-center">
                    Menu Opciones
                </div>
               <div class="card-body">
                   <a href="/BasesDatos/Servicio.aspx" class="btn btn-dark btn-block mb-4"><i class="fas fa-star mr-2"></i>Registrar Servicio</a>
                   <a href="/BasesDatos/Repuesto.aspx" class="btn btn-dark btn-block mb-4"><i class="fas fa-tools mr-2"></i>Registrar Repuesto</a>
                   <a href="/BasesDatos/Factura.aspx" class="btn btn-dark btn-block mb-4"><i class="fas fa-receipt mr-2"></i>Realizar Factura</a>
                   <a href="/BasesDatos/Propietario.aspx" class="btn btn-dark btn-block mb-4"><i class="fas fa-user-plus mr-2"></i>Registrar Propietario</a>
               </div>
            </div>
        </div>
    </div>
</asp:Content>
