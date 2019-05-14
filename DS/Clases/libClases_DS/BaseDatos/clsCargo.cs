using System;
using libComunes.CapaDatos;

namespace libClases_DS.BaseDatos
{
    public class clsCargo
    {
        #region Propiedades/Atributos
        public Int32 Codigo { get; set; }
        public string Nombre { get; set; }
        public double Salario { get; set; }
        private string SQL;
        public string Error { get; private set; }
        #endregion
        #region Metodos
        public bool Insertar()
        {
            SQL = "INSERT INTO tblCargo(strNombre_CARG, intSalario_CARG) " +
                  "VALUES (@prNombre, @prSalario)";
            //Se crea la instancia de la clase conexión
            clsConexion oConexion = new clsConexion();
            oConexion.AgregarParametro("@prNombre", Nombre);
            oConexion.AgregarParametro("@prSalario", Salario);
            oConexion.SQL = SQL;
            if (oConexion.EjecutarSentencia())
            {
                //Ejecutó la sentencia correctamente, libera memoria y retorna true
                oConexion = null;
                return true;
            }
            else
            {
                //No ejecutó, lee el error, libera y retorna false
                Error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        public bool Actualizar()
        {
            SQL = "UPDATE   tblCargo " +
                  "SET      strNombre_CARG=@prNombre, " +
                           "intSalario_CARG=@prSalario " +
                  "WHERE    intCodigo_CARG=@prCodigo";
            //Se crea la instancia de la clase conexión
            clsConexion oConexion = new clsConexion();
            oConexion.AgregarParametro("@prCodigo", Codigo);
            oConexion.AgregarParametro("@prNombre", Nombre);
            oConexion.AgregarParametro("@prSalario", Salario);
            oConexion.SQL = SQL;
            if (oConexion.EjecutarSentencia())
            {
                //Ejecutó la sentencia correctamente, libera memoria y retorna true
                oConexion = null;
                return true;
            }
            else
            {
                //No ejecutó, lee el error, libera y retorna false
                Error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        public bool Borrar()
        {
            SQL = "DELETE FROM   tblCargo " +
                  "WHERE    intCodigo_CARG=@prCodigo";
            //Se crea la instancia de la clase conexión
            clsConexion oConexion = new clsConexion();
            oConexion.AgregarParametro("@prCodigo", Codigo);
            oConexion.SQL = SQL;
            if (oConexion.EjecutarSentencia())
            {
                //Ejecutó la sentencia correctamente, libera memoria y retorna true
                oConexion = null;
                return true;
            }
            else
            {
                //No ejecutó, lee el error, libera y retorna false
                Error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        public bool Consultar()
        {
            SQL = "SELECT       strNombre_CARG, intSalario_CARG " +
                  "FROM         tblCargo " +
                  "WHERE        intCodigo_CARG=@prCodigo";
            //Se crea la instancia de la clase conexión
            clsConexion oConexion = new clsConexion();
            oConexion.AgregarParametro("@prCodigo", Codigo);
            oConexion.SQL = SQL;
            if (oConexion.Consultar())
            {
                //Revisar si hay datos.
                if (oConexion.Reader.HasRows)
                {
                    //Hay datos, hay que leer la información
                    oConexion.Reader.Read();//Lee una fila de los datos
                    //Se leen los datos
                    Nombre = oConexion.Reader.GetString(0);
                    Salario = oConexion.Reader.GetInt32(1);
                    //Se cierra la conexión 
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    //No hay datos, se debe generar un error
                    Error = "No se encontraron datos para el código de cargo: " + Codigo;
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return false;
                }
            }
            else
            {
                //Capturar el error, cerrar conexión, liberar memoria y retornar false
                Error = oConexion.Error;
                oConexion.CerrarConexion();
                oConexion = null;
                return false;
            }
        }
        #endregion
    }
}
