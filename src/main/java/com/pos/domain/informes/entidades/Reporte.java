package main.java.com.pos.domain.informes.entidades;

import java.time.LocalDate;

public class Reporte {

    private String nombre;
    private String tipo;
    private LocalDate fechaGeneracion;
    private String rutaArchivo;

    public Reporte(String nombre,
                   String tipo,
                   LocalDate fechaGeneracion,
                   String rutaArchivo) {

        this.nombre = nombre;
        this.tipo = tipo;
        this.fechaGeneracion = fechaGeneracion;
        this.rutaArchivo = rutaArchivo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public LocalDate getFechaGeneracion() {
        return fechaGeneracion;
    }

    public String getRutaArchivo() {
        return rutaArchivo;
    }
}