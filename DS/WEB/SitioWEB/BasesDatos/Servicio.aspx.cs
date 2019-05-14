using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using libClases_DS.BaseDatos;
using System.Web.UI.WebControls;

namespace SitioWEB.BasesDatos
{
    public partial class Servicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //No ha hecho postback, es el primer llamado
                LlenarGrid();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string nombre;
            Int32 codigo;
            double valor;
            codigo = Convert.ToInt32(txtCodigo.Text);
            nombre = txtNombre.Text;
            valor = Convert.ToDouble(txtValor.Text);
            clsServicio oServicio = new clsServicio();
            oServicio.codigo = codigo;
            oServicio.nombre = nombre;
            oServicio.valor = valor;
            if (oServicio.Actualizar())
            {
                LlenarGrid();
                lblError.Text = "";
            }
            else
            {
                lblError.Text = oServicio.error;

            }
            oServicio = null;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Int32 codigo;
            codigo = Convert.ToInt32(txtCodigo.Text);
            clsServicio oServicio = new clsServicio();
            oServicio.codigo = codigo;
            if (oServicio.Borrar())
            {
                LlenarGrid();
                lblError.Text = "";
            }
            else
            {
                lblError.Text = oServicio.error;

            }
            oServicio = null;
        }

        protected void btnIngresar_Click1(object sender, EventArgs e)
        {
            string nombre;
            Int32 codigo;
            double valor;
            codigo = Convert.ToInt32(txtCodigo.Text);
            nombre = txtNombre.Text;
            valor = Convert.ToDouble(txtValor.Text);
            clsServicio oServicio = new clsServicio();
            oServicio.codigo = codigo;
            oServicio.nombre = nombre;
            oServicio.valor = valor;
            if (oServicio.Ingresar())
            {
                LlenarGrid();
                lblError.Text = "";
            }
            else
            {
                lblError.Text = oServicio.error;

            }
            oServicio = null;

        }

        private void LlenarGrid()
        {
            clsServicio oServicio = new clsServicio();
            oServicio.grdServicio = grdServicio;
            if (!oServicio.LlenarGrid())
            {
                lblError.Text = oServicio.error;
            }
            else
            {
                lblError.Text = "";
            }
            oServicio = null;
        }

        protected void grdServicio_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCodigo.Text = grdServicio.SelectedRow.Cells[1].Text;
            txtNombre.Text = grdServicio.SelectedRow.Cells[2].Text;
            txtValor.Text = grdServicio.SelectedRow.Cells[3].Text;
        }
    }
}