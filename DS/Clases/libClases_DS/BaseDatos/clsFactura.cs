using System;
using System.Web.UI.WebControls;
using libComunes.CapaDatos;
using libComunes.CapaObjetos;


namespace libClases_DS.BaseDatos
{
    public class clsFactura
    {
        #region "Atributos/Propiedades"
        public Int32 NumeroFactura { get; set; }
        public Int32 Cedula { get; set; }
        public DateTime Fecha { get; private set; }
        public string Nombre { get; set; }
        public Int32 Vendedor { get; set; }
        public Int32 Producto { get; set; }
        public Int32 Cantidad { get; set; }
        public Int32 ValorUnitario { get; set; }
        public Int32 Total { get; set; }
        public GridView grdFactura { get; set; }
        private string SQL;
        public string Error { get; private set; }
        #endregion
        #region "Metodos"
        public bool Grabar()
        {
            if (NumeroFactura <= 0)
            {
                if (!GrabarEncabezado())
                {
                    return false;
                }
            }
            if (GrabarDetalle())
            {
                if (CalcularTotal()) { return true; } else { return false; }
            }
            else
            {
                return false;
            }
        }
        private bool GrabarEncabezado()
        {
            SQL = "Factura_GrabarEncabezado";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.StoredProcedure = true;
            oConexion.AgregarParametro("@prCedulaPropietario", System.Data.SqlDbType.BigInt, 20, Cedula);
            oConexion.AgregarParametro("@prVendedor", System.Data.SqlDbType.Int, 4, Vendedor);
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
                    NumeroFactura = oConexion.Reader.GetInt32(0);
                    //Cerrar conexion, liberar y retornar
                    Error = " el número de factura: "+NumeroFactura;
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    Error = "No pudo generar el número de factura";
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
        private bool GrabarDetalle()
        {
            SQL = "Factura_GrabarDetalle";
            clsConexion oConexion = new clsConexion();

            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prNroFactura", System.Data.SqlDbType.Int, 4, NumeroFactura);
            oConexion.AgregarParametro("@prProducto", System.Data.SqlDbType.Int, 4, Producto);
            oConexion.AgregarParametro("@prCantidad", System.Data.SqlDbType.Int, 4, Cantidad);
            oConexion.AgregarParametro("@prValorUnitario", System.Data.SqlDbType.Int, 4, ValorUnitario);
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 50, Nombre);
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
        private bool CalcularTotal()
        {
            SQL = "Factura_CalcularTotal";

            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.StoredProcedure = true;
            oConexion.AgregarParametro("@prFactura", System.Data.SqlDbType.Int, 20, NumeroFactura);
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
                    Total = oConexion.Reader.GetInt32(0);
                    //Cerrar conexion, liberar y retornar
                    oConexion.CerrarConexion();
                    oConexion = null;
                    return true;
                }
                else
                {
                    Error = "No pudo consultar el total de la factura: " + NumeroFactura;
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
        public bool LlenarGrid()
        {
            if (grdFactura == null)
            {
                Error = "No definió el grid de la Factura";
                return false;
            }
            SQL = "Factura_LlenarGrid";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.StoredProcedure = true;
            oGrid.AgregarParametro("@prNumeroFactura", NumeroFactura);
            oGrid.gridGenerico = grdFactura;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdFactura = oGrid.gridGenerico;
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
