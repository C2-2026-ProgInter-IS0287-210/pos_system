package com.pos.infrastructure.informes.servicios;

import java.time.LocalDate;
import java.util.List;

import com.pos.domain.informes.entidades.Dashboard;
import com.pos.domain.informes.entidades.Informe;
import com.pos.domain.informes.repositorios.RepositorioInformes;
import com.pos.domain.informes.servicios.ServicioInformes;

public class ServicioInformesImpl implements ServicioInformes {

```
private final RepositorioInformes repositorioInformes;

public ServicioInformesImpl(RepositorioInformes repositorioInformes) {
    this.repositorioInformes = repositorioInformes;
}

@Override
public Dashboard generarDashboard() {
    return repositorioInformes.obtenerDashboard();
}

@Override
public Informe generarInformeVentas(
        LocalDate fechaInicio,
        LocalDate fechaFin) {

    return repositorioInformes.generarInformeVentas(
            fechaInicio,
            fechaFin
    );
}

@Override
public List<Informe> obtenerInformes() {
    return repositorioInformes.obtenerInformes();
}
```

}
