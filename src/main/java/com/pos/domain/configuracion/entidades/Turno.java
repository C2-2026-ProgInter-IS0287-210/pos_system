package main.java.com.pos.domain.configuracion.entidades;

import java.time.LocalDateTime;

public class Turno {
    private LocalDateTime horaInicio;
    private LocalDateTime horaFin;
    private double efectivoEsperado;
    private double efectivoReal;
    private Usuario usuario;

    public Turno(Usuario usuario, double efectivoEsperado) {
        this.usuario = usuario;
        this.efectivoEsperado = efectivoEsperado;
    }

    public void iniciar() {
        this.horaInicio = LocalDateTime.now();
    }

    public void finalizar() {
        this.horaFin = LocalDateTime.now();
    }

    public boolean validarEfectivo() {
        return Double.compare(this.efectivoEsperado, this.efectivoReal) == 0;
    }

    // Getters y Setters
    public LocalDateTime getHoraInicio() { return horaInicio; }
    public LocalDateTime getHoraFin() { return horaFin; }
    public double getEfectivoEsperado() { return efectivoEsperado; }
    public double getEfectivoReal() { return efectivoReal; }
    public void setEfectivoReal(double efectivoReal) { this.efectivoReal = efectivoReal; }
    public Usuario getUsuario() { return usuario; }
}