package main.java.com.pos.domain.informes.entidades;
import java.time.LocalDate;

public class Informe {

    private String titulo;
    private LocalDate fechaInicio;
    private LocalDate fechaFin;
    private double totalVentas;
    private int cantidadVentas;

    public Informe(String titulo,
                    LocalDate fechaInicio,
                    LocalDate fechaFin,
                    double totalVentas,
                    int cantidadVentas) {

        this.titulo = titulo;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.totalVentas = totalVentas;
        this.cantidadVentas = cantidadVentas;
    }

    public String getTitulo() {
        return titulo;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public LocalDate getFechaFin() {
        return fechaFin;
    }

    public double getTotalVentas() {
        return totalVentas;
    }

    public int getCantidadVentas() {
        return cantidadVentas;
    }
}