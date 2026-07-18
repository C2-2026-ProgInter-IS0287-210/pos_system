package main. java. com. pos. domain. clientes.entidades;
import java.time.LocalDateTime;
public class CuentaCredito {
   
    private double limiteCredito;
    private double saldo;
    private LocalDateTime fechaCorte;

    
    public CuentaCredito(double limiteCredito, double saldoInicial, LocalDateTime fechaCorte) {
        this.limiteCredito = limiteCredito;
        this.saldo = saldoInicial;
        this.fechaCorte = fechaCorte;
    }

    
    public void enviarEstadoCuenta() {
        System.out.println("--- ESTADO DE CUENTA DE CRÉDITO ---");
        System.out.println("Límite de Crédito: $" + limiteCredito);
        System.out.println("Saldo deudor actual: $" + saldo);
        System.out.println("Fecha de corte próxima: " + fechaCorte);
    }

    public void realizarPago(double monto) {
        if (monto > 0) {
            this.saldo -= monto; 
            System.out.println("Pago de $" + monto + " recibido. Nuevo saldo deudor: $" + this.saldo);
        }
    }

    public double calcularInteres() {
    
        double tasaInteres = 0.05;
        if (this.saldo > 0) {
            return this.saldo * tasaInteres;
        }
        return 0.0;
    }

    
    public double getLimiteCredito() { return limiteCredito; }
    public double getSaldo() { return saldo; }
    public LocalDateTime getFechaCorte() { return fechaCorte; }
}