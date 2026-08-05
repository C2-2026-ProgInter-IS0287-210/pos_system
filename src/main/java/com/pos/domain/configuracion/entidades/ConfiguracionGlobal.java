 package com.pos.domain.configuracion.entidades;



import com.pos.domain.configuracion.enumerados.Idioma;
import com.pos.domain.configuracion.enumerados.Moneda;

public class ConfiguracionGlobal {
    private String nombreNegocio;
    private String direccion;
    private String telefono;
    private boolean modoOffline;
    private Idioma idioma;
    private Moneda moneda;
    private double iva;

    public void cargarConfiguracion() {
        // Carga de configuración inicial / archivo
    }

    public void guardarConfiguracion() {
        // Guardado de estado
    }

    // Getters y Setters
    public String getNombreNegocio() { return nombreNegocio; }
    public void setNombreNegocio(String nombreNegocio) { this.nombreNegocio = nombreNegocio; }
    public Idioma getIdioma() { return idioma; }
    public void setIdioma(Idioma idioma) { this.idioma = idioma; }
    public Moneda getMoneda() { return moneda; }
    public void setMoneda(Moneda moneda) { this.moneda = moneda; }
}