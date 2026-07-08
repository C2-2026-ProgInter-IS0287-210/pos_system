Backlog de Historias de Usuario - Sistema POS

La presente especificación traduce los requerimientos funcionales y arquitectónicos del sistema POS (descritos en los diagramas UML y la estructura de carpetas) en Historias de Usuario. Las historias están agrupadas según los contextos delimitados (Bounded Contexts) asignados a cada desarrollador, facilitando su autoasignación.

# Módulo 1: Ventas (Asignado a Cristian David Cruz Buitrago)

US-01: Gestión del ciclo de vida transaccional de una Venta

Descripción Funcional:
Como Cajero, el usuario requiere poder iniciar, procesar pagos y finalizar una venta, para poder facturar los productos a los clientes de forma eficiente.
Descripción Técnica:
Se debe orquestar el flujo desde la capa de Presentación (PanelVentas, ControladorVentas) invocando a los Casos de Uso (IniciarVentaCasoUso, PagarVentaCasoUso). Estos usarán el ServicioVentas y ServicioPagos (y sus respectivas implementaciones) para manipular el agregado principal (Venta, LineaVenta, Pago, Recibo) y persistir el estado (enum EstadoVenta) usando el RepositorioVentasImpl.
Criterios de Aceptación:

Dado que hay una venta iniciada, cuando se añaden productos, entonces el sistema debe actualizar el subtotal, impuestos y total usando el Value Object Money.

Dado que el total de la venta es mayor a cero, cuando se registra uno o varios pagos (efectivo, tarjeta), entonces la venta cambia a estado PAGADA y genera un objeto Recibo.

Dado que el cliente cancela la compra antes de pagar, cuando el cajero selecciona anular, entonces se ejecuta AnularVentaCasoUso y la venta cambia a ANULADA.

US-02: Gestión de Devoluciones y Descuentos

Descripción Funcional:
Como Cajero, el usuario requiere poder aplicar descuentos sobre el total o sobre líneas específicas, y procesar devoluciones de ventas anteriores, para gestionar políticas comerciales y garantías.
Descripción Técnica:
Requiere la implementación del Value Object Descuento asociado a LineaVenta. Adicionalmente, el modelado de la entidad Devolucion conectada a una Venta existente. Se apoyará en operaciones del ServicioVentas (y su implementación).
Criterios de Aceptación:

Dado un descuento porcentual o monto fijo válido, cuando se aplica a una LineaVenta, entonces el subtotal debe recalcularse correctamente.

Dada una venta previamente en estado PAGADA, cuando se aprueba una devolución, entonces se genera la instancia Devolucion y se invoca la restitución del total/parcial.

# Módulo 2: Inventario (Asignado a Juan Pablo Ocampo Rodriguez)

US-03: Control de Catálogo y Verificación de Stock

Descripción Funcional:
Como Gerente de Tienda, el usuario requiere administrar el catálogo de productos y visualizar sus niveles de inventario en tiempo real, para evitar desabastecimiento.
Descripción Técnica:
Involucra la interfaz Swing PanelInventario y ControladorInventario. A nivel de aplicación, se empleará ConsultarStockCasoUso y VerificarReordenCasoUso. Se manipularán las entidades Producto, Categoria y Stock, guardándose a través de RepositorioProductosImpl.
Criterios de Aceptación:

Dado que existe un catálogo de productos, cuando se consulta un SKU (ej. invocando consultarStock(Producto p)), entonces el sistema debe retornar el nivel actual, mínimo y máximo del Stock.

Dado un producto cuyo stock cae por debajo del nivel mínimo, cuando se ejecuta la verificación de reorden, entonces el sistema debe emitir una alerta booleana (verificarPuntoReorden() == true).

US-04: Registro de Movimientos Físicos de Inventario

Descripción Funcional:
Como Bodeguero, el usuario requiere registrar entradas, salidas y ajustes de inventario con un motivo justificado, para mantener la precisión entre el stock físico y del sistema.
Descripción Técnica:
Implementación de RealizarMovimientoCasoUso, que invoca al ServicioInventario (y su implementación) para crear registros de MovimientoInventario asociados al enumerado TipoMovimiento (ENTRADA, SALIDA, AJUSTE) e impactando al Stock.
Criterios de Aceptación:

Dado un producto válido, cuando se registra una ENTRADA por 50 unidades, entonces la cantidadActual del Stock debe incrementar exactamente en 50.

Dado un movimiento registrado, cuando se audita, entonces debe figurar el TipoMovimiento, cantidad, motivo y fecha exacta del sistema.

# Módulo 3: Compras y Bancos (Asignado a Brisa Juliana Morales Botía)

US-05: Abastecimiento y Cuentas por Pagar

Descripción Funcional:
Como Administrador, el usuario requiere crear órdenes de compra a proveedores y registrar la recepción de la mercancía, para gestionar el reabastecimiento y generar las cuentas por pagar correspondientes.
Descripción Técnica:
Orquestado por ControladorCompras hacia CrearCompraCasoUso y RecibirMercanciaCasoUso. Involucra el agregado de Compra, LineaCompra, Proveedor y la generación transaccional de una CuentaPorPagar. Depende de RepositorioComprasImpl.
Criterios de Aceptación:

Dado un proveedor y una lista de líneas de compra, cuando se guarda, entonces la orden queda en estado PENDIENTE.

Dada una orden PENDIENTE, cuando se ejecuta recibirMercancia(), entonces la compra pasa a RECIBIDA y se instancia automáticamente una CuentaPorPagar con estado PENDIENTE.

US-06: Operaciones Bancarias y Pagos a Proveedores

Descripción Funcional:
Como Tesorero, el usuario requiere realizar depósitos, retiros y pagar facturas a proveedores, para tener control del flujo de efectivo institucional en las cuentas bancarias.
Descripción Técnica:
Requiere DepositarCasoUso, RetirarCasoUso, TransferirCasoUso y RegistrarPagoProveedorCasoUso. Las entidades afectadas son CuentaBancaria, MovimientoBancario y se interactúa con la CuentaPorPagar persistida mediante RepositorioBancosImpl.
Criterios de Aceptación:

Dada una CuentaPorPagar activa, cuando se registra el pago completo, entonces el estado cambia a PAGADO y el saldo de la CuentaBancaria seleccionada disminuye según el monto.

Dado un depósito en una cuenta bancaria, cuando se confirma, se debe generar un MovimientoBancario de tipo DEPOSITO.

# Módulo 4: Configuración, Usuarios y Seguridad (Asignado a Juan José Díaz López)

US-07: Autenticación y Autorización por Roles

Descripción Funcional:
Como Empleado, el usuario requiere iniciar sesión en el sistema usando su PIN y que el sistema despliegue solo las funciones permitidas por su rol, para garantizar la seguridad operativa.
Descripción Técnica:
Se construirá AutenticarUsuarioCasoUso apoyado en RepositorioUsuariosImpl. La lógica de dominio validará credenciales mediante el método autenticar(String pin) en la entidad Usuario, evaluando los Permiso dentro del Rol.
Criterios de Aceptación:

Dado un inicio de sesión de usuario, cuando ingresa un hash o PIN inválido, entonces el sistema rechaza el acceso.

Dado un usuario con rol "Cajero", cuando ingresa al sistema, entonces la validación tienePermiso() debe otorgar acceso al módulo de Ventas y denegar accesos administrativos.

US-08: Gestión de Turnos y Parámetros Globales

Descripción Funcional:
Como Administrador, el usuario requiere definir la configuración del negocio (nombre, NIT, sucursal, impuestos) y supervisar los turnos de los empleados.
Descripción Técnica:
Desarrollo de CargarConfiguracionCasoUso (Entidad ConfiguracionGlobal, Sucursal) y GestionarTurnoCasoUso (Entidad Turno, Asistencia).
Criterios de Aceptación:

Dado el inicio del día laboral, cuando un usuario inicia turno, entonces se registra un objeto Turno con su respectiva horaInicio asociada al usuario.

Dada la pantalla de configuración, cuando se cambia el % de IVA general, entonces este valor queda persistido globalmente para el cálculo de facturas futuras.

# Módulo 5: Gestión de Caja y Clientes (Asignado a Diego Alejandro Manrique Fonseca)

US-09: Operatividad y Cuadre de Caja Principal

Descripción Funcional:
Como Cajero, el usuario requiere abrir la caja al iniciar la jornada, registrar movimientos menores (ingresos/egresos de efectivo) y ejecutar el cierre o cuadre al finalizar, para garantizar el control del efectivo.
Descripción Técnica:
Coordinado por ControladorCaja invocando AbrirCajaCasoUso, CerrarCajaCasoUso y RegistrarMovimientoCajaCasoUso. Se fundamenta en ServicioCaja (y su implementación) manejando la CajaPrincipal, MovimientoCaja y CierreCaja, apoyado por RepositorioCajaImpl.
Criterios de Aceptación:

Dado un empleado sin caja asignada, cuando intenta iniciar una venta, el sistema lo bloquea exigiendo ejecutar AbrirCajaCasoUso primero.

Dada una caja abierta, cuando se invoca cerrarCaja(), entonces el sistema genera la entidad CierreCaja, contrastando ventas e ingresos contra el saldo real reportado para verificar discrepancias.

US-10: Fidelización y Base de Datos de Clientes

Descripción Funcional:
Como Cajero, el usuario requiere registrar clientes nuevos y gestionar sus puntos de fidelidad o tarjetas de regalo para usarlos como forma de pago o retención.
Descripción Técnica:
Implementación de RegistrarClienteCasoUso, ActualizarClienteCasoUso, afectando las entidades Cliente, CuentaFidelidad, TarjetaRegalo a través del RepositorioClientesImpl.
Criterios de Aceptación:

Dado un cliente registrado con CuentaFidelidad, cuando realiza una compra parametrizada para dar puntos, entonces agregarPuntos(int monto) incrementa su saldo correctamente.

Dada una TarjetaRegalo activa, cuando el cliente intenta consumirla por un monto, si el saldo es suficiente, el método consumir(monto) debe retornar true y rebajar el valor.

# Módulo 6: Informes, Carga Masiva y Presentación Principal (Asignado a Juan Felippe Murillo Guerrero)

US-11: Tablero de Indicadores (Dashboard) y Reportes

Descripción Funcional:
Como Gerente, el usuario requiere visualizar un panel principal con los KPI (Indicadores Clave) de ventas, compras e inventario, además de generar reportes detallados en PDF/Excel, para la toma de decisiones.
Descripción Técnica:
Construcción de los casos de uso GenerarInformeVentasCasoUso y GenerarDashboardCasoUso llamando al ServicioInformes (y su implementación). Las entidades son Informe y Dashboard. Conexión con RepositorioInformesImpl y RepositorioVentasImpl.
Criterios de Aceptación:

Dado el requerimiento de cierre mensual, cuando se solicita el informe de ventas por fecha, entonces se genera una instancia de Informe con los totales correctos extraídos del periodo.

Dado el inicio de la aplicación, cuando carga el Dashboard, entonces debe consumir métricas transversales (ventas totales, top productos) y plasmarlas en la UI principal.

US-12: Orquestación UI e Importación de Datos en Lote

Descripción Funcional:
Como Administrador, el usuario requiere poder navegar fluidamente por todas las funciones del sistema en una ventana unificada y cargar catálogos de productos masivamente desde un archivo CSV o Excel.
Descripción Técnica:
Responsabilidad sobre el contenedor padre VentanaPrincipal (que orquesta los demás paneles inyectando controladores). A nivel backend, desarrollo de ImportarProductosCasoUso implementando la interfaz ServicioImportacion a través de clases de infraestructura como ImportadorCSV.
Criterios de Aceptación:

Dado el menú del sistema, cuando el usuario cambia de panel (Ventas a Inventario), el sistema utiliza el método cambiarPanel(String opcion) y mantiene el estado.

Dado un archivo CSV estructurado según formato estándar, cuando se ejecuta el importador, entonces los datos se mapean y persisten masivamente como nuevos objetos Producto en la base de datos sin romper transacciones en caso de un registro defectuoso.

Nota Arquitectónica para todo el equipo: Todas las historias descritas deben ser implementadas respetando las directrices de Clean Code y principios SOLID, garantizando el aislamiento estricto dictado por la arquitectura DDD, donde los Controladores de UI no pueden acceder de manera directa a los Repositorios de Infraestructura sin pasar por los Casos de Uso/Servicios de Aplicación.
