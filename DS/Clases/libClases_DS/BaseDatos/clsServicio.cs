﻿using System;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;
using libComunes.CapaDatos;

namespace libClases_DS.BaseDatos
{
    public class clsServicio
    {
        #region Atributos/Metodos
        public Int32 codigo { get; set; }
        public string nombre { get; set; }
        public double valor { get; set; }
        private string SQL;
        public GridView grdServicio { get; set; }
        public string error { get; private set; }
        #endregion

        #region Metodos
        public bool LlenarGrid()
        {
            if (grdServicio == null)
            {
                error = "No definió el grid del servicio";
                return false;
            }
            SQL = "Servicio_LlenarGrid";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdServicio;
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdServicio = oGrid.gridGenerico;
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
            SQL = "Servicio_Insert";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigo", System.Data.SqlDbType.BigInt, 8, codigo);
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 30, nombre);
            oConexion.AgregarParametro("@prValor", System.Data.SqlDbType.Float, 8, valor);
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
            SQL = "Servicio_Update";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@prCodigo", System.Data.SqlDbType.BigInt, 8, codigo);
            oConexion.AgregarParametro("@prNombre", System.Data.SqlDbType.VarChar, 30, nombre);
            oConexion.AgregarParametro("@prValor", System.Data.SqlDbType.Float, 8, valor);
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
            SQL = "Servicio_Delete";
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
        #endregion
    }
}
