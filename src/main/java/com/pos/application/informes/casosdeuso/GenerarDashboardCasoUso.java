package com.pos.application.informes.casosuso;

import com.pos.domain.informes.entidades.Dashboard;
import com.pos.domain.informes.servicios.ServicioInformes;

public class GenerarDashboardCasoUso {

```
private final ServicioInformes servicioInformes;

public GenerarDashboardCasoUso(ServicioInformes servicioInformes) {
    this.servicioInformes = servicioInformes;
}

public Dashboard ejecutar() {
    return servicioInformes.generarDashboard();
}
```

}
