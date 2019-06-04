using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using libClases_DS.BaseDatos;

namespace SitioWEB.BasesDatos
{
    public partial class Propietario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }

            if (Request.Params["Cedula"] != null)
            {
                txtCedula.Text =  Request.Params["Cedula"].ToString();
            }

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
        }

        private void LlenarGrid()
        {
            clsPropietario oPropietario = new clsPropietario();
            oPropietario.grdPropietario = grdPropietario;
            if (!oPropietario.LlenarGrid())
            {
                lblError.Text = oPropietario.Error;
            }
            else
            {
                lblError.Text = "";
            }
            oPropietario = null;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string Nombre, Telefono;
            Int32 Cedula, Edad;

            Nombre = txtNombre.Text;
            Telefono = txtTelefono.Text;
            Edad = Convert.ToInt32(txtEdad.Text);
            Cedula = Convert.ToInt32(txtCedula.Text);

            clsPropietario oPropietario = new clsPropietario();
            oPropietario.Nombre = Nombre;
            oPropietario.Cedula = Cedula;
            oPropietario.Edad = Edad;
            oPropietario.Telefono = Telefono;

            if (oPropietario.Actualizar())
            {
                lblError.Text = "Se ha registrado el propietario exitosamente";
                LlenarGrid();
            }
            else
            {
                lblError.Text = "";
            }
            oPropietario = null;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Int32 Cedula;
            Cedula = Convert.ToInt32(txtCedula.Text);
            clsPropietario oPropietario = new clsPropietario();
            oPropietario.Cedula = Cedula;
            if (oPropietario.Borrar())
            {
                LlenarGrid();
                lblError.Text = "";
            }
            else
            {
                lblError.Text = oPropietario.Error;
            }
        }

        protected void grdPropietario_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCedula.Text = grdPropietario.SelectedRow.Cells[1].Text;
            txtEdad.Text =   grdPropietario.SelectedRow.Cells[3].Text;
            txtNombre.Text = grdPropietario.SelectedRow.Cells[2].Text;
            txtTelefono.Text = grdPropietario.SelectedRow.Cells[4].Text;
        }

        protected void btnRegistrar_Click1(object sender, EventArgs e)
        {
            string Nombre, Telefono;
            Int32 Cedula, Edad;

            Nombre = txtNombre.Text;
            Telefono = txtTelefono.Text;
            Edad = Convert.ToInt32(txtEdad.Text);
            Cedula = Convert.ToInt32(txtCedula.Text);

            clsPropietario oPropietario = new clsPropietario();
            oPropietario.Nombre = Nombre;
            oPropietario.Cedula = Cedula;
            oPropietario.Edad = Edad;
            oPropietario.Telefono = Telefono;

            if (oPropietario.Ingresar())
            {
                lblError.Text = "Se ha registrado el propietario exitosamente";
                LlenarGrid();
            }
            else
            {
                lblError.Text = "";
            }

            oPropietario = null;
        }
    }
}