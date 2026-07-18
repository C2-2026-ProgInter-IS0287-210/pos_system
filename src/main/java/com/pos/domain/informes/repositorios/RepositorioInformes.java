package main.java.com.pos.domain.informes.repositorios;

import java.time.LocalDate;
import java.util.List;

import main.java.com.pos.domain.informes.entidades.Dashboard;
import main.java.com.pos.domain.informes.entidades.Informe;

public interface RepositorioInformes {

    Dashboard obtenerDashboard();

    List<Informe> obtenerInformes();

    Informe generarInformeVentas(LocalDate fechaInicio, LocalDate fechaFin);

}