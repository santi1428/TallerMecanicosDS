using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libClases_DS.BaseDatos;

namespace SitioWEB.BasesDatos
{
    public partial class Repuesto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenarCombo();
                LlenarGrid();
            }

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Int32 codigo;
            string nombre;
            double valor;
            string fecha;
            Int32 nit;
            codigo = Convert.ToInt32(txtCodigo.Text);
            nombre = txtNombre.Text;
            valor = Convert.ToDouble(txtValor.Text);
            fecha = txtFechaRegistro.Text;
            nit = Convert.ToInt32(ddlProveedor.SelectedValue);
            clsRepuesto oRepuesto = new clsRepuesto();
            oRepuesto.codigo = codigo;
            oRepuesto.nombre = nombre;
            oRepuesto.valor = valor;
            oRepuesto.fecha = fecha;
            oRepuesto.nit = nit;
            if (oRepuesto.Ingresar())
            {
                LlenarGrid();
                lblError.Text = "";
            }
            else
            {
                lblError.Text = oRepuesto.error;

            }
            oRepuesto = null;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Int32 codigo;
            string nombre;
            double valor;
            string fecha;
            Int32 nit;
            codigo = Convert.ToInt32(txtCodigo.Text);
            nombre = txtNombre.Text;
            valor = Convert.ToDouble(txtValor.Text);
            fecha = txtFechaRegistro.Text;
            nit = Convert.ToInt32(ddlProveedor.SelectedValue);
            clsRepuesto oRepuesto = new clsRepuesto();
            oRepuesto.codigo = codigo;
            oRepuesto.nombre = nombre;
            oRepuesto.valor = valor;
            oRepuesto.fecha = fecha;
            oRepuesto.nit = nit;
            if (oRepuesto.Actualizar())
            {
                LlenarGrid();
                lblError.Text = "";
            }
            else
            {
                lblError.Text = oRepuesto.error;

            }
            oRepuesto = null;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Int32 codigo;
            codigo = Convert.ToInt32(txtCodigo.Text);
            clsRepuesto oRepuesto = new clsRepuesto();
            oRepuesto.codigo = codigo;
            if (oRepuesto.Borrar())
            {
                LlenarGrid();
                lblError.Text = "";
            }
            else
            {
                lblError.Text = oRepuesto.error;

            }
            oRepuesto = null;
        }

        private void LlenarGrid()
        {
            clsRepuesto oRepuesto = new clsRepuesto();
            oRepuesto.grdRepuesto = grdServicio;
            if (!oRepuesto.LlenarGrid())
            {
                lblError.Text = oRepuesto.error;
            }
            else
            {
                lblError.Text = "";
            }
            oRepuesto = null;
        }

        private void LlenarCombo()
        {
            clsProveedor oProveedor = new clsProveedor();
            oProveedor.cboProveedor = ddlProveedor;
            if (!oProveedor.LlenarCombo())
            {
                lblError.Text = oProveedor.error;
            }
            oProveedor = null;
        }

        protected void grdServicio_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCodigo.Text = grdServicio.SelectedRow.Cells[3].Text;
            txtNombre.Text = grdServicio.SelectedRow.Cells[4].Text;
            txtValor.Text = grdServicio.SelectedRow.Cells[5].Text;
            txtFechaRegistro.Text = grdServicio.SelectedRow.Cells[6].Text;
            ddlProveedor.SelectedValue = grdServicio.SelectedRow.Cells[1].Text;
        }
    }
}