using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libComunes.CapaDatos;
using libComunes.CapaObjetos;


namespace libClases_DS.BaseDatos
{
    public class clsVendedor
    {
        #region "Atributos/Propiedades"
        public Int32 Documento { get; set; }
        public string Nombre { get; set; }       
        public Int32 CedulaSupervisor { get; set; }
        private string SQL;
        public DropDownList cboVendedor { get; set; }
        public string Error { get; private set; }
        #endregion


        public bool LlenarCombo()
        {
            SQL = "Vendedor_LlenarCombo";

            //Se crea la instancia del objeto combo
            clsCombos oCombo = new clsCombos();
            oCombo.StoredProcedure = true;
            oCombo.SQL = SQL;
            //Se pasa el combo pais
            oCombo.cboGenericoWeb = cboVendedor;
            oCombo.NombreTabla = "Tabla";
            //La columna texto es el nombre de la columna que el combo a mostrar
            oCombo.ColumnaTexto = "Texto";
            //La columna valor, es el  nombre de la columna que quiero capturar en la interfaz
            oCombo.ColumnaValor = "Codigo";
            //Se invoca el combo y se lee
            if (oCombo.LlenarComboWeb())
            {
                //Si lo llenó, lee el combo lleno y lo asigna a la propiedad cboPaises
                cboVendedor = oCombo.cboGenericoWeb;
                oCombo = null;
                return true;
            }
            else
            {
                Error = oCombo.Error;
                oCombo = null;
                return false;
            }
        }
    }
}
