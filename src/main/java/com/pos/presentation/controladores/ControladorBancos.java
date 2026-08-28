public class ControladorBancos {

    private DepositarCasoUso depositarCasoUso;
    private RetirarCasoUso retirarCasoUso;
    private TransferirCasoUso transferirCasoUso;
    private RegistrarPagoProveedorCasoUso registrarPagoProveedorCasoUso;

    public ControladorBancos() {
        depositarCasoUso = new DepositarCasoUso();
        retirarCasoUso = new RetirarCasoUso();
        transferirCasoUso = new TransferirCasoUso();
        registrarPagoProveedorCasoUso = new RegistrarPagoProveedorCasoUso();
    }

    public void depositar(CuentaBancaria cuenta, Money monto) {
        depositarCasoUso.ejecutar(cuenta, monto);
    }

    public void retirar(CuentaBancaria cuenta, Money monto) {
        retirarCasoUso.ejecutar(cuenta, monto);
    }

    public void transferir(CuentaBancaria origen, CuentaBancaria destino, Money monto) {
        transferirCasoUso.ejecutar(origen, destino, monto);
    }

    public void registrarPagoProveedor(CuentaPorPagar cuentaPorPagar, CuentaBancaria cuentaBancaria, Money monto) {
        registrarPagoProveedorCasoUso.ejecutar(
                cuentaPorPagar,
                cuentaBancaria,
                monto
        );
    }
}