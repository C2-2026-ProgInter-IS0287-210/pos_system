package com.pos.domain.inventario.entidades;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Comparator;

public class Lote {

    private String numeroLote;
    private LocalDateTime fechaFabricacion;
    private LocalDateTime fechaCaducidad;
    private int cantidadInicial;
    private int cantidadDisponible;
    private Producto producto;

    public Lote(String numeroLote, LocalDateTime fechaFabricacion, LocalDateTime fechaCaducidad,
                int cantidadInicial, Producto producto) {
        this.numeroLote = numeroLote;
        this.fechaFabricacion = fechaFabricacion;
        this.fechaCaducidad = fechaCaducidad;
        this.cantidadInicial = cantidadInicial;
        this.cantidadDisponible = cantidadInicial;
        this.producto = producto;
    }

    public static Lote aplicarFEFO(List<Lote> lotes) {
        return lotes.stream()
                .filter(l -> l.cantidadDisponible > 0)
                .min(Comparator.comparing(Lote::getFechaCaducidad))
                .orElse(null);
    }

    public String getNumeroLote() {
        return numeroLote;
    }

    public void setNumeroLote(String numeroLote) {
        this.numeroLote = numeroLote;
    }

    public LocalDateTime getFechaFabricacion() {
        return fechaFabricacion;
    }

    public void setFechaFabricacion(LocalDateTime fechaFabricacion) {
        this.fechaFabricacion = fechaFabricacion;
    }

    public LocalDateTime getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setFechaCaducidad(LocalDateTime fechaCaducidad) {
        this.fechaCaducidad = fechaCaducidad;
    }

    public int getCantidadInicial() {
        return cantidadInicial;
    }

    public void setCantidadInicial(int cantidadInicial) {
        this.cantidadInicial = cantidadInicial;
    }

    public int getCantidadDisponible() {
        return cantidadDisponible;
    }

    public void setCantidadDisponible(int cantidadDisponible) {
        this.cantidadDisponible = cantidadDisponible;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    @Override
    public String toString() {
        return "Lote{" +
                "numeroLote='" + numeroLote + '\'' +
                ", fechaFabricacion=" + fechaFabricacion +
                ", fechaCaducidad=" + fechaCaducidad +
                ", cantidadInicial=" + cantidadInicial +
                ", cantidadDisponible=" + cantidadDisponible +
                '}';
    }
}