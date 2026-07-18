package main. java. com. pos. domain. clientes.entidades;
import java.time.LocalDateTime;
public class CuentaFidelidad {
    
    private int puntos;
    private LocalDateTime fechaUltimaActividad;

    
    public CuentaFidelidad(int puntosIniciales) {
        this.puntos = puntosIniciales;
        this.fechaUltimaActividad = LocalDateTime.now();
    }

   
    public void agregarPuntos(int monto) {
        
        this.puntos += monto;
        this.fechaUltimaActividad = LocalDateTime.now();
        System.out.println("Se agregaron puntos. Saldo actual: " + this.puntos);
    }

    public boolean canjearPuntos(int puntosACanjear) {
        if (this.puntos >= puntosACanjear) {
            this.puntos -= puntosACanjear;
            this.fechaUltimaActividad = LocalDateTime.now();
            System.out.println("Canje exitoso. Puntos restantes: " + this.puntos);
            return true;
        } else {
            System.out.println("Puntos insuficientes para realizar el canje.");
            return false;
        }
    }

    public int consultarSaldo() {
        return this.puntos;
    }

    
    public LocalDateTime getFechaUltimaActividad() { return fechaUltimaActividad; }
}