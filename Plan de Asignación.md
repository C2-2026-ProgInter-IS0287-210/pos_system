# Plan de Asignación de Desarrollo - Sistema POS (DDD + SOLID)

La siguiente distribución asigna la responsabilidad de implementación del sistema POS a los seis estudiantes del grupo. La estrategia de división se fundamenta en el agrupamiento por módulos o contextos del dominio, garantizando que cada desarrollador trabaje con Entidades, Casos de Uso, Repositorios y Controladores visuales, fomentando así un aprendizaje integral.

## 1. Cristian David Cruz Buitrago

Módulo Asignado: Contexto de Ventas
Descripción: Encargado del núcleo transaccional principal del sistema, gestionando el ciclo de vida de una venta, los pagos y los cálculos matemáticos asociados.

- Dominio (Entidades y Value Objects): Venta, LineaVenta, Pago, Recibo, Devolucion, Descuento.

- Dominio (Enumeradores): MetodoPago, EstadoVenta.

- Aplicación (Casos de Uso): IniciarVentaCasoUso, PagarVentaCasoUso, SuspenderVentaCasoUso, RecuperarVentaCasoUso, AnularVentaCasoUso, DividirCuentaCasoUso.

- Interfaces y Servicios: ServicioVentas, ServicioPagos.

- Infraestructura y Presentación: RepositorioVentasImpl, PanelVentas, ControladorVentas.

## 2. Juan Pablo Ocampo Rodriguez

Módulo Asignado: Contexto de Inventario
Descripción: Responsable de la gestión del catálogo de productos, el control de existencias (stock) y la trazabilidad de los movimientos físicos.

- Dominio (Entidades): Producto, VarianteProducto, KitProducto, Stock, MovimientoInventario, Lote, Categoria.

- Dominio (Enumeradores): TipoMovimiento.

- Aplicación (Casos de Uso): ConsultarStockCasoUso, RealizarMovimientoCasoUso, VerificarReordenCasoUso.

- Interfaces y Servicios: ServicioInventario.

- Infraestructura y Presentación: RepositorioProductosImpl, PanelInventario, ControladorInventario.

## 3. Brisa Juliana Morales Botía

Módulo Asignado: Contextos de Compras y Bancos
Descripción: Administra el abastecimiento del negocio mediante la relación con proveedores y controla los movimientos de cuentas bancarias asociadas al comercio.

- Dominio (Entidades): Compra, LineaCompra, Proveedor, CuentaPorPagar, CuentaBancaria, MovimientoBancario.

- Dominio (Enumeradores): EstadoCompra, EstadoPago, TipoMovimientoBancario.

- Aplicación (Casos de Uso): CrearCompraCasoUso, RecibirMercanciaCasoUso, RegistrarPagoProveedorCasoUso, DepositarCasoUso, RetirarCasoUso, TransferirCasoUso.

- Interfaces y Servicios: ServicioCompras.

- Infraestructura y Presentación: RepositorioComprasImpl, RepositorioBancosImpl, PanelCompras, ControladorCompras.

## 4. Juan José Díaz López

Módulo Asignado: Contexto de Configuración, Usuarios y Seguridad
Descripción: Encargado de la base transversal del sistema, manejando los accesos, los roles, los permisos de los empleados y los parámetros globales de las sucursales.

- Dominio (Entidades): Usuario, Rol, Turno, Asistencia, Sucursal, ConfiguracionGlobal, GestorImagenes.

- Dominio (Enumeradores): Permiso.

- Aplicación (Casos de Uso): AutenticarUsuarioCasoUso, GestionarTurnoCasoUso, CargarConfiguracionCasoUso.

- Interfaces y Servicios: Implementación de utilidades transversales (ej. encriptación de pines).

- Infraestructura: RepositorioUsuariosImpl. (Apoyo en la integración de seguridad en toda la VentanaPrincipal).

## 5. Diego Alejandro Manrique Fonseca

Módulo Asignado: Contextos de Gestión de Caja y Clientes
Descripción: Responsable del flujo de dinero en efectivo en el punto de venta (aperturas/cierres) y de la fidelización de las personas que realizan las compras.

- Dominio (Entidades): CajaPrincipal, MovimientoCaja, CierreCaja, Cliente, CuentaFidelidad, CuentaCredito, TarjetaRegalo.

- Dominio (Enumeradores): TipoMovimientoCaja, EstadoCaja.

- Aplicación (Casos de Uso): AbrirCajaCasoUso, CerrarCajaCasoUso, RegistrarMovimientoCajaCasoUso, RegistrarClienteCasoUso, ActualizarClienteCasoUso.

- Interfaces y Servicios: ServicioCaja.

- Infraestructura y Presentación: RepositorioCajaImpl, RepositorioClientesImpl, PanelCaja, ControladorCaja.

## 6. Juan Felippe Murillo Guerrero

Módulo Asignado: Contexto de Informes, Carga Masiva y Presentación Principal
Descripción: Encargado de la consolidación de datos, la importación de archivos externos y la orquestación de la interfaz gráfica principal donde se unen todos los módulos.

- Dominio (Entidades): Informe, Dashboard.

- Servicios (Carga Masiva): ImportadorDatos, ServicioImportacion (Interfaces).

- Aplicación (Casos de Uso): GenerarInformeVentasCasoUso, GenerarDashboardCasoUso, ImportarProductosCasoUso, ImportarClientesCasoUso.

- Interfaces y Servicios: ServicioInformes.

- Infraestructura y Presentación: RepositorioInformesImpl, ImportadorCSV, ImportadorExcel, VentanaPrincipal (Clase que integra todos los paneles y controladores).

# Referencias Teóricas que Sustentan el Modelo

La arquitectura y división de responsabilidades expuestas en este documento se fundamentan en las siguientes obras de la industria del software:

Diseño Guiado por el Dominio (DDD): El agrupamiento del código en espacios como Ventas, Inventario o Caja permite una alta cohesión y bajo acoplamiento. Este principio está respaldado por la obra de Evans, E. (2003) en Domain-Driven Design: Tackling Complexity in the Heart of Software (Addison-Wesley Professional), el cual establece la separación en dominios, subdominios y agregados.

Principios SOLID: La separación estricta entre las interfaces (Servicios de Dominio) y su implementación (Infraestructura) asegura el Principio de Inversión de Dependencias (DIP). Este y otros principios de calidad de código son descritos por Martin, R. C. (2008) en Clean Code: A Handbook of Agile Software Craftsmanship (Prentice Hall).

Programación Orientada a Objetos (POO): La estructura requiere el uso extensivo de herencia, interfaces (polimorfismo) y encapsulamiento estricto, metodologías consolidadas por Gamma, E., Helm, R., Johnson, R., & Vlissides, J. (1994) en Design Patterns: Elements of Reusable Object-Oriented Software (Addison-Wesley).
