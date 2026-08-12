package com.pos.domain.informes.servicios;

import java.time.LocalDate;
import java.util.List;

import com.pos.domain.informes.entidades.Dashboard;
import com.pos.domain.informes.entidades.Informe;

public interface ServicioInformes {

```
Dashboard generarDashboard();

Informe generarInformeVentas(LocalDate fechaInicio, LocalDate fechaFin);

List<Informe> obtenerInformes();
```

}
