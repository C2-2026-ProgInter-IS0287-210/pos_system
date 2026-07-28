package main.java.com.pos.application.casosdeuso;

import main.java.com.pos.domain.configuracion.entidades.ConfiguracionGlobal;

public class CargarConfiguracionCasoUso {

    public ConfiguracionGlobal ejecutar() {
        ConfiguracionGlobal config = new ConfiguracionGlobal();
        config.cargarConfiguracion();
        return config;
    }
}