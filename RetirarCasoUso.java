
public class RetirarCasoUso {

    public void ejecutar(CuentaBancaria cuenta,
                         Money monto) {

        cuenta.retirar(monto);
    }
}
