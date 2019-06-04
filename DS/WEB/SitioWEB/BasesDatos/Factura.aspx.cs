using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libClases_DS.BaseDatos;
using Clases_taller.RN;

namespace SitioWEB.BasesDatos
{
    public partial class Factura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblFecha.Text = DateTime.Now.ToString("yyyy MMM dd");
                LlenarComboVendedor();
                LlenarGridFactura();
                cbollenar();
            }
        }

        private void LlenarComboVendedor()
        {
            clsVendedor oVendedor = new clsVendedor();
            oVendedor.cboVendedor = cboVendedor;
            if (!oVendedor.LlenarCombo())
            {
                lblError.Text = oVendedor.Error;
            }
            oVendedor = null;
        }

        private void LlenarGridFactura()
        {
            Int32 NumeroFactura = Convert.ToInt32(lblNroFactura.Text);
            clsFactura oFactura = new clsFactura();
            oFactura.NumeroFactura = NumeroFactura;
            oFactura.grdFactura = grdFactura;
            if (!oFactura.LlenarGrid())
            {
                lblError.Text = oFactura.Error;
            }

            oFactura = null;
        }

        public void cbollenar()
        {
            if (Convert.ToInt32(cboTipo.SelectedValue) == 2)
            {
                LlenarComboReparacion();
            }

            if (Convert.ToInt32(cboTipo.SelectedValue) == 1)
            {
                LlenarComboRepuesto();
            }

            if (Convert.ToInt32(cboTipo.SelectedValue) == 3)
            {
                LlenarComboServicios();
            }
        }

        private void LlenarComboServicios()
        {

            clsServicio oServicios = new clsServicio();

            oServicios.cboServicios = cboServicios;
            if (!oServicios.LlenarCombo())
            {
                lblError.Text = oServicios.error;
            }
            else
            {
                ConsultarValorUnitarioServicios();
            }
            oServicios = null;
        }

        private void LlenarComboReparacion()
        {

            clsReparacion oReparacion = new clsReparacion();

            oReparacion.cboReparacion = cboServicios;
            if (!oReparacion.LlenarCombo())
            {
                lblError.Text = oReparacion.Error;
            }
            else
            {
                ConsultarValorUnitarioReparacion();
            }
            oReparacion = null;
        }

        private void LlenarComboRepuesto()
        {

            clsRepuesto oRepuesto = new clsRepuesto();

            oRepuesto.cboRepuesto = cboServicios;
            if (!oRepuesto.LlenarCombo())
            {
                lblError.Text = oRepuesto.error;
            }
            else
            {
                ConsultarValorUnitarioRepuesto();
            }
            oRepuesto = null;
        }

        private void ConsultarValorUnitarioServicios()
        {
            Int32 Codigo = Convert.ToInt32(cboServicios.SelectedValue);
            clsServicio oServicios = new clsServicio();
            oServicios.codigo = Codigo;
            if (oServicios.ConsultarPrecio())
            {
                lblValor.Text = oServicios.valor.ToString();
                lblValorUnitario.Text = "$ " + oServicios.valor.ToString("#,###");
                CalcularSubtotal();
            }
            else
            {
                lblError.Text = oServicios.error;
            }
            oServicios = null;
        }

        private void ConsultarValorUnitarioRepuesto()
        {
            Int32 Codigo = Convert.ToInt32(cboServicios.SelectedValue);
            clsRepuesto oRepuesto = new clsRepuesto();
            oRepuesto.codigo = Codigo;
            if (oRepuesto.ConsultarPrecio())
            {
                lblValor.Text = oRepuesto.valor.ToString();
                lblValorUnitario.Text = "$ " + oRepuesto.valor.ToString("#,###");
                CalcularSubtotal();
            }
            else
            {
                lblError.Text = oRepuesto.error;
            }
            oRepuesto = null;
        }

        private void ConsultarValorUnitarioReparacion()
        {
            Int32 Codigo = Convert.ToInt32(cboServicios.SelectedValue);
            clsReparacion oReparacion = new clsReparacion();
            oReparacion.NumReparacion = Codigo;
            if (oReparacion.ConsultarPrecio())
            {
                lblValor.Text = oReparacion.CostoReparacion.ToString();
                lblValorUnitario.Text = "$ " + oReparacion.CostoReparacion.ToString("#,###");
                CalcularSubtotal();
            }
            else
            {
                lblError.Text = oReparacion.Error;
            }
            oReparacion = null;
        }


        private void CalcularSubtotal()
        {
            Int32 Cantidad, ValorUnitario;
            if (txtCantidad.Text == "") txtCantidad.Text = "1";
            if (lblValor.Text == "") lblValor.Text = "0";
            Cantidad = Convert.ToInt32(txtCantidad.Text);
            ValorUnitario = Convert.ToInt32(lblValor.Text);
            lblSubtotal.Text = "$ " + (Cantidad * ValorUnitario).ToString("#,###");
        }

        protected void btnBuscarPro_Click(object sender, EventArgs e)
        {
            Int32 Cedula = Convert.ToInt32(txtCedulaPro.Text);
            clsPropietario oPropietario = new clsPropietario();
            oPropietario.Cedula = Cedula;

            if (oPropietario.Consultar())
            {
                lblNombrePro.Text = oPropietario.Nombre;
                btnCrear.Visible = false;
            }
            else
            {
                lblNombrePro.Text = oPropietario.Error;
                btnCrear.Visible = true;
            }
            oPropietario = null;
        }

        protected void btnBplaca_Click(object sender, EventArgs e)
        {
            string Placa = txtPlaca.Text;

            clsCarro oCarro = new clsCarro();

            oCarro.Placa = Placa;

            if (oCarro.ConsultarPlaca())
            {
                lblNombrePro.Text = oCarro.Nombre;
                txtCedulaPro.Text = oCarro.CedPro.ToString();
                lblPlacaError.Text = "";
                //btnCrear.Visible = false;
            }
            else
            {
                lblPlacaError.Text = oCarro.Error;
                //btnCrear.Visible = true;
            }
            oCarro = null;
        }

        protected void cboTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cboTipo.SelectedValue) == 1)
            {
                LlenarComboRepuesto();
            }

            if (Convert.ToInt32(cboTipo.SelectedValue) == 2)
            {
                LlenarComboReparacion();
            }


            if (Convert.ToInt32(cboTipo.SelectedValue) == 3)
            {
                LlenarComboServicios();
            }
        }

        protected void cboServicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cboTipo.SelectedValue) == 2)
            {
                ConsultarValorUnitarioReparacion();
            }

            if (Convert.ToInt32(cboTipo.SelectedValue) == 1)
            {
                ConsultarValorUnitarioRepuesto();
            }

            if (Convert.ToInt32(cboTipo.SelectedValue) == 3)
            {
                ConsultarValorUnitarioServicios();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Int32 NroFactura, Servicios, Vendedor, Cantidad, ValorUnitario, DocumentoPropietario;
            string Nombre;


            if (lblNroFactura.Text == "")
            {
                lblNroFactura.Text = "0";
            }

            NroFactura = Convert.ToInt32(lblNroFactura.Text);
            Vendedor = Convert.ToInt32(cboVendedor.SelectedValue);
            Cantidad = Convert.ToInt32(txtCantidad.Text);
            ValorUnitario = Convert.ToInt32(lblValor.Text);
            Servicios = Convert.ToInt32(cboServicios.SelectedValue);
            DocumentoPropietario = Convert.ToInt32(txtCedulaPro.Text);
            Nombre = cboServicios.SelectedItem.ToString();

            clsFactura oFactura = new clsFactura();
            oFactura.Producto = Servicios;
            oFactura.Vendedor = Vendedor;
            oFactura.Nombre = Nombre;
            oFactura.Cedula = DocumentoPropietario;
            oFactura.NumeroFactura = NroFactura;
            oFactura.Cantidad = Cantidad;
            oFactura.ValorUnitario = ValorUnitario;

            clsRN_TALLER_CARROS oRN = new clsRN_TALLER_CARROS();

            if (oFactura.Grabar())
            {
                txtCedulaPro.Enabled = false;
                cboVendedor.Enabled = false;
                lblNroFactura.Text = oFactura.NumeroFactura.ToString();
                lblTotal.Text = "$ " + oFactura.Total.ToString("#,###");
                oRN.ValorServicios = oFactura.Total;
                oRN.Calcular();
                double ejem = oRN.PorcentajeDescuento * 100;
                lblPD.Text = "% " + ejem.ToString();
                lblValorTD.Text = "$ " + oRN.ValorTotal.ToString("#,###");
                lblVD.Text = "$ " + oRN.ValorDescuento.ToString("#,###");
                LlenarGridFactura();
                //lblError.Text = "Grabó la factura";
            }
            else
            {
                lblError.Text = oFactura.Error;
            }
            oFactura = null;
            oRN = null;
        }

        protected void btnTerminar_Click(object sender, EventArgs e)
        {
            lblNroFactura.Text = "0";
            txtCedulaPro.Text = "0";
            txtCedulaPro.Enabled = true;
            lblNombrePro.Text = "";
            cboVendedor.Enabled = true;
            txtCantidad.Text = "1";
            CalcularSubtotal();
            //limpiar el grid
            grdFactura.DataSource = null;
            grdFactura.DataBind();
            lblError.Text = "";
            lblTotal.Text = "";
            lblPD.Text = "0";
            lblValorTD.Text = "0";
            lblVD.Text = "0";
            txtPlaca.Text = "";
        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            CalcularSubtotal();
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Response.Redirect("Propietario.aspx?Cedula=" + txtCedulaPro.Text);
        }
    }
}