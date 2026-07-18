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

    public void setMonto(Money monto) {
        this.monto = monto;
    }
    public Money getMonto() {
        return monto;
    }
    public void setFechaEmision(Date fechaEmision) {
        this.fechaEmision = fechaEmision;
    }
    public Date getFechaEmision() {
        return fechaEmision;
    } 
    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }
    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }
    public void setSaldoPendiente(Money saldoPendiente) {
        this.saldoPendiente = saldoPendiente;
    }
    public Money getSaldoPendiente() {  
        return saldoPendiente;
    }


    public void pagar (Money monto, Money saldoPendiente) {
        if (monto.getMonto() > 0) {
            this.saldoPendiente = saldoPendiente;
        }else {
            throw new IllegalArgumentException("El monto a pagar debe ser mayor a cero.");
        }
    }
    public Money calcularInteresesMoratorio(){
        return getSaldoPendiente();
    }
}