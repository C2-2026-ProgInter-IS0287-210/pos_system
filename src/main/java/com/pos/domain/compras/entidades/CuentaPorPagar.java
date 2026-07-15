package main.java.com.pos.domain.compras.entidades;
public class CuentaPorPagar {
    private Money monto;
    private Date fechaEmision;
    private Date fechaVencimiento;
    private EstadoPago estado;
    private Money saldoPendiente;

    public void pagar (Money monto){
        this.monto=monto;
    }
    public Money calcularInteresesMoratorio(){}
}