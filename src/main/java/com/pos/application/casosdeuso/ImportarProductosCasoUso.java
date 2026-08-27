package com.pos.application.cargamasiva.casosdeuso;

import com.pos.domain.informes.servicios.ServicioImportacion;
import com.pos.application.cargamasiva.dtos.ResultadoImportacionDTO;

public class ImportarProductosCasoUso {
    
    private ServicioImportacion servicioImportacion;

    public ImportarProductosCasoUso(ServicioImportacion servicioImportacion) {
        this.servicioImportacion = servicioImportacion;
    }

    public ResultadoImportacionDTO ejecutar(String rutaArchivo) {
        if (rutaArchivo == null || rutaArchivo.trim().isEmpty()) {
            throw new IllegalArgumentException("La ruta del archivo no puede estar vacia");
        }
        
        return servicioImportacion.importarDatosMasivos(rutaArchivo);
    }
}