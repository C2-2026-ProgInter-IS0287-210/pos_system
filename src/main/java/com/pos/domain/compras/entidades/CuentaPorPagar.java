public class CuentaPorPagar {
    private Money monto;
    private DateTime fechaEmision;
    private DateTime fechaVencimiento;
    private EstadoPago estado;
    private Money saldoPendiente;

    public void pagar (Money monto){}
    public Money calcularInteresesMoratorio(){}
}