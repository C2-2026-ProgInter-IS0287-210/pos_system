package main. java. com. pos. domain. gestioncaja.entidades;
public class CierreCaja {

    // Atributos privados (-)
    private LocalDateTime fecha;
    private Money totalVentas;
    private Money totalIngresos;
    private Money totalEgresos;
    private Money diferencia;
    private String observaciones;

    // Constructor vacío
    public CierreCaja() {
    }

    // Constructor completo
    public CierreCaja(LocalDateTime fecha, Money totalVentas, Money totalIngresos, Money totalEgresos, Money diferencia, String observaciones) {
        this.fecha = fecha;
        this.totalVentas = totalVentas;
        this.totalIngresos = totalIngresos;
        this.totalEgresos = totalEgresos;
        this.diferencia = diferencia;
        this.observaciones = observaciones;
    }

    // Métodos públicos (+)

    public Reporte generarReporte() {
        // Lógica para generar y devolver el reporte
        return new Reporte();
    }

    public boolean validarDiferencia() {
        // Lógica para comprobar si la diferencia es aceptable o cero
        return true;
    }

    // Getters y Setters
    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public Money getTotalVentas() {
        return totalVentas;
    }

    public void setTotalVentas(Money totalVentas) {
        this.totalVentas = totalVentas;
    }

    public Money getTotalIngresos() {
        return totalIngresos;
    }

    public void setTotalIngresos(Money totalIngresos) {
        this.totalIngresos = totalIngresos;
    }

    public Money getTotalEgresos() {
        return totalEgresos;
    }

    public void setTotalEgresos(Money totalEgresos) {
        this.totalEgresos = totalEgresos;
    }

    public Money getDiferencia() {
        return diferencia;
    }

    public void setDiferencia(Money diferencia) {
        this.diferencia = diferencia;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
}