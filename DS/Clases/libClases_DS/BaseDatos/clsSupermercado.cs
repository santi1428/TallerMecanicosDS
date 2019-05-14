using System;
using libComunes.CapaDatos;

namespace libClases_DS.BaseDatos
{
    public class clsSupermercado
    {
        #region "Atributos/Propiedades"
        public string Nit { get; set; }
        public string Nombre { get; set; }
        public string SitioWEB { get; set; }
        private string SQL;
        public string Error { get; private set; }
        #endregion
        #region "Metodos"
        public bool Ingresar()
        {
            //if (validar())
            SQL = "INSERT INTO tblSupermercado (strNit_SUPE, strNombre_SUPE, strSitioWeb_SUPE) " +
                      "VALUES (@prNIT, @prNombre, @prSitioWEB)";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prNIT", Nit);
            oConexion.AgregarParametro("@prNombre", Nombre);
            oConexion.AgregarParametro("@prSitioWEB", SitioWEB);

            if (oConexion.EjecutarSentencia())
            {
                //Grabó en la base de datos
                oConexion = null;
                return true;
            }
            else
            {
                Error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        public bool Actualizar()
        {
            SQL = "UPDATE tblSupermercado " +
                      "SET      strNombre_SUPE = @prNombre, " +
                                  "strSitioWeb_SUPE = @prSitioWEB " +
                      "WHERE strNit_SUPE = @prNIT";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prNIT", Nit);
            oConexion.AgregarParametro("@prNombre", Nombre);
            oConexion.AgregarParametro("@prSitioWEB", SitioWEB);

            if (oConexion.EjecutarSentencia())
            {
                //Grabó en la base de datos
                oConexion = null;
                return true;
            }
            else
            {
                Error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        public bool Borrar()
        {
            SQL = "DELETE FROM tblSupermercado " +
                      "WHERE strNit_SUPE = @prNIT";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prNIT", Nit);

            if (oConexion.EjecutarSentencia())
            {

                //Grabó en la base de datos
                oConexion = null;
                return true;
            }
            else
            {
                Error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        public bool Consultar()
        {
            SQL = "SELECT   strNombre_SUPE, strSitioWeb_SUPE " +
                  "FROM     tblSupermercado " +
                  "WHERE    strNit_SUPE = @prNIT";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prNIT", Nit);
            //Se invoca el método consultar
            if (oConexion.Consultar())
            {
                //Se verifica si hay datos
                if (oConexion.Reader.HasRows)
                {
                    //Tiene filas, se debe leer la información
                    oConexion.Reader.Read();
                    //Se captura la información
                    Nombre = oConexion.Reader.GetString(0);
                    SitioWEB = oConexion.Reader.GetString(1);
                    //Libera memoria
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    //No tiene filas, se levanta un error
                    Error = "El supermeracado con el nit " + Nit +
                        " no está en la base de datos. \nVerifique la información " +
                        "o ingréselo al sistema";
                    //Cerrar la conexión
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return false;
                }
            }
            else
            {
                Error = oConexion.Error;
                //Se debe cerrar la conexión
                oConexion.CerrarConexion();
                oConexion = null;
                return false;
            }
        }
        #endregion
    }
}
