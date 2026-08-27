package com.pos.domain.servicios;

import com.pos.application.cargamasiva.dtos.ResultadoImportacionDTO;
import java.io.File;

public interface ServicioImportacion {
    ResultadoImportacionDTO importarProductos(File archivo);
}