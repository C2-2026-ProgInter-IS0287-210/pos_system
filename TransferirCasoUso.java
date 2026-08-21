public class TransferirCasoUso {

    public void ejecutar(CuentaBancaria origen,
                         CuentaBancaria destino,
                         Money monto) {

        origen.transferir(destino, monto);
    }
}
