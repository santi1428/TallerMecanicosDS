using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using libComunes.CapaDatos;
using libComunes.CapaObjetos;
using System.Web.UI.WebControls;


namespace libClases_DS.BaseDatos
{
    public class clsPropietario
    {

        #region Atributos

        public Int32 Cedula { get; set; }
        public string Nombre { get; set; }
        public int Edad { get; set; }
        public string Telefono { get; set; }
        public GridView grdPropietario { get; set; }
        private string SQL;
        public string Error { get; private set; }

        #endregion

        public bool Consultar()
        {
            SQL = "Propietario_Consultar";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.StoredProcedure = true;
            oConexion.AgregarParametro("@prCedula", System.Data.SqlDbType.Int, 20, Cedula);
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
                    Edad = oConexion.Reader.GetInt32(1);
                    Telefono = oConexion.Reader.GetString(2);
                    
                    //Libera memoria
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    //No tiene filas, se levanta un error
                    Error = "El cliente con el Cedula " + Cedula +
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

        public bool LlenarGrid()
        {
            if (grdPropietario == null)
            {
                Error = "No definió el grid del propietario";
                return false;
            }
            SQL = "Propietario_LlenarGrid";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdPropietario;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdPropietario = oGrid.gridGenerico;
                oGrid = null;
                return true;
            }
            else
            {
                Error = oGrid.Error;
                oGrid = null;
                return false;
            }
        }

        public bool Ingresar()
        {
            SQL = "Propietario_Insert";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCedula", System.Data.SqlDbType.BigInt, 8, Cedula);
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 30, Nombre);
            oConexion.AgregarParametro("@prEdad", System.Data.SqlDbType.Int, 8, Edad);
            oConexion.AgregarParametro("@prTelefono", System.Data.SqlDbType.VarChar, 10, Telefono);
            oConexion.StoredProcedure = true;
            if (oConexion.EjecutarSentencia())
            {
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
            SQL = "Propietario_Update";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCedula", System.Data.SqlDbType.BigInt, 8, Cedula);
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 30, Nombre);
            oConexion.AgregarParametro("@prEdad", System.Data.SqlDbType.Int, 8, Edad);
            oConexion.AgregarParametro("@prTelefono", System.Data.SqlDbType.VarChar, 10, Telefono);
            oConexion.StoredProcedure = true;
            if (oConexion.EjecutarSentencia())
            {
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
            SQL = "Propietario_Delete";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCedula", System.Data.SqlDbType.BigInt, 8, Cedula);
            oConexion.StoredProcedure = true;
            if (oConexion.EjecutarSentencia())
            {
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


    }
}
