# Manual Guía: Implementando DDD y SOLID en el Sistema POS (Sprint 2)

¡Bienvenidos al Sprint 2! Durante el primer sprint hemos identificado algunas desviaciones arquitectónicas. Este manual está diseñado para corregir los conceptos malentendidos y guiar la implementación técnica de las Historias de Usuario Pares asignadas a ustedes.

> [!TIP]
> **Regla de Oro en DDD:** Las capas exteriores (UI, Infraestructura) conocen a las capas interiores (Aplicación, Dominio). **Nunca al revés.**

---

## 1. El Principio de Inversión de Dependencias (DIP)

Uno de los errores más comunes (visto en el Sprint 1) fue acoplar la Aplicación con la Infraestructura directamente.

> [!CAUTION]
> **Lo que NO deben hacer:**
> ```java
> // ❌ MALA PRÁCTICA: Depender de una implementación "Impl"
> import com.pos.infrastructure.RepositorioUsuariosImpl;
> 
> public class AutenticarUsuarioCasoUso {
>     private RepositorioUsuariosImpl repositorio = new RepositorioUsuariosImpl(); // ¡Acomplamiento fuerte!
> }
> ```

> [!NOTE]
> **Lo que SÍ deben hacer:**
> ```java
> // ✅ BUENA PRÁCTICA: Depender de Interfaces del Dominio
> import com.pos.domain.configuracion.repositorios.RepositorioUsuarios;
> 
> public class AutenticarUsuarioCasoUso {
>     private RepositorioUsuarios repositorio;
> 
>     // Se inyecta por el constructor la abstracción, no la implementación
>     public AutenticarUsuarioCasoUso(RepositorioUsuarios repositorio) {
>         this.repositorio = repositorio; 
>     }
> }
> ```

---

## 2. Entidades de Dominio vs Entidades Anémicas

Las entidades **no son** simples portadoras de datos con `getters` y `setters` (eso es un modelo anémico). Las entidades poseen **Reglas de Negocio**.

Por ejemplo, para la historia **US-02 (Gestión de Devoluciones y Descuentos)**:

```java
public class Venta {
    private List<LineaVenta> lineas;
    private EstadoVenta estado;
    
    // El método está dentro de la entidad, no en un Caso de Uso
    public void aplicarDescuento(Descuento descuento) {
        if (this.estado != EstadoVenta.PENDIENTE) {
            throw new IllegalArgumentException("No se puede aplicar descuento a una venta procesada");
        }
        // Lógica de cálculo...
    }
}
```

---

## 3. ¿Qué es un Caso de Uso (Aplicación)?

Los Casos de Uso (Usecases) no tienen lógica de negocio, son simples **orquestadores**. Reciben un pedido, buscan una Entidad, le dicen a la Entidad que haga algo, y luego la guardan.

Ejemplo para la historia **US-04 (Registro de Movimientos Físicos)**:

```java
public class RealizarMovimientoCasoUso {
    
    private RepositorioProductos repositorioProductos;
    private ServicioInventario servicioInventario;

    public RealizarMovimientoCasoUso(RepositorioProductos repo, ServicioInventario serv) {
        this.repositorioProductos = repo;
        this.servicioInventario = serv;
    }

    public void ejecutar(String sku, int cantidad, TipoMovimiento tipo) {
        // 1. Obtener la entidad (Orquestar)
        Producto p = repositorioProductos.buscarPorSku(sku);
        
        // 2. Delegar la lógica de dominio
        servicioInventario.procesarMovimiento(p, cantidad, tipo);
        
        // 3. Persistir los cambios
        repositorioProductos.actualizar(p);
    }
}
```

---

## 4. Controladores de UI (Presentación)

Los controladores (como `ControladorInventario`, `ControladorCaja`) conectan la vista gráfica de Swing con los Casos de Uso. **Nunca acceden directamente a las bases de datos ni tienen lógica de cálculo**.

```java
public class ControladorCaja {
    private AbrirCajaCasoUso abrirCajaCasoUso;

    public void botonAbrirCajaPresionado(double montoBase) {
        try {
            // Solo captura el clic y llama al caso de uso
            abrirCajaCasoUso.ejecutar(montoBase);
            System.out.println("Caja abierta con éxito.");
        } catch (Exception e) {
            System.out.println("Error al abrir caja: " + e.getMessage());
        }
    }
}
```

---

## Checklist para el Sprint 2

Antes de hacer "Commit" y subir sus Historias de Usuario Pares al repositorio de GitHub, revisen lo siguiente:

1. ¿Mi `package` refleja la ruta real de mi carpeta sin espacios en blanco?
2. ¿Evité importar clases que digan `main.java.com...` (es decir, relativas al origen)?
3. ¿Mi Controlador llama únicamente a Casos de Uso? (¡No está importando repositorios!)
4. ¿Mis Casos de Uso solo importan Interfaces (`Servicios` o `Repositorios`) y no clases que terminan en `Impl`?
5. ¿Mis archivos en blanco de historias anteriores ya tienen código implementado?

¡Mucho éxito con la programación, y no duden en pedir revisión del docente ante la duda!
