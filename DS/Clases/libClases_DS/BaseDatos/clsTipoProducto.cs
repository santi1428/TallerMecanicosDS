using System;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;

namespace libClases_DS.BaseDatos
{
    public class clsTipoProducto
    {
        #region "Atributos/Propiedades"
        public DropDownList cboTipoProducto { get; set; }
        private string SQL;
        public string Error { get; private set; }
        #endregion
        #region "Metodos"
        public bool LlenarCombo()
        {
            SQL = "TípoProducto_LlenarCombo";

            //Se crea la instancia del objeto combo
            clsCombos oCombo = new clsCombos();
            oCombo.SQL = SQL;
            //Se pasa el combo pais
            oCombo.cboGenericoWeb = cboTipoProducto;
            oCombo.NombreTabla = "Tabla";
            //La columna texto es el nombre de la columna que el combo a mostrar
            oCombo.ColumnaTexto = "Texto";
            //La columna valor, es el  nombre de la columna que quiero capturar en la interfaz
            oCombo.ColumnaValor = "Valor";
            //Se invoca el combo y se lee
            if (oCombo.LlenarComboWeb())
            {
                //Si lo llenó, lee el combo lleno y lo asigna a la propiedad cboPaises
                cboTipoProducto = oCombo.cboGenericoWeb;
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
        #endregion
    }
}
