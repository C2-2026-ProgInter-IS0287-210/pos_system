# Diagrama de Implementación Actual (Sprint 1)

A continuación se presenta un diagrama de la arquitectura implementada por los estudiantes en el Sprint 1. El modelo revela que **no se están respetando los límites de las capas del Diseño Guiado por el Dominio (DDD)** y se violan principios fundamentales como la Inversión de Dependencias (DIP).

```mermaid
graph TD
    %% Estilos de Capas
    classDef presentation fill:#e1f5fe,stroke:#01579b,stroke-width:2px;
    classDef application fill:#fff3e0,stroke:#e65100,stroke-width:2px;
    classDef domain fill:#e8f5e9,stroke:#1b5e20,stroke-width:2px;
    classDef infrastructure fill:#ffebee,stroke:#b71c1c,stroke-width:2px;
    classDef errorNode fill:#ffcdd2,stroke:#d32f2f,stroke-width:2px,color:#b71c1c,stroke-dasharray: 5 5;

    subgraph Presentación [Capa de Presentación]
        UI[VentanaPrincipal / Paneles]
        CV[ControladorVentas]
        CC[ControladorCompras]
        CI[ControladorInventario]
        
        UI -.->|"Vacía (Juan Felippe)"| UI
        CV -->|"Implementación Incompleta (Cristian)"| CV
        CC -->|"Sin Importaciones (Brisa)"| CC
    end

    subgraph Aplicación [Capa de Aplicación - Casos de Uso]
        IV[IniciarVentaCasoUso]
        CS[ConsultarStockCasoUso]
        CrC[CrearCompraCasoUso]
        AU[AutenticarUsuarioCasoUso]
        AC[AbrirCajaCasoUso]
        GD[GenerarDashboardCasoUso]
        
        IV -.->|"Clase Vacía (Cristian)"| IV
        CrC -.->|"Clase Vacía (Brisa)"| CrC
        AC -.->|"Clase Vacía (Diego)"| AC
        GD -.->|"Clase Vacía (Juan Felippe)"| GD
    end

    subgraph Dominio [Capa de Dominio]
        EntVenta[Entidad: Venta]
        EntUsu[Entidad: Usuario]
        SI[ServicioInventario (Interfaz)]
        
        EntVenta -->|"Métodos retornan variables temporales"| EntVenta
    end

    subgraph Infraestructura [Capa de Infraestructura]
        RUI[RepositorioUsuariosImpl]
        RPI[RepositorioProductosImpl]
        EPin[EncriptadorPin]
    end

    %% Relaciones y Problemas Arquitectónicos
    CV -->|Llama| IV
    CC -->|Llama| CrC
    CI -->|Llama| CS

    %% Violaciones directas
    CS -->|"Usa directamente"| RPI
    AU -->|"[ERROR CRÍTICO] Depende directamente de la implementación"| RUI
    AU -->|"[ERROR CRÍTICO] Llama herramienta de Infraestructura"| EPin
    CS -.->|"[ERROR] Nombres de paquetes erróneos"| CS

    class UI,CV,CC,CI presentation;
    class IV,CS,CrC,AU,AC,GD application;
    class EntVenta,EntUsu,SI domain;
    class RUI,RPI,EPin infrastructure;
    class AU,CS errorNode;
```

## Análisis del Diagrama
1. **Acoplamiento Fuerte:** El caso de uso `AutenticarUsuarioCasoUso` (Juan José) conoce a `RepositorioUsuariosImpl` y `EncriptadorPin`, saltándose la inyección de dependencias a través de interfaces de dominio. Esto viola el **Principio de Inversión de Dependencia (DIP)** de SOLID.
2. **Entregables Vacíos:** Gran parte de las clases en las capas de Aplicación (`AbrirCajaCasoUso`, `GenerarDashboardCasoUso`, `CrearCompraCasoUso`) y Presentación (`VentanaPrincipal`) están totalmente en blanco.
3. **Desorganización de Paquetes:** Las referencias en el módulo de inventario apuntan a rutas inexistentes (`main.java.com.pos...`) y carpetas con espacios (`casos de uso`), lo que impide que el sistema compile correctamente.
4. **Dominio Anémico / Lógica Incompleta:** Las entidades como `Venta` tienen métodos vacíos o retornan variables incorrectas en lugar de realizar el cálculo de dominio correspondiente.
