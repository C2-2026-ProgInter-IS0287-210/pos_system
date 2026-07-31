package com.pos.domain.compras.entidades;
import java.util.Date;
import com.pos.domain.compras.enumerados.EstadoPago;
import com.pos.domain.ventas.valueobjets.*;

public class CuentaPorPagar { 

    private Money monto;
    private Date fechaEmision;
    private Date fechaVencimiento;
    private EstadoPago estado;
    private Money saldoPendiente;

    public void getFechaEmision(Date fechaEmision) {
        this.fechaEmision = fechaEmision;
    }

    public void getFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public Money getSaldoPendiente() {  
        return saldoPendiente;
    }


    public void pagar (Money monto, Money saldoPendiente) {
        saldoPendiente = monto;
        estado = EstadoPago.PAGADO;
        System.out.println("Pago completado.");
    }
    public Money calcularInteresesMoratorio(){
        int diasMora = getFechaEmision(fechaEmision) - getFechaVencimiento(fechaVencimiento);
    
        if (diasMora <= 0) {
            return new Money(0);} 
            
            double interes = monto.getValor() * 0.0005 * diasMora;
            return new Money(interes);

}