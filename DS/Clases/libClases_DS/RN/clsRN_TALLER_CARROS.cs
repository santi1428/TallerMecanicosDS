using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clases_taller.RN
{
    public class clsRN_TALLER_CARROS
    {
        #region atributos
        public double ValorServicios { get; set; }
        public double PorcentajeDescuento { get; set; }
        public double ValorTotal { get; private set; }
        public double ValorDescuento { get; private set; }
        public string Error { get; private set; }
        #endregion

        #region metodos
        public bool Calcular() {
            if (Validar())
            {
                if (CalcularPorcentaje()) {
                    CalcularTotal();
                    CalcularValorDescuento();
                    return true;
                }
                else
                {
                    return false;
                }

            }
            else {

                return false;
            }

        }
        private void CalcularTotal() {
            ValorTotal = ValorServicios * (1-PorcentajeDescuento);
        }

        private void CalcularValorDescuento() {
            ValorDescuento = ValorServicios * PorcentajeDescuento;
        }

        private bool CalcularPorcentaje() {
            RN_TALLER_CARROS oRN = new RN_TALLER_CARROS();
            oRN.valor = ValorServicios;
            if (oRN.CalcularPorcentajeDescuento())
            {
                PorcentajeDescuento = oRN.PorcentajeDescuento;
                oRN = null;
                return true;
            }
            else
            {
                Error = oRN.Error;
                oRN = null;
                return false;
            }
        }

        private bool Validar() {
            if (ValorServicios < 0 || ValorServicios > 99999999)
            {
                Error = "El valor total de los servicios esta mal definido";
                return false;
            }
            else
            {
                return true;
            }

        }

        #endregion
    }
}
