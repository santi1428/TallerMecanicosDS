using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using libComunes.CapaDatos;


namespace libClases_DS.BaseDatos
{
    public class clsCarro
    {

        #region Atributos

        public string Placa { get; set; }
        public string Nombre { get; set; }
        public int Modelo { get; set; }
        public Int32 CodMarca { get; set; }
        public string Fecha { get; set; }
        public Int64 CedPro { get; set; }
        private string SQL;
        public string Error { get; private set; }

        #endregion

        public bool ConsultarPlaca()
        {
            SQL = "Carro_ConsultarPlaca";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.StoredProcedure = true;
            oConexion.AgregarParametro("@prPlaca", System.Data.SqlDbType.VarChar, 6, Placa);
            //Se invoca el método consultar
            if (oConexion.Consultar())
            {
                //Se verifica si hay datos
                if (oConexion.Reader.HasRows)
                {
                    //Tiene filas, se debe leer la información
                    oConexion.Reader.Read();
                    //Se captura la información
                    Nombre = oConexion.Reader.GetString(1);
                    CedPro= oConexion.Reader.GetInt64(0);
                    

                    //Libera memoria
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    //No tiene filas, se levanta un error
                    Error = "El carro con placa " + Placa +
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
    }
}
