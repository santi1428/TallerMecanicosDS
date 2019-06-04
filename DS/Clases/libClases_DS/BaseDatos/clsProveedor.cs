using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;
using libComunes.CapaDatos;

namespace libClases_DS.BaseDatos
{
    public class clsProveedor
    {
        #region Atributos/Propiedades
        public DropDownList cboProveedor { get; set; }
        public string error { get; private set; }
        private string SQL;
        #endregion

        #region Metodos
        public bool LlenarCombo()
        {
            //Se valida si el combo existe
            if (cboProveedor == null)
            {
                error = "No definió el combo de proveedor";
                return false;
            }
            //Como es un procedimiento almacenado, sólo se define el nombre del SP
            SQL = "Proveedor_LlenarCombo";
            //Creo la clase combo
            clsCombos oCombo = new clsCombos();
            //Pasar los parametros a la clase
            oCombo.SQL = SQL;
            oCombo.StoredProcedure = true;
            oCombo.ColumnaTexto = "Texto";
            oCombo.ColumnaValor = "Codigo";
            oCombo.cboGenericoWeb = cboProveedor;
            if (oCombo.LlenarComboWeb())
            {
                //Llena el combo, libera memoria y retorna true
                cboProveedor = oCombo.cboGenericoWeb;
                oCombo = null;
                return true;
            }
            else
            {
                //Lee el error, libera memoria y retorna false
                error = oCombo.Error;
                oCombo = null;
                return false;
            }
        }
        #endregion
    }
}
