public class DepositarCasoUso {
    public void ejecutar(CuentaBancaria cuenta, Money monto) {
        cuenta.depositar(monto);
    }
}