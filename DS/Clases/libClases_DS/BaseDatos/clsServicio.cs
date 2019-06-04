using System;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;
using libComunes.CapaDatos;

namespace libClases_DS.BaseDatos
{
    public class clsServicio
    {
        #region Atributos/Metodos
        public Int32 codigo { get; set; }
        public string nombre { get; set; }
        public double valor { get; set; }
        public DropDownList cboServicios { get; set; }
        private string SQL;
        public GridView grdServicio { get; set; }
        public string error { get; private set; }
        #endregion

        #region Metodos

        public bool LlenarCombo()
        {
            //Se valida si el combo existe
            if (cboServicios == null)
            {
                error = "No definió el combo de Servicios";
                return false;
            }
            //Como es un procedimiento almacenado, sólo se define el nombre del SP
            SQL = "Servicios_LlenarCombo";
            //Creo la clase combo
            clsCombos oCombo = new clsCombos();
            //Pasar los parametros a la clase
            oCombo.SQL = SQL;
            oCombo.StoredProcedure = true;
            oCombo.ColumnaTexto = "Texto";
            oCombo.ColumnaValor = "Codigo";
            oCombo.cboGenericoWeb = cboServicios;
            if (oCombo.LlenarComboWeb())
            {
                //Llena el combo, libera memoria y retorna true
                cboServicios = oCombo.cboGenericoWeb;
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

        public bool LlenarGrid()
        {
            if (grdServicio == null)
            {
                error = "No definió el grid del servicio";
                return false;
            }
            SQL = "Servicio_LlenarGrid";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdServicio;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdServicio = oGrid.gridGenerico;
                oGrid = null;
                return true;
            }
            else
            {
                error = oGrid.Error;
                oGrid = null;
                return false;
            }
        }

        public bool Ingresar()
        {
            SQL = "Servicio_Insert";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigo", System.Data.SqlDbType.BigInt, 8, codigo);
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 30, nombre);
            oConexion.AgregarParametro("@prValor", System.Data.SqlDbType.Float, 8, valor);
            oConexion.StoredProcedure = true;
            if (oConexion.EjecutarSentencia())
            {
                oConexion = null;
                return true;
            }
            else
            {
                error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }

        public bool Actualizar()
        {
            SQL = "Servicio_Update";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigo", System.Data.SqlDbType.BigInt, 8, codigo);
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 30, nombre);
            oConexion.AgregarParametro("@prValor", System.Data.SqlDbType.Float, 8, valor);
            oConexion.StoredProcedure = true;
            if (oConexion.EjecutarSentencia())
            {
                oConexion = null;
                return true;
            }
            else
            {
                error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }

        public bool Borrar()
        {
            SQL = "Servicio_Delete";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigo", System.Data.SqlDbType.BigInt, 8, codigo);
            oConexion.StoredProcedure = true;
            if (oConexion.EjecutarSentencia())
            {
                oConexion = null;
                return true;
            }
            else
            {
                error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }

        public bool ConsultarPrecio()
        {
            SQL = "Servicios_ConsultarValorUnitario";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.StoredProcedure = true;
            oConexion.AgregarParametro("@prCodigo", System.Data.SqlDbType.Int, 4, codigo);
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
                    valor = oConexion.Reader.GetDouble(0);
                    //Cerrar conexion, liberar y retornar
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    error = "No existen Servicios con el código: " + codigo;
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return false;
                }
            }
            else
            {
                error = oConexion.Error;
                oConexion.CerrarConexion();
                oConexion = null;
                return false;
            }
        }
        #endregion
    }
}
