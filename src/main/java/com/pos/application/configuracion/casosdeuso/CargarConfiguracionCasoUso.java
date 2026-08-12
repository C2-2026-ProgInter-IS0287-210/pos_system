package com.pos.application.configuracion.casosdeuso;

import com.pos.domain.configuracion.entidades.ConfiguracionGlobal;

public class CargarConfiguracionCasoUso {

    public ConfiguracionGlobal ejecutar() {
        ConfiguracionGlobal config = new ConfiguracionGlobal();
        config.cargarConfiguracion();
        return config;
    }
}