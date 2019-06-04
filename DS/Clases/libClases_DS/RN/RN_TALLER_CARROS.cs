using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace Clases_taller.RN
{
   public class RN_TALLER_CARROS
    {
        #region "Atributos/Propiedades"
        public double valor { get; set; }
        public double PorcentajeDescuento { get; private set; }
        public string Error { get; private set; }
        #endregion
        #region "Metodos"
        private bool Validar()
        {
            if (valor <= 0)
            {
                Error = "No definió correctamente el valor del servicio";
                return false;
            }
            
            return true;
        }
        public bool CalcularPorcentajeDescuento()
        {
            if (Validar())
            {
                try
                {
                    XmlDocument oDocumento = new XmlDocument();
                   
                    oDocumento.Load(@"C:\Users\santi\Desktop\TallerMecanicosDS\DS\Clases\libClases_DS\XML\RN_TALLER.xml");
                    
                    XmlNodeList oNodos = oDocumento.SelectNodes("/DESCUENTO_SERVICIO/DESCUENTO" +
                                        "[@VALOR_MIN<=" + valor +" and @VALOR_MAX>=" + valor + "]");


                    if (oNodos.Count == 1)
                    {
                        PorcentajeDescuento = Convert.ToDouble(oNodos[0].InnerText) / 100.0;
                        oDocumento = null;
                        oNodos = null;
                        return true;
                    }
                    else
                    {
                        Error = "La consulta no devolvió un valor válido. " +
                                "Por favor comuníquese con el administrador de la BD";
                        oDocumento = null;
                        oNodos = null;
                        return false;
                    }
                }
                catch (Exception ex)
                {
                    Error = ex.Message;
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        #endregion
    }
}
