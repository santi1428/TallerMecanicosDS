using System;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;
using libComunes.CapaDatos;

namespace libClases_DS.BaseDatos
{
    public class clsDepartamento
    {
        #region Atributos/Propiedades
        public Int32 Codigo { get; set; }
        public string Nombre { get; set; }
        public bool Activo { get; set; }
        public Int32 Pais { get; set; }
        private string SQL;
        public GridView grdDepartamento { get; set; }
        public string Error { get; private set; }
        #endregion
        #region Metodos
        public bool Ingresar()
        {
            SQL = "Departamento_Insert";
            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 50, Nombre);
            oConexion.AgregarParametro("@prActivo", System.Data.SqlDbType.Bit, 1, Activo);
            oConexion.AgregarParametro("@prPais", System.Data.SqlDbType.Int, 4, Pais);
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
            SQL = "Departamento_Update";
            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 50, Nombre);
            oConexion.AgregarParametro("@prActivo", System.Data.SqlDbType.Bit, 1, Activo);
            oConexion.AgregarParametro("@prPais", System.Data.SqlDbType.Int, 4, Pais);
            oConexion.AgregarParametro("@prCodigoDepartamento", System.Data.SqlDbType.Int, 4, Codigo);
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
            SQL = "Departamento_Delete";
            clsConexion oConexion = new clsConexion();
            
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigoDepartamento", System.Data.SqlDbType.Int, 4, Codigo);
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
        public bool Consultar()
        {
            Error = "Método no implementado";
            return false;
        }
        public bool LlenarGrid()
        {
            if (grdDepartamento==null)
            {
                Error = "No definió el grid del departamento";
                return false;
            }
            SQL = "Departamento_LlenarGrid";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdDepartamento;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdDepartamento = oGrid.gridGenerico;
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
        #endregion
    }
}
