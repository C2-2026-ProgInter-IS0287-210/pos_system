public class RegistrarPagoProveedorCasoUso {

    public void ejecutar(CuentaPorPagar cuentaPorPagar,
                         CuentaBancaria cuentaBancaria,
                         Money monto) {

        if (monto.getValor() > cuentaBancaria.consultarSaldo().getValor()) {

            System.out.println("Saldo bancario insuficiente.");

            return;
        }

        cuentaPorPagar.pagar(monto);

        cuentaBancaria.retirar(monto);
    }
}