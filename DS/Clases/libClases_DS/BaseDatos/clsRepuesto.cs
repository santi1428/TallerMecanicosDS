﻿using System;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;
using libComunes.CapaDatos;
namespace libClases_DS.BaseDatos
{
    public class clsRepuesto
    {
        #region Atributos/Metodos
        public Int32 codigo { get; set; }
        public string nombre { get; set; }
        public double valor { get; set; }
        public string fecha { get; set; }
        public Int32 nit { get; set; }
        private string SQL;
        public GridView grdRepuesto { get; set; }
        public DropDownList cboRepuesto { get; set; }
        public string error { get; private set; }
        #endregion

        #region Metodos
        public bool LlenarGrid()
        {
            if (grdRepuesto == null)
            {
                error = "No definió el grid del repuesto";
                return false;
            }
            SQL = "Repuesto_LlenarGrid";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdRepuesto;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdRepuesto = oGrid.gridGenerico;
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
            SQL = "Repuesto_Insert";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigo", System.Data.SqlDbType.BigInt, 8, codigo);
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 30, nombre);
            oConexion.AgregarParametro("@prValor", System.Data.SqlDbType.Float, 8, valor);
            oConexion.AgregarParametro("@prFecha", System.Data.SqlDbType.VarChar, 10, fecha);
            oConexion.AgregarParametro("@prNIT", System.Data.SqlDbType.BigInt, 8, nit);
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
            SQL = "Repuesto_Update";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigo", System.Data.SqlDbType.BigInt, 8, codigo);
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 30, nombre);
            oConexion.AgregarParametro("@prValor", System.Data.SqlDbType.Float, 8, valor);
            oConexion.AgregarParametro("@prFecha", System.Data.SqlDbType.VarChar, 10, fecha);
            oConexion.AgregarParametro("@prNIT", System.Data.SqlDbType.BigInt, 8, nit);
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
            SQL = "Repuesto_Delete";
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


        public bool LlenarCombo()
        {
            //Se valida si el combo existe
            if (cboRepuesto == null)
            {
                error = "No definió el combo de Repuesto";
                return false;
            }
            //Como es un procedimiento almacenado, sólo se define el nombre del SP
            SQL = "Repuesto_LlenarCombo";
            //Creo la clase combo
            clsCombos oCombo = new clsCombos();
            //Pasar los parametros a la clase
            oCombo.SQL = SQL;
            oCombo.StoredProcedure = true;
            oCombo.ColumnaTexto = "Texto";
            oCombo.ColumnaValor = "Codigo";
            oCombo.cboGenericoWeb = cboRepuesto;
            if (oCombo.LlenarComboWeb())
            {
                //Llena el combo, libera memoria y retorna true
                cboRepuesto = oCombo.cboGenericoWeb;
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

        public bool ConsultarPrecio()
        {
            SQL = "Repuesto_ConsultarValorUnitario";

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
                    error = "No existen Repuesto con el código: " + codigo;
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
