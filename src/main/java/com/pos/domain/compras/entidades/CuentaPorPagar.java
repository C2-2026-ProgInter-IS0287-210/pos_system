public class CuentaPorPagar {
    private Money monto;
    private Date fechaEmision;
    private Date fechaVencimiento;
    private EstadoPago estado;
    private Money saldoPendiente;

    public void pagar (Money monto){}
    public Money calcularInteresesMoratorio(){}
}