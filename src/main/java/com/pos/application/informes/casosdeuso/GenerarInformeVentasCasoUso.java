package com.pos.application.informes.casosdeuso;

import com.pos.domain.informes.entidades.Informe;
import com.pos.domain.informes.servicios.ServicioInformes;
import com.pos.domain.ventas.repositorios.RepositorioVentas;
import com.pos.application.informes.dtos.InformeDTO;
import java.time.LocalDate;
import java.util.UUID;

public class GenerarInformeVentasCasoUso {
    
    private ServicioInformes servicioInformes;
    private RepositorioVentas repositorioVentas;

    public GenerarInformeVentasCasoUso(ServicioInformes servicioInformes, RepositorioVentas repositorioVentas) {
        this.servicioInformes = servicioInformes;
        this.repositorioVentas = repositorioVentas;
    }

    public InformeDTO ejecutar(LocalDate fechaInicio, LocalDate fechaFin) {
        double totalVentas = repositorioVentas.obtenerTotalVentasPorRango(fechaInicio, fechaFin);
        
        Informe informe = new Informe(UUID.randomUUID().toString(), "REPORTE_VENTAS", fechaInicio, fechaFin);
        informe.registrarTotales(totalVentas);
        
        servicioInformes.guardarInforme(informe);
        
        return new InformeDTO(informe.getIdInforme(), informe.getTotalVentas(), informe.getFechaGeneracion());
    }
}