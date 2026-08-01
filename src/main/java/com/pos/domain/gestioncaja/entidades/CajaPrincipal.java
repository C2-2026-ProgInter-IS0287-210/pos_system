package main. java. com. pos. domain. gestioncaja.entidades;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import main.java.com.pos.domain.ventas.valueobjets.Money;

public class CajaPrincipal {

    // Atributos privados (-)
    private Money saldoActual;
    private LocalDateTime fechaApertura;
    private LocalDateTime fechaCierre;
    private EstadoCaja estado;
    private Usuario responsable;

    // Relaciones
    private List<MovimientoCaja> movimientos;
    private List<CierreCaja> cierresGenerados;

    // Constructor
    public CajaPrincipal(Usuario responsable, Money saldoInicial) {
        this.responsable = responsable;
        this.saldoActual = saldoInicial;
        this.estado = EstadoCaja.CERRADA;
        this.movimientos = new ArrayList<>();
        this.cierresGenerados = new ArrayList<>();
    }

    // Métodos públicos (+)

    public void abrir() {
        this.estado = EstadoCaja.ABIERTA;
        this.fechaApertura = LocalDateTime.now();
    }

    public void cerrar() {
        this.estado = EstadoCaja.CERRADA;
        this.fechaCierre = LocalDateTime.now();
    }

    public void registrarMovimiento(MovimientoCaja mov) {
        if (this.movimientos == null) {
            this.movimientos = new ArrayList<>();
        }
        this.movimientos.add(mov);
    }

    public void solicitarRetiro(Money monto, String motivo) {
        // Lógica para solicitar un retiro de la caja
    }

    // Getters y Setters
    public Money getSaldoActual() {
        return saldoActual;
    }

    public void setSaldoActual(Money saldoActual) {
        this.saldoActual = saldoActual;
    }

    public LocalDateTime getFechaApertura() {
        return fechaApertura;
    }

    public void setFechaApertura(LocalDateTime fechaApertura) {
        this.fechaApertura = fechaApertura;
    }

    public LocalDateTime getFechaCierre() {
        return fechaCierre;
    }

    public void setFechaCierre(LocalDateTime fechaCierre) {
        this.fechaCierre = fechaCierre;
    }

    public EstadoCaja getEstado() {
        return estado;
    }

    public void setEstado(EstadoCaja estado) {
        this.estado = estado;
    }

    public Usuario getResponsable() {
        return responsable;
    }

    public void setResponsable(Usuario responsable) {
        this.responsable = responsable;
    }

    public List<MovimientoCaja> getMovimientos() {
        return movimientos;
    }

    public List<CierreCaja> getCierresGenerados() {
        return cierresGenerados;
    }
}