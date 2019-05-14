using System;
using System.Web.UI.WebControls;
using libComunes.CapaDatos;
using libComunes.CapaObjetos;

namespace libClases_DS.BaseDatos
{
    public class clsEmpleado
    {
        #region "Atributos/Propiedades"
        public string Documento { get; set; }
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        private string SQL;
        public DropDownList cboEmpleado { get; set; }
        public string Error { get; private set; }
        #endregion
        #region "Metodos"
        public bool Ingresar()
        {
            SQL = "INSERT INTO tblEmpleado (strDocumento_EMPL, strNombre_EMPL, strPrimerApellido_EMPL, " +
                       "strSegundoApellido_EMPL, strDireccion_EMPL, strTelefono_EMPL) " +
            "VALUES (@prDocumento, @prNombre, @prPrimerApellido, @prSegundoApellido, @prDireccion, @prTelefono)";

            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prDocumento", Documento);
            oConexion.AgregarParametro("@prNombre", Nombre);
            oConexion.AgregarParametro("@prPrimerApellido", PrimerApellido);
            oConexion.AgregarParametro("@prSegundoApellido", SegundoApellido);
            oConexion.AgregarParametro("@prDireccion", Direccion);
            oConexion.AgregarParametro("@prTelefono", Telefono);

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
        public bool Actualizar()
        {
            SQL = "UPDATE   tblEmpleado " +
                      "SET          strNombre_EMPL=@prNombre, " +
                                    "strPrimerApellido_EMPL=@prPrimerApellido," +
                                    "strSegundoApellido_EMPL=@prSegundoApellido," +
                                    "strDireccion_EMPL=@prDireccion," +
                                    "strTelefono_EMPL=@prTelefono " +
                      "WHERE    strDocumento_EMPL=@prDocumento";

            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prDocumento", Documento);
            oConexion.AgregarParametro("@prNombre", Nombre);
            oConexion.AgregarParametro("@prPrimerApellido", PrimerApellido);
            oConexion.AgregarParametro("@prSegundoApellido", SegundoApellido);
            oConexion.AgregarParametro("@prDireccion", Direccion);
            oConexion.AgregarParametro("@prTelefono", Telefono);

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
            SQL = "DELETE FROM tblEmpleado " +
                       "WHERE    strDocumento_EMPL=@prDocumento";

            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prDocumento", Documento);
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
            SQL = "SELECT        strNombre_EMPL, strPrimerApellido_EMPL, " +
                                            "strSegundoApellido_EMPL, strDireccion_EMPL, strTelefono_EMPL " +
                       " FROM       tblEmpleado " +
                       " WHERE    strDocumento_EMPL=@prDocumento";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prDocumento", Documento);
            //Ejecuta consultar
            if (oConexion.Consultar())
            {
                //Guarda los datos en un objeto Reader, permite leer los datos hacia adelante (Cada fila)
                //En cada fila, el READER maneja los datos como un vector.
                //Lo primero que se revisa es si hay datos.
                if(oConexion.Reader.HasRows)
                {
                    //Se debe leer el Reader
                    oConexion.Reader.Read();
                    //Se leen los datos por posición y tipo de dato
                    Nombre = oConexion.Reader.GetString(0);
                    PrimerApellido = oConexion.Reader.GetString(1);
                    SegundoApellido = oConexion.Reader.GetString(2);
                    Direccion = oConexion.Reader.GetString(3);
                    Telefono = oConexion.Reader.GetString(4);
                    //Cerrar conexion, liberar y retornar
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    Error = "No existen empleados con el documento: " + Documento;
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
        public bool LlenarCombo()
        {
            SQL = "Empleado_LlenarCombo";

            //Se crea la instancia del objeto combo
            clsCombos oCombo = new clsCombos();
            oCombo.StoredProcedure = true;
            oCombo.SQL = SQL;
            //Se pasa el combo pais
            oCombo.cboGenericoWeb = cboEmpleado;
            oCombo.NombreTabla = "Tabla";
            //La columna texto es el nombre de la columna que el combo a mostrar
            oCombo.ColumnaTexto = "Texto";
            //La columna valor, es el  nombre de la columna que quiero capturar en la interfaz
            oCombo.ColumnaValor = "Valor";
            //Se invoca el combo y se lee
            if (oCombo.LlenarComboWeb())
            {
                //Si lo llenó, lee el combo lleno y lo asigna a la propiedad cboPaises
                cboEmpleado = oCombo.cboGenericoWeb;
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
