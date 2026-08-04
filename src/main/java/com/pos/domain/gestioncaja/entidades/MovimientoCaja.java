package com. pos. domain. gestioncaja.entidades;

import java.time.LocalDateTime;

import main.java.com.pos.domain.ventas.valueobjets.Money;

public class MovimientoCaja {

    // Atributos privados (-)
    private TipoMovimientoCaja tipo;
    private Money monto;
    private String concepto;
    private LocalDateTime fecha;
    private Usuario usuario;
    private String referencia;

    // Constructor vacío
    public MovimientoCaja() {
    }

    // Constructor completo
    public MovimientoCaja(TipoMovimientoCaja tipo, Money monto, String concepto, LocalDateTime fecha, Usuario usuario, String referencia) {
        this.tipo = tipo;
        this.monto = monto;
        this.concepto = concepto;
        this.fecha = fecha;
        this.usuario = usuario;
        this.referencia = referencia;
    }

    // Getters y Setters
    public TipoMovimientoCaja getTipo() {
        return tipo;
    }

    public void setTipo(TipoMovimientoCaja tipo) {
        this.tipo = tipo;
    }

    public Money getMonto() {
        return monto;
    }

    public void setMonto(Money monto) {
        this.monto = monto;
    }

    public String getConcepto() {
        return concepto;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }
}
    

   
   