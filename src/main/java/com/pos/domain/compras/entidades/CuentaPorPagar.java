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

    public void pagar (Money monto){
        this.monto=monto;
    }
    public Money calcularInteresesMoratorio(){
        this.saldoPendiente=this.saldoPendiente;
        return this.saldoPendiente;
    }
}