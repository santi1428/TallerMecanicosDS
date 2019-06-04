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
   public class clsReparacion
    {
        #region atributos
        public Int32 NumReparacion { get; set; }
        public string Placa { get; set; }
        public double CostoReparacion { get; set; }
        public Int32 CedMecanico { get; set; }

        private string SQL;
        public string Error { get; private set; }
        public DropDownList cboReparacion { get; set; }

        #endregion

        public bool LlenarCombo()
        {
            //Se valida si el combo existe
            if (cboReparacion == null)
            {
                Error = "No definió el combo de Reparacion";
                return false;
            }
            //Como es un procedimiento almacenado, sólo se define el nombre del SP
            SQL = "Reparacion_LlenarCombo";
            //Creo la clase combo
            clsCombos oCombo = new clsCombos();
            //Pasar los parametros a la clase
            oCombo.SQL = SQL;
            oCombo.StoredProcedure = true;
            oCombo.ColumnaTexto = "Texto";
            oCombo.ColumnaValor = "Codigo";
            oCombo.cboGenericoWeb = cboReparacion;
            if (oCombo.LlenarComboWeb())
            {
                //Llena el combo, libera memoria y retorna true
                cboReparacion = oCombo.cboGenericoWeb;
                oCombo = null;
                return true;
            }
            else
            {
                //Lee el error, libera memoria y retorna false
                Error = oCombo.Error;
                oCombo = null;
                return false;
            }
        }

        public bool ConsultarPrecio()
        {
            SQL = "Reparacion_ConsultarValorUnitario";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.StoredProcedure = true;
            oConexion.AgregarParametro("@prCodigo", System.Data.SqlDbType.Int, 4, NumReparacion);
            //Ejecuta consultar
            if (oConexion.Consultar())
            {
                //Guarda los datos en un objeto Reader, permite leer los datos hacia adelante (Cada fila)
                //En cada fila, el READER maneja los datos como un vector.
                //Lo primero que se revisa es si hay datos.
                if (oConexion.Reader.HasRows)
                {
                    //Se debe leer el Reader
                    oConexion.Reader.Read();
                    //Se leen los datos por posición y tipo de dato
                    CostoReparacion = oConexion.Reader.GetDouble(0);
                    //Cerrar conexion, liberar y retornar
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    Error = "No existen Reparacion con el código: " + NumReparacion;
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return false;
                }
            }
            else
            {
                Error = oConexion.Error;
                oConexion.CerrarConexion();
                oConexion = null;
                return false;
            }
        }
    }
}
