# Revisión de Historias de Usuario - Sistema POS

Tras realizar una inspección del repositorio y del registro de *commits*, se ha evaluado el trabajo de cada estudiante con respecto a los **criterios funcionales y técnicos** de la **primera Historia de Usuario** que tiene asignada en el documento `Backlog de Historias de Usuario.md`.

## Resumen General
**Ninguno de los estudiantes ha cumplido con los criterios funcionales o técnicos** de sus respectivas historias de usuario. 

El trabajo realizado hasta el momento se limita a la **creación de la estructura de carpetas** y la **creación de archivos `.java` vacíos** (o con tan solo la definición inicial del `package` y la clase `public class ... {}`). No existe implementación de lógica de negocio, atributos, métodos, interfaces de usuario (Swing) ni persistencia en repositorios.

---

## Detalle por Estudiante

### 1. Cristian David Cruz Buitrago (US-01: Gestión de Venta)
* **Requerimiento:** Implementar el ciclo de vida de una venta (iniciar, procesar pagos, finalizar), incluyendo Casos de Uso, `Value Object Money`, cálculo de subtotales/impuestos y cambios de estado.
* **Estado Actual:** 
  * Se crearon los archivos dentro de `com.pos.domain.ventas` (Venta, LineaVenta, Pago, Recibo, Money, Descuento, etc.).
  * **Fallo Técnico/Funcional:** Todos los archivos creados constan únicamente de la declaración básica de la clase (aprox. 80 bytes cada uno). No hay atributos, ni lógica de Value Objects, ni métodos de cálculo, ni están implementados los casos de uso (`IniciarVentaCasoUso`, `PagarVentaCasoUso`), ni la interfaz gráfica (`PanelVentas`), ni los servicios.
* **Veredicto:** ❌ No cumple.

### 2. Juan Pablo Ocampo Rodriguez (US-03: Control de Catálogo)
* **Requerimiento:** Consultar stock de productos (retornar niveles actual, mínimo y máximo) y verificar punto de reorden mediante Casos de Uso.
* **Estado Actual:**
  * Se crearon archivos en `com.pos.domain.inventario.entidades` y `com.pos.application.casos de uso`.
  * **Fallo Técnico/Funcional:** Todos los archivos (`ConsultarStockCasoUso.java`, `VerificarReordenCasoUso.java`, entidades) **están completamente en blanco (0 bytes)**. Además, rompió estándares de Java nombrando clases en minúscula (ej. `producto.java`, `stock.java`).
* **Veredicto:** ❌ No cumple.

### 3. Brisa Juliana Morales Botía (US-05: Abastecimiento y Cuentas por Pagar)
* **Requerimiento:** Crear órdenes de compra a proveedores, cambiar estados a PENDIENTE, registrar mercancía y generar una `CuentaPorPagar`.
* **Estado Actual:**
  * Se crearon los archivos dentro de `com.pos.domain.compras` y `com.pos.application.compras`.
  * **Fallo Técnico/Funcional:** Todos los archivos Java creados para esta historia (Entidades, Enumerados, Casos de Uso, Servicios y Controladores) **tienen 0 bytes de contenido**.
* **Veredicto:** ❌ No cumple.

### 4. Juan José Díaz López (US-07: Autenticación por Roles)
* **Requerimiento:** Autenticación de usuarios validando un PIN y autorizando vistas según los permisos del rol.
* **Estado Actual:**
  * Se realizó un commit (hash `bdb032a`) creando archivos como `Usuario.java`, `Rol.java`, etc., en una ruta incorrecta (`domain/entidades` en vez de un subdominio específico).
  * **Fallo Técnico/Funcional:** Los archivos tienen **0 bytes**. No hay método `autenticar()`, ni validación de PIN, ni implementación de `AutenticarUsuarioCasoUso`. 
* **Veredicto:** ❌ No cumple.

### 5. Diego Alejandro Manrique Fonseca (US-09: Operatividad de Caja)
* **Requerimiento:** Apertura y cierre de caja, validación de bloqueo si no hay caja abierta, y generación de `CierreCaja`.
* **Estado Actual:**
  * Se crearon algunos de los archivos correspondientes a las entidades de caja y clientes.
  * **Fallo Técnico/Funcional:** Faltan archivos clave (Controlador, Repositorio, UI) y los archivos existentes tienen **0 bytes**. Ningún caso de uso fue implementado.
* **Veredicto:** ❌ No cumple.

### 6. Juan Felippe Murillo Guerrero (US-11: Tablero e Indicadores)
* **Requerimiento:** Consumir métricas de ventas e inventario para mostrar un Dashboard principal y reportes.
* **Estado Actual:**
  * Se crearon varios archivos (ej. `Dashboard.java` - con error de tipeo "Dasboard", `GenerarDashboardCasoUso.java`).
  * **Fallo Técnico/Funcional:** Excepto por `Dasboard.java` que tiene algún código autogenerado o declaración, **todos los demás archivos tienen 0 bytes**. No hay interfaz unificada ni conexión real con otros repositorios para consumir métricas.
* **Veredicto:** ❌ No cumple.
