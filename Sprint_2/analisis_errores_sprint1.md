# Análisis de Errores por Estudiante (Sprint 1)

A continuación, se detalla el análisis del código desarrollado durante el primer sprint (Historias de Usuario Impares), las deficiencias detectadas y cómo deben ser abordadas por cada estudiante para ser corregidas y mejorar de cara al **Sprint 2**.

---

## 1. Cristian David Cruz Buitrago (Módulo: Ventas)
**Historia asignada (Sprint 1):** US-01: Gestión del ciclo de vida transaccional de una Venta

### Errores Detectados:
- **Controlador Incompleto y con Errores:** En `ControladorVentas.java` los métodos están completamente vacíos. Adicionalmente, recibe parámetros como `Producto p` pero no existe la importación correspondiente.
- **Caso de Uso Vacío:** `IniciarVentaCasoUso.java` es una clase en blanco. No tiene atributos, dependencias ni lógica.
- **Entidades Anémicas/Lógica Temporal:** En la entidad `Venta.java`, los métodos encargados de la lógica de negocio (como `calcularTotal()`) tienen comentarios de `"En proceso de implementacion"` y retornan variables temporales inconsistentes (retorna `propina` en lugar del cálculo del total).
- **Importaciones incorrectas:** Se utilizó el prefijo `main.java.com.pos...` en los imports de `Venta.java`.

### Correcciones requeridas:
1. Eliminar los imports que comienzan con `main.java.com...` y usar los imports relativos al `classpath` correcto (`com.pos...`).
2. Implementar los constructores en los Casos de Uso (ej: `IniciarVentaCasoUso`) para inyectar por interfaz el `ServicioVentas` y los Repositorios.
3. Escribir la lógica completa en las Entidades del Dominio. `Venta.java` no debe devolver variables estáticas ni temporales.

---

## 2. Juan Pablo Ocampo Rodriguez (Módulo: Inventario)
**Historia asignada (Sprint 1):** US-03: Control de Catálogo y Verificación de Stock

### Errores Detectados:
- **Nomenclatura de Paquetes Inválida:** Creó una carpeta llamada `casos de uso` (con espacios) dentro de la capa `application`. En Java, los paquetes no pueden llevar espacios.
- **Declaraciones de Paquetes Múltiples/Rutas Quebradas:** El archivo `ConsultarStockCasoUso.java` tiene declarado `package com.pos.application.inventario.casosdeuso;`, pero físicamente está en otra ruta. Adicionalmente, todos sus `import` están mal referenciados con `main.java.com...`.

### Correcciones requeridas:
1. Refactorizar/Renombrar el paquete `casos de uso` a `casosdeuso`.
2. Arreglar las directivas de todos los `import` y el `package` del archivo para que el código pueda compilar. 

---

## 3. Brisa Juliana Morales Botía (Módulo: Compras y Bancos)
**Historia asignada (Sprint 1):** US-05: Abastecimiento y Cuentas por Pagar

### Errores Detectados:
- **Ausencia de Importaciones y Declaración de Paquetes:** En `ControladorCompras.java`, no hay declaración de `package` ni uso de sentencias `import` para las clases `ServicioCompras`, `Proveedor`, `LineaCompra`, etc.
- **Errores Tipográficos:** La clase se llama `ControladosCompras` en lugar de `ControladorCompras`.
- **Casos de Uso Inexistentes:** `CrearCompraCasoUso.java` está en cero bytes (vacío completamente).

### Correcciones requeridas:
1. Añadir el nombre del paquete en la línea 1 y realizar todos los imports correspondientes. Corregir el nombre de la clase pública para que coincida con el archivo.
2. Inyectar las dependencias correspondientes (`ServicioCompras`, Repositorios) dentro de los constructores.
3. Desarrollar la lógica orquestadora dentro de los Casos de Uso, no dejarlos vacíos.

---

## 4. Juan José Díaz López (Módulo: Seguridad)
**Historia asignada (Sprint 1):** US-07: Autenticación y Autorización por Roles

### Errores Detectados:
- **[CRÍTICO] Violación del Principio de Inversión de Dependencias (SOLID):** En `AutenticarUsuarioCasoUso.java`, inyecta y utiliza directamente `RepositorioUsuariosImpl` en lugar de la interfaz `RepositorioUsuarios`. Esto acopla la Aplicación a la Infraestructura, rompiendo por completo DDD.
- **Invocaciones Estáticas a Métodos de Instancia:** Llama a `RepositorioUsuariosImpl.buscarPorNombre()` como si fuera un método estático, lo cual generará errores en tiempo de ejecución/compilación.
- **Fuga de Lógica de Infraestructura a Aplicación:** Invocación directa a `EncriptadorPin.encriptar()` (una clase de infraestructura tecnológica) en la capa de Aplicación.
- **Errores Sintácticos:** Declaró `this.RepositorioUsuariosImpl = repositorioUsuarios;` utilizando la clase en mayúscula en lugar del atributo.

### Correcciones requeridas:
1. El Caso de Uso **solo** debe conocer la interfaz `RepositorioUsuarios`. El inyector de dependencias (Spring, Guice, o manualmente) debe ser quien asigne la implementación `Impl`.
2. Para el proceso de encriptación del PIN, se debe crear una Interfaz en el Dominio (ej. `ServicioEncriptacion`) y llamar a esta interfaz dentro del Caso de Uso. La implementación (`EncriptadorPin`) solo debe residir en infraestructura.
3. Corregir los errores de escritura en Java (`this.atributo = valor;`).

---

## 5. Diego Alejandro Manrique Fonseca (Módulo: Gestión de Caja)
**Historia asignada (Sprint 1):** US-09: Operatividad y Cuadre de Caja Principal

### Errores Detectados:
- **Clases en Blanco (Incumplimiento Total):** Los archivos generados como `AbrirCajaCasoUso.java` tienen 0 bytes. No hay constructores, ni métodos, ni dependencias. 

### Correcciones requeridas:
1. Para el Sprint 2, este estudiante deberá implementar no solo su nueva historia par, sino que deberá ponerse al día desarrollando la lógica del Sprint 1 para poder abrir o cerrar caja.

---

## 6. Juan Felippe Murillo Guerrero (Módulo: Informes)
**Historia asignada (Sprint 1):** US-11: Tablero de Indicadores (Dashboard) y Reportes

### Errores Detectados:
- **Clases en Blanco (Incumplimiento Total):** Similar al estudiante anterior, las clases centrales de su responsabilidad como `GenerarDashboardCasoUso.java` y `VentanaPrincipal.java` (el núcleo contenedor de la UI) están completamente vacías. 

### Correcciones requeridas:
1. El estudiante bloquea parcialmente a sus compañeros al no proveer la ventana contenedora (`VentanaPrincipal`). Requiere priorizar el desarrollo de los Casos de Uso y orquestar las ventanas inmediatamente.
