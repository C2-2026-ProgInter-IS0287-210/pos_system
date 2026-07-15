package main. java. com. pos. domain. clientes.entidades;
public class TarjetaRegalo {
    
    private String numero;
    private double saldo;
    private LocalDateTime fechaVencimiento;

    
    public TarjetaRegalo(String numero, double saldoInicial, LocalDateTime fechaVencimiento) {
        this.numero = numero;
        this.saldo = saldoInicial;
        this.fechaVencimiento = fechaVencimiento;
    }

    
    public void recargar(double monto) {
        
        if (LocalDateTime.now().isBefore(fechaVencimiento)) {
            this.saldo += monto;
            System.out.println("Tarjeta " + numero + " recargada con $" + monto + ". Nuevo saldo: $" + this.saldo);
        } else {
            System.out.println("No se puede recargar. La tarjeta regalo ya está vencida.");
        }
    }

    public boolean consumir(double monto) {
        
        if (LocalDateTime.now().isAfter(fechaVencimiento)) {
            System.out.println("Error: La tarjeta regalo ha vencido.");
            return false;
        }
        
        if (this.saldo >= monto) {
            this.saldo -= monto;
            System.out.println("Consumo de $" + monto + " aprobado. Saldo restante: $" + this.saldo);
            return true;
        } else {
            System.out.println("Saldo insuficiente en la tarjeta de regalo.");
            return false;
        }
    }

   
    public String getNumero() { return numero; }
    public double getSaldo() { return saldo; }
    public LocalDateTime getFechaVencimiento() { return fechaVencimiento; }
}