using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using libComunes.CapaDatos;

namespace libComunes.CapaObjetos
{
    public class clsGrid
    {
        #region "Constructor"
        public clsGrid()
        {
            strNombreTabla = "Tabla_Grid";
            oParametro = new SqlParameter();
            oCommand = new SqlCommand();
        }
        ~clsGrid()
        {
            if (oParametro != null) oParametro = null;
            if (oCommand != null) oCommand = null;
        }
        #endregion

        #region "Atributos"
        private string strNombreTabla;
        private string strSQL;
        private string strError;
        private GridView grdGenerico;
        private SqlCommand oCommand;
        public bool StoredProcedure { get; set; }
        private SqlParameter oParametro;
        #endregion

        #region "Propiedades"
            public GridView gridGenerico
            {
                get
                {
                    return grdGenerico;
                }
                set
                {
                    grdGenerico = value;
                }
            }

            public string NombreTabla
            {
                get
                {
                    return strNombreTabla;
                }
                set
                {
                    strNombreTabla = value;
                }
            }

            public string SQL
            {
                get
                {
                    return strSQL;
                }
                set
                {
                    strSQL = value;
                }
            }

            public string Error
            {
                get
                {
                    return strError;
                }
            }
        #endregion

        #region "Metodos Publicos"
        public bool LlenarGridWeb()
        {
            if (grdGenerico == null)
            {
                strError = "No ha definido el grid que se va a llenar";
                return false;
            }
            if (strSQL == "")
            {
                strError = "Debe definir una instrucción SQL";
                return false;
            }

            clsConexion objConexionBd = new clsConexion();
            if (string.IsNullOrEmpty( strNombreTabla ))
            {
                strNombreTabla = "Tabla";
            }
            objConexionBd.NombreTabla = strNombreTabla;
            objConexionBd.StoredProcedure = StoredProcedure;
            objConexionBd.SQL = strSQL;

            if (objConexionBd.LlenarDataSet())
            {
                grdGenerico.DataSource = objConexionBd.DATASET.Tables[strNombreTabla];
                grdGenerico.DataBind();
                objConexionBd.CerrarConexion();
                objConexionBd = null;
                return true;
            }
            else
            {
                strError = objConexionBd.Error;
                objConexionBd.CerrarConexion();
                objConexionBd = null;
                return false;
            }
        }
        public bool AgregarParametro(string NombreParametro, object Valor)
        {
            try
            {
                oParametro.ParameterName = NombreParametro;
                oParametro.Value = Valor;
                oCommand.Parameters.Add(oParametro);
                oParametro = new SqlParameter();
                return (true);
            }
            catch (Exception ex)
            {
                strError = ex.Message;
                return (false);
            }
        }

        #endregion
    }
}
