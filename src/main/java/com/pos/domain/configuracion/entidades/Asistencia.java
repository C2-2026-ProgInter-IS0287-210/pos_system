package main.java.com.pos.domain.configuracion.entidades;

import java.time.LocalDateTime;

public class Asistencia {
    private LocalDateTime horaEntrada;
    private LocalDateTime horaSalida;
    private Usuario usuario;
    private String observaciones;

    public Asistencia(Usuario usuario) {
        this.usuario = usuario;
    }

    public void registrarEntrada() {
        this.horaEntrada = LocalDateTime.now();
    }

    public void registrarSalida() {
        this.horaSalida = LocalDateTime.now();
    }

    // Getters y Setters
    public LocalDateTime getHoraEntrada() { return horaEntrada; }
    public LocalDateTime getHoraSalida() { return horaSalida; }
    public Usuario getUsuario() { return usuario; }
    public String getObservaciones() { return observaciones; }
    public void setObservaciones(String observaciones) { this.observaciones = observaciones; }
}