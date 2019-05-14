using System;
using libComunes.CapaDatos;
using System.Web.UI.WebControls;//para poder tener el dropdownlist, y llenar el combo
using libComunes.CapaObjetos;//Para poder invocar la clase de clsCombos

namespace libClases_DS.BaseDatos
{
    public class clsPais
    {
        #region "Atributos/Propiedades"
        public Int32 Codigo { get; set; }
        public string Nombre { get; set; }
        public bool Activo { get; set; }
        private string SQL;
        public string Error { get; private set; }
        //Se agrega la propiedad de cboPais, para recibir el combo vacío y devolverlo lleno
        public DropDownList cboPais { get; set; }
        #endregion
        #region "Metodos"
        public bool LlenarCombo()
        {
            //Se valida si el combo existe
            if (cboPais == null)
            {
                Error = "No definió el combo de país";
                return false;
            }
            //Como es un procedimiento almacenado, sólo se define el nombre del SP
            SQL = "PAIS_LlenarCombo";
            //Creo la clase combo
            clsCombos oCombo = new clsCombos();
            //Pasar los parametros a la clase
            oCombo.SQL = SQL;
            oCombo.StoredProcedure = true;
            oCombo.ColumnaTexto = "Texto";
            oCombo.ColumnaValor = "Codigo";
            oCombo.cboGenericoWeb = cboPais;
            if (oCombo.LlenarComboWeb())
            {
                //Llena el combo, libera memoria y retorna true
                cboPais = oCombo.cboGenericoWeb;
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
        public bool Ingresar()
        {
            SQL = "INSERT INTO tblPais (strNombre_PAIS, blnActivo_PAIS) " +
                  "VALUES (@prNombre, @prActivo)";

            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prNombre", Nombre);
            oConexion.AgregarParametro("@prActivo", Activo);

            if(oConexion.EjecutarSentencia())
            {
                //Ejecutó la sentencia, liberar memoria y retornar true
                oConexion = null;
                return true;
            }
            else
            {
                //Lee el error, libera y retorna false
                Error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        public bool Actualizar()
        {
            SQL = "UPDATE   tblPais " +
                  "SET      strNombre_PAIS = @prNombre, " +
                           "blnActivo_PAIS = @prActivo " +
                  "WHERE    intCodigo_PAIS = @prCodigo";

            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prNombre", Nombre);
            oConexion.AgregarParametro("@prActivo", Activo);
            oConexion.AgregarParametro("@prCodigo", Codigo);

            if (oConexion.EjecutarSentencia())
            {
                //Ejecutó la sentencia, liberar memoria y retornar true
                oConexion = null;
                return true;
            }
            else
            {
                //Lee el error, libera y retorna false
                Error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        public bool Borrar()
        {
            SQL = "DELETE FROM tblPais " +
                  "WHERE    intCodigo_PAIS = @prCodigo";

            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigo", Codigo);

            if (oConexion.EjecutarSentencia())
            {
                //Ejecutó la sentencia, liberar memoria y retornar true
                oConexion = null;
                return true;
            }
            else
            {
                //Lee el error, libera y retorna false
                Error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        public bool Consultar()
        {
            SQL = "SELECT       strNombre_PAIS, blnActivo_PAIS " +
                      "FROM          tblPais " +
                      "WHERE        intCodigo_PAIS = @prCodigo";

            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigo", Codigo);

            if (oConexion.Consultar())
            {
                //Se utiliza el objeto Reader... Propiedad HasRows, y métodos Get
                if (oConexion.Reader.HasRows)
                {
                    //Se lee el reader con el metodo Read
                    oConexion.Reader.Read();
                    //Se capturan los datos
                    Nombre = oConexion.Reader.GetString(0);
                    Activo = oConexion.Reader.GetBoolean(1);
                    //Cerrar y liberar
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    //No hay datos, se levanta un error
                    Error = "No hay datos para el país de código: " + Codigo;
                    //Cerrar y liberar
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return false;
                }
            }
            else
            {
                Error = oConexion.Error;
                //Cerrar conexión
                oConexion.CerrarConexion();
                oConexion = null;
                return false;
            }
        }
        #endregion
    }
}
