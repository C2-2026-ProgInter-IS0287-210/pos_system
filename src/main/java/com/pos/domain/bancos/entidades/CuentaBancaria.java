public class CuentaBancaria {
    private String numero;
    private String entidad;
    private String tipo;
    private Money saldo;
    private String moneda;

    public void depositar(Money monto){}
    public void retirar(Money monto) {}
    public void transferir (CuentaBancaria destino, Money monto){}
    public Money consultarSaldo(){}
}