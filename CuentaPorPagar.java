package com.pos.domain.compras.entidades;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import com.pos.domain.compras.enumerados.EstadoPago;
import com.pos.domain.ventas.valueobjets.*;

public class CuentaPorPagar { 

    private Money monto;
    private Date fechaEmision;
    private Date fechaVencimiento;
    private EstadoPago estado;
    private Money saldoPendiente;
    
    public CuentaPorPagar (Money monto, LocalDate fechaEmision, LocalDate fechaVencimiento) {

         this.monto = monto;
         this.fechaEmision = fechaEmision;
         this.fechaVencimiento = fechaVencimiento;

         this.saldoPendiente = monto;
         this.estado = EstadoPago.PENDIENTE;
     }

    public void pagar(Money monto) {
        saldoPendiente = saldoPendiente.restar(monto);
        fechaPago = LocalDate.now();

        if (saldoPendiente.getValor() <= 0) {
            saldoPendiente = new Money(0);
            estado = EstadoPago.PAGADO;
        } else {
            estado = EstadoPago.PENDIENTE;
        }
    }
    
    public Money calcularInteresMoratorio() {

            if (fechaPago == null) {
                return new Money(0);
            }
            if (!fechaPago.isAfter(fechaVencimiento)) {
                return new Money(0);
            }
            long diasMora = ChronoUnit.DAYS.between(
                    fechaVencimiento,
                    fechaPago
            );
            double tasaInteres = 0.0005;
            double interes = monto.getValor()
                    * tasaInteres
                    * diasMora;
            return new Money(interes);
        }
    }

}
