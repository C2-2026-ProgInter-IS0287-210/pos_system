--
-- PostgreSQL database dump
--

\restrict J3vY0pXn3maYZoGH7efVKnnXgVdcw8bxQDfucgKSzhwnrLIEsjds4UW4eV3ct4H

-- Dumped from database version 17.11 (Debian 17.11-0+deb13u1)
-- Dumped by pg_dump version 17.11 (Debian 17.11-0+deb13u1)

-- Started on 2026-08-14 18:28:39 -05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE pos_system;
--
-- TOC entry 4561 (class 1262 OID 16396)
-- Name: pos_system; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pos_system WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es_ES.UTF-8';


ALTER DATABASE pos_system OWNER TO postgres;

\unrestrict J3vY0pXn3maYZoGH7efVKnnXgVdcw8bxQDfucgKSzhwnrLIEsjds4UW4eV3ct4H
\connect pos_system
\restrict J3vY0pXn3maYZoGH7efVKnnXgVdcw8bxQDfucgKSzhwnrLIEsjds4UW4eV3ct4H

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 12 (class 2615 OID 16402)
-- Name: bancos; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bancos;


ALTER SCHEMA bancos OWNER TO postgres;

--
-- TOC entry 11 (class 2615 OID 16401)
-- Name: caja; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA caja;


ALTER SCHEMA caja OWNER TO postgres;

--
-- TOC entry 10 (class 2615 OID 16400)
-- Name: clientes; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA clientes;


ALTER SCHEMA clientes OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 16399)
-- Name: compras; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA compras;


ALTER SCHEMA compras OWNER TO postgres;

--
-- TOC entry 13 (class 2615 OID 16403)
-- Name: configuracion; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA configuracion;


ALTER SCHEMA configuracion OWNER TO postgres;

--
-- TOC entry 14 (class 2615 OID 16404)
-- Name: informes; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA informes;


ALTER SCHEMA informes OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 16398)
-- Name: inventario; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA inventario;


ALTER SCHEMA inventario OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 16397)
-- Name: ventas; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ventas;


ALTER SCHEMA ventas OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 17054)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4562 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 960 (class 1247 OID 16474)
-- Name: estado_caja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_caja AS ENUM (
    'ABIERTA',
    'CERRADA',
    'BLOQUEADA'
);


ALTER TYPE public.estado_caja OWNER TO postgres;

--
-- TOC entry 951 (class 1247 OID 16442)
-- Name: estado_compra; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_compra AS ENUM (
    'PENDIENTE',
    'RECIBIDA',
    'ANULADA',
    'PARCIAL'
);


ALTER TYPE public.estado_compra OWNER TO postgres;

--
-- TOC entry 954 (class 1247 OID 16452)
-- Name: estado_pago; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_pago AS ENUM (
    'PENDIENTE',
    'PAGADO',
    'VENCIDO'
);


ALTER TYPE public.estado_pago OWNER TO postgres;

--
-- TOC entry 942 (class 1247 OID 16406)
-- Name: estado_venta; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_venta AS ENUM (
    'ABIERTA',
    'SUSPENDIDA',
    'PAGADA',
    'ANULADA',
    'DEVUELTA'
);


ALTER TYPE public.estado_venta OWNER TO postgres;

--
-- TOC entry 945 (class 1247 OID 16418)
-- Name: metodo_pago; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.metodo_pago AS ENUM (
    'EFECTIVO',
    'TARJETA_CREDITO',
    'TARJETA_DEBITO',
    'TRANSFERENCIA',
    'TARJETA_REGALO'
);


ALTER TYPE public.metodo_pago OWNER TO postgres;

--
-- TOC entry 966 (class 1247 OID 16494)
-- Name: permiso; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.permiso AS ENUM (
    'VENTAS',
    'CAJA',
    'INVENTARIO',
    'COMPRAS',
    'CLIENTES',
    'CONFIGURACION',
    'INFORMES',
    'ADMIN_USUARIOS'
);


ALTER TYPE public.permiso OWNER TO postgres;

--
-- TOC entry 963 (class 1247 OID 16482)
-- Name: tipo_movimiento_bancario; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_movimiento_bancario AS ENUM (
    'DEPOSITO',
    'RETIRO',
    'TRANSFERENCIA',
    'CARGO',
    'ABONO'
);


ALTER TYPE public.tipo_movimiento_bancario OWNER TO postgres;

--
-- TOC entry 957 (class 1247 OID 16460)
-- Name: tipo_movimiento_caja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_movimiento_caja AS ENUM (
    'APERTURA',
    'INGRESO',
    'EGRESO',
    'CIERRE',
    'RETIRO',
    'DEPOSITO'
);


ALTER TYPE public.tipo_movimiento_caja OWNER TO postgres;

--
-- TOC entry 948 (class 1247 OID 16430)
-- Name: tipo_movimiento_inv; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_movimiento_inv AS ENUM (
    'ENTRADA',
    'SALIDA',
    'DEVOLUCION',
    'TRASLADO',
    'AJUSTE'
);


ALTER TYPE public.tipo_movimiento_inv OWNER TO postgres;

--
-- TOC entry 321 (class 1255 OID 17050)
-- Name: transferir(uuid, uuid, numeric, text); Type: FUNCTION; Schema: bancos; Owner: postgres
--

CREATE FUNCTION bancos.transferir(p_id_cuenta_origen uuid, p_id_cuenta_destino uuid, p_monto numeric, p_concepto text DEFAULT 'Transferencia'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (SELECT saldo FROM bancos.cuenta_bancaria WHERE id = p_id_cuenta_origen) < p_monto THEN
        RAISE EXCEPTION 'Saldo insuficiente en cuenta origen';
    END IF;
    
    UPDATE bancos.cuenta_bancaria SET saldo = saldo - p_monto WHERE id = p_id_cuenta_origen;
    UPDATE bancos.cuenta_bancaria SET saldo = saldo + p_monto WHERE id = p_id_cuenta_destino;
    
    INSERT INTO bancos.movimiento_bancario (id_cuenta_bancaria, monto, tipo, concepto)
    VALUES (p_id_cuenta_origen, p_monto, 'TRANSFERENCIA', p_concepto || ' - Enviada');
    
    INSERT INTO bancos.movimiento_bancario (id_cuenta_bancaria, monto, tipo, concepto)
    VALUES (p_id_cuenta_destino, p_monto, 'TRANSFERENCIA', p_concepto || ' - Recibida');
END;
$$;


ALTER FUNCTION bancos.transferir(p_id_cuenta_origen uuid, p_id_cuenta_destino uuid, p_monto numeric, p_concepto text) OWNER TO postgres;

--
-- TOC entry 273 (class 1255 OID 17047)
-- Name: abrir_caja(uuid, uuid, numeric); Type: FUNCTION; Schema: caja; Owner: postgres
--

CREATE FUNCTION caja.abrir_caja(p_id_usuario uuid, p_id_sucursal uuid, p_monto_inicial numeric DEFAULT 0) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id_caja UUID;
BEGIN
    INSERT INTO caja.caja_principal (fecha_apertura, estado, id_usuario_responsable, id_sucursal, saldo_actual)
    VALUES (now(), 'ABIERTA', p_id_usuario, p_id_sucursal, p_monto_inicial)
    RETURNING id INTO v_id_caja;
    
    INSERT INTO caja.movimiento_caja (id_caja, tipo, monto, concepto, id_usuario)
    VALUES (v_id_caja, 'APERTURA', p_monto_inicial, 'Apertura de caja', p_id_usuario);
    
    RETURN v_id_caja;
END;
$$;


ALTER FUNCTION caja.abrir_caja(p_id_usuario uuid, p_id_sucursal uuid, p_monto_inicial numeric) OWNER TO postgres;

--
-- TOC entry 319 (class 1255 OID 17048)
-- Name: cerrar_caja(uuid, numeric, text); Type: FUNCTION; Schema: caja; Owner: postgres
--

CREATE FUNCTION caja.cerrar_caja(p_id_caja uuid, p_efectivo_real numeric, p_observaciones text DEFAULT NULL::text) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_ventas NUMERIC(12,2);
    v_ingresos NUMERIC(12,2);
    v_egresos NUMERIC(12,2);
    v_saldo NUMERIC(12,2);
    v_diferencia NUMERIC(12,2);
    v_id_cierre UUID;
BEGIN
    SELECT saldo_actual INTO v_saldo FROM caja.caja_principal WHERE id = p_id_caja;
    
    SELECT COALESCE(SUM(monto), 0) INTO v_ingresos
    FROM caja.movimiento_caja WHERE id_caja = p_id_caja AND tipo IN ('INGRESO', 'DEPOSITO');
    
    SELECT COALESCE(SUM(monto), 0) INTO v_egresos
    FROM caja.movimiento_caja WHERE id_caja = p_id_caja AND tipo IN ('EGRESO', 'RETIRO');
    
    v_diferencia := p_efectivo_real - v_saldo;
    
    INSERT INTO caja.cierre_caja (id_caja, total_ventas, total_ingresos, total_egresos, diferencia, observaciones)
    VALUES (p_id_caja, v_ingresos, v_ingresos, v_egresos, v_diferencia, p_observaciones)
    RETURNING id INTO v_id_cierre;
    
    UPDATE caja.caja_principal SET estado = 'CERRADA', fecha_cierre = now() WHERE id = p_id_caja;
    
    INSERT INTO caja.movimiento_caja (id_caja, tipo, monto, concepto)
    VALUES (p_id_caja, 'CIERRE', v_saldo, 'Cierre de caja');
    
    RETURN v_id_cierre;
END;
$$;


ALTER FUNCTION caja.cerrar_caja(p_id_caja uuid, p_efectivo_real numeric, p_observaciones text) OWNER TO postgres;

--
-- TOC entry 320 (class 1255 OID 17049)
-- Name: registrar_movimiento(uuid, public.tipo_movimiento_caja, numeric, text, uuid, character varying); Type: FUNCTION; Schema: caja; Owner: postgres
--

CREATE FUNCTION caja.registrar_movimiento(p_id_caja uuid, p_tipo public.tipo_movimiento_caja, p_monto numeric, p_concepto text, p_id_usuario uuid, p_referencia character varying DEFAULT NULL::character varying) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id_movimiento UUID;
    v_saldo NUMERIC;
BEGIN
    INSERT INTO caja.movimiento_caja (id_caja, tipo, monto, concepto, id_usuario, referencia)
    VALUES (p_id_caja, p_tipo, p_monto, p_concepto, p_id_usuario, p_referencia)
    RETURNING id INTO v_id_movimiento;
    
    -- Actualizar saldo
    IF p_tipo IN ('INGRESO', 'DEPOSITO') THEN
        UPDATE caja.caja_principal SET saldo_actual = saldo_actual + p_monto WHERE id = p_id_caja;
    ELSIF p_tipo IN ('EGRESO', 'RETIRO') THEN
        UPDATE caja.caja_principal SET saldo_actual = saldo_actual - p_monto WHERE id = p_id_caja;
    END IF;
    
    RETURN v_id_movimiento;
END;
$$;


ALTER FUNCTION caja.registrar_movimiento(p_id_caja uuid, p_tipo public.tipo_movimiento_caja, p_monto numeric, p_concepto text, p_id_usuario uuid, p_referencia character varying) OWNER TO postgres;

--
-- TOC entry 322 (class 1255 OID 17051)
-- Name: agregar_puntos(uuid, numeric); Type: FUNCTION; Schema: clientes; Owner: postgres
--

CREATE FUNCTION clientes.agregar_puntos(p_id_cliente uuid, p_monto_compra numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_puntos INTEGER;
    v_id_cuenta UUID;
BEGIN
    v_puntos := FLOOR(p_monto_compra / 1000); -- 1 punto por cada 1000
    
    SELECT id INTO v_id_cuenta FROM clientes.cuenta_fidelidad WHERE id_cliente = p_id_cliente;
    
    IF NOT FOUND THEN
        INSERT INTO clientes.cuenta_fidelidad (id_cliente, puntos) VALUES (p_id_cliente, v_puntos);
    ELSE
        UPDATE clientes.cuenta_fidelidad SET puntos = puntos + v_puntos, fecha_ultima_actividad = now()
        WHERE id = v_id_cuenta;
    END IF;
END;
$$;


ALTER FUNCTION clientes.agregar_puntos(p_id_cliente uuid, p_monto_compra numeric) OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 17044)
-- Name: agregar_linea_compra(uuid, uuid, integer, numeric, numeric); Type: FUNCTION; Schema: compras; Owner: postgres
--

CREATE FUNCTION compras.agregar_linea_compra(p_id_compra uuid, p_id_producto uuid, p_cantidad integer, p_precio_unitario numeric, p_descuento numeric DEFAULT 0) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id_linea UUID;
BEGIN
    INSERT INTO compras.linea_compra (id_compra, id_producto, cantidad, precio_unitario, descuento)
    VALUES (p_id_compra, p_id_producto, p_cantidad, p_precio_unitario, p_descuento)
    RETURNING id INTO v_id_linea;
    RETURN v_id_linea;
END;
$$;


ALTER FUNCTION compras.agregar_linea_compra(p_id_compra uuid, p_id_producto uuid, p_cantidad integer, p_precio_unitario numeric, p_descuento numeric) OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 17043)
-- Name: crear_compra(uuid, uuid); Type: FUNCTION; Schema: compras; Owner: postgres
--

CREATE FUNCTION compras.crear_compra(p_id_proveedor uuid, p_id_usuario uuid) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id_compra UUID;
BEGIN
    INSERT INTO compras.compra (id_proveedor, id_usuario)
    VALUES (p_id_proveedor, p_id_usuario)
    RETURNING id INTO v_id_compra;
    RETURN v_id_compra;
END;
$$;


ALTER FUNCTION compras.crear_compra(p_id_proveedor uuid, p_id_usuario uuid) OWNER TO postgres;

--
-- TOC entry 287 (class 1255 OID 17046)
-- Name: pagar_cuenta(uuid, numeric); Type: FUNCTION; Schema: compras; Owner: postgres
--

CREATE FUNCTION compras.pagar_cuenta(p_id_cuenta uuid, p_monto numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE compras.cuenta_por_pagar
    SET saldo_pendiente = saldo_pendiente - p_monto,
        estado = CASE WHEN saldo_pendiente - p_monto <= 0 THEN 'PAGADO' ELSE estado END
    WHERE id = p_id_cuenta;
END;
$$;


ALTER FUNCTION compras.pagar_cuenta(p_id_cuenta uuid, p_monto numeric) OWNER TO postgres;

--
-- TOC entry 286 (class 1255 OID 17045)
-- Name: recibir_mercancia(uuid); Type: FUNCTION; Schema: compras; Owner: postgres
--

CREATE FUNCTION compras.recibir_mercancia(p_id_compra uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_linea RECORD;
    v_total NUMERIC(12,2) := 0;
BEGIN
    -- Actualizar estado
    UPDATE compras.compra SET estado = 'RECIBIDA' WHERE id = p_id_compra;
    
    -- Ingresar stock por cada línea
    FOR v_linea IN SELECT * FROM compras.linea_compra WHERE id_compra = p_id_compra
    LOOP
        PERFORM inventario.ajustar_stock(
            v_linea.id_producto,
            (SELECT id_sucursal FROM caja.caja_principal WHERE estado = 'ABIERTA' LIMIT 1),
            v_linea.cantidad,
            'ENTRADA',
            'Compra ' || p_id_compra,
            (SELECT id_usuario FROM compras.compra WHERE id = p_id_compra)
        );
    END LOOP;
    
    -- Calcular total y generar cuenta por pagar
    SELECT COALESCE(SUM(subtotal), 0) INTO v_total
    FROM compras.linea_compra WHERE id_compra = p_id_compra;
    
    UPDATE compras.compra SET total = v_total WHERE id = p_id_compra;
    
    INSERT INTO compras.cuenta_por_pagar (id_compra, monto, saldo_pendiente)
    VALUES (p_id_compra, v_total, v_total);
END;
$$;


ALTER FUNCTION compras.recibir_mercancia(p_id_compra uuid) OWNER TO postgres;

--
-- TOC entry 324 (class 1255 OID 17053)
-- Name: autenticar_usuario(character varying, character varying); Type: FUNCTION; Schema: configuracion; Owner: postgres
--

CREATE FUNCTION configuracion.autenticar_usuario(p_nombre_usuario character varying, p_pin character varying) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id UUID;
BEGIN
    SELECT id INTO v_id FROM configuracion.usuario
    WHERE nombre_usuario = p_nombre_usuario AND hash_pin = crypt(p_pin, hash_pin) AND activo = true;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Credenciales inválidas';
    END IF;
    RETURN v_id;
END;
$$;


ALTER FUNCTION configuracion.autenticar_usuario(p_nombre_usuario character varying, p_pin character varying) OWNER TO postgres;

--
-- TOC entry 323 (class 1255 OID 17052)
-- Name: generar_informe_ventas(timestamp without time zone, timestamp without time zone, uuid); Type: FUNCTION; Schema: informes; Owner: postgres
--

CREATE FUNCTION informes.generar_informe_ventas(p_fecha_inicio timestamp without time zone, p_fecha_fin timestamp without time zone, p_id_usuario uuid) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id_informe UUID;
    v_datos JSONB;
BEGIN
    SELECT jsonb_build_object(
        'total_ventas', COUNT(*),
        'monto_total', COALESCE(SUM(total), 0),
        'ventas_efectivo', COUNT(*) FILTER (WHERE EXISTS (
            SELECT 1 FROM ventas.pago WHERE id_venta = ventas.venta.id AND metodo_pago = 'EFECTIVO'
        )),
        'ventas_tarjeta', COUNT(*) FILTER (WHERE EXISTS (
            SELECT 1 FROM ventas.pago WHERE id_venta = ventas.venta.id AND metodo_pago IN ('TARJETA_CREDITO', 'TARJETA_DEBITO')
        ))
    ) INTO v_datos
    FROM ventas.venta
    WHERE fecha BETWEEN p_fecha_inicio AND p_fecha_fin AND estado = 'PAGADA';
    
    INSERT INTO informes.informe (tipo, datos_json, id_usuario)
    VALUES ('VENTAS', v_datos, p_id_usuario)
    RETURNING id INTO v_id_informe;
    
    RETURN v_id_informe;
END;
$$;


ALTER FUNCTION informes.generar_informe_ventas(p_fecha_inicio timestamp without time zone, p_fecha_fin timestamp without time zone, p_id_usuario uuid) OWNER TO postgres;

--
-- TOC entry 317 (class 1255 OID 17041)
-- Name: ajustar_stock(uuid, uuid, integer, public.tipo_movimiento_inv, text, uuid); Type: FUNCTION; Schema: inventario; Owner: postgres
--

CREATE FUNCTION inventario.ajustar_stock(p_id_producto uuid, p_id_sucursal uuid, p_cantidad integer, p_tipo public.tipo_movimiento_inv, p_motivo text, p_id_usuario uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id_stock UUID;
BEGIN
    SELECT id INTO v_id_stock FROM inventario.stock
    WHERE id_producto = p_id_producto AND id_sucursal = p_id_sucursal;
    
    IF NOT FOUND THEN
        INSERT INTO inventario.stock (id_producto, id_sucursal, cantidad_actual)
        VALUES (p_id_producto, p_id_sucursal, 0)
        RETURNING id INTO v_id_stock;
    END IF;
    
    IF p_tipo IN ('ENTRADA', 'DEVOLUCION') THEN
        UPDATE inventario.stock SET cantidad_actual = cantidad_actual + p_cantidad WHERE id = v_id_stock;
    ELSIF p_tipo IN ('SALIDA', 'TRASLADO', 'AJUSTE') THEN
        UPDATE inventario.stock SET cantidad_actual = cantidad_actual - p_cantidad WHERE id = v_id_stock;
    END IF;
    
    INSERT INTO inventario.movimiento_inventario (id_stock, tipo_movimiento, cantidad, motivo, id_usuario)
    VALUES (v_id_stock, p_tipo, p_cantidad, p_motivo, p_id_usuario);
END;
$$;


ALTER FUNCTION inventario.ajustar_stock(p_id_producto uuid, p_id_sucursal uuid, p_cantidad integer, p_tipo public.tipo_movimiento_inv, p_motivo text, p_id_usuario uuid) OWNER TO postgres;

--
-- TOC entry 318 (class 1255 OID 17042)
-- Name: verificar_reorden(uuid, uuid); Type: FUNCTION; Schema: inventario; Owner: postgres
--

CREATE FUNCTION inventario.verificar_reorden(p_id_producto uuid, p_id_sucursal uuid) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_stock RECORD;
BEGIN
    SELECT * INTO v_stock FROM inventario.stock
    WHERE id_producto = p_id_producto AND id_sucursal = p_id_sucursal;
    
    IF FOUND AND v_stock.cantidad_actual <= v_stock.nivel_minimo THEN
        RETURN TRUE;
    END IF;
    RETURN FALSE;
END;
$$;


ALTER FUNCTION inventario.verificar_reorden(p_id_producto uuid, p_id_sucursal uuid) OWNER TO postgres;

--
-- TOC entry 313 (class 1255 OID 17037)
-- Name: agregar_linea_venta(uuid, uuid, integer, numeric, numeric); Type: FUNCTION; Schema: ventas; Owner: postgres
--

CREATE FUNCTION ventas.agregar_linea_venta(p_id_venta uuid, p_id_producto uuid, p_cantidad integer, p_descuento_porcentaje numeric DEFAULT 0, p_descuento_monto_fijo numeric DEFAULT 0) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_precio NUMERIC(12,2);
    v_id_linea UUID;
    v_stock_actual INTEGER;
BEGIN
    -- Verificar que la venta esté abierta
    IF (SELECT estado FROM ventas.venta WHERE id = p_id_venta) != 'ABIERTA' THEN
        RAISE EXCEPTION 'La venta no está abierta';
    END IF;
    
    -- Obtener precio del producto
    SELECT precio INTO v_precio FROM inventario.producto WHERE id = p_id_producto;
    
    -- Verificar stock (opcional, lógica de negocio)
    SELECT cantidad_actual INTO v_stock_actual 
    FROM inventario.stock 
    WHERE id_producto = p_id_producto 
      AND id_sucursal = (SELECT id_sucursal FROM ventas.venta WHERE id = p_id_venta);
    
    IF v_stock_actual < p_cantidad THEN
        RAISE EXCEPTION 'Stock insuficiente. Disponible: %', v_stock_actual;
    END IF;
    
    INSERT INTO ventas.linea_venta (id_venta, id_producto, cantidad, precio_unitario, descuento_porcentaje, descuento_monto_fijo)
    VALUES (p_id_venta, p_id_producto, p_cantidad, v_precio, p_descuento_porcentaje, p_descuento_monto_fijo)
    RETURNING id INTO v_id_linea;
    
    RETURN v_id_linea;
END;
$$;


ALTER FUNCTION ventas.agregar_linea_venta(p_id_venta uuid, p_id_producto uuid, p_cantidad integer, p_descuento_porcentaje numeric, p_descuento_monto_fijo numeric) OWNER TO postgres;

--
-- TOC entry 316 (class 1255 OID 17040)
-- Name: anular_venta(uuid, text); Type: FUNCTION; Schema: ventas; Owner: postgres
--

CREATE FUNCTION ventas.anular_venta(p_id_venta uuid, p_motivo text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE ventas.venta SET estado = 'ANULADA' WHERE id = p_id_venta AND estado IN ('ABIERTA', 'SUSPENDIDA');
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No se puede anular la venta. Estado actual inválido.';
    END IF;
END;
$$;


ALTER FUNCTION ventas.anular_venta(p_id_venta uuid, p_motivo text) OWNER TO postgres;

--
-- TOC entry 261 (class 1255 OID 17036)
-- Name: crear_venta(uuid, uuid, uuid); Type: FUNCTION; Schema: ventas; Owner: postgres
--

CREATE FUNCTION ventas.crear_venta(p_id_usuario uuid, p_id_sucursal uuid, p_id_cliente uuid DEFAULT NULL::uuid) RETURNS uuid
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id_venta UUID;
BEGIN
    INSERT INTO ventas.venta (id_usuario, id_sucursal, id_cliente, estado)
    VALUES (p_id_usuario, p_id_sucursal, p_id_cliente, 'ABIERTA')
    RETURNING id INTO v_id_venta;
    RETURN v_id_venta;
END;
$$;


ALTER FUNCTION ventas.crear_venta(p_id_usuario uuid, p_id_sucursal uuid, p_id_cliente uuid) OWNER TO postgres;

--
-- TOC entry 314 (class 1255 OID 17038)
-- Name: pagar_venta(uuid, public.metodo_pago, numeric, uuid); Type: FUNCTION; Schema: ventas; Owner: postgres
--

CREATE FUNCTION ventas.pagar_venta(p_id_venta uuid, p_metodo_pago public.metodo_pago, p_monto numeric, p_id_cuenta_bancaria uuid DEFAULT NULL::uuid) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_total NUMERIC(12,2);
    v_cambio NUMERIC(12,2) := 0;
    v_id_stock UUID;
    v_linea RECORD;
BEGIN
    -- Calcular total
    SELECT COALESCE(SUM(subtotal), 0) INTO v_total
    FROM ventas.linea_venta WHERE id_venta = p_id_venta;
    
    IF p_monto < v_total AND p_metodo_pago = 'EFECTIVO' THEN
        RAISE EXCEPTION 'Monto insuficiente. Total: %, Entregado: %', v_total, p_monto;
    END IF;
    
    v_cambio := p_monto - v_total;
    
    -- Registrar pago
    INSERT INTO ventas.pago (id_venta, metodo_pago, monto, cambio, id_cuenta_bancaria)
    VALUES (p_id_venta, p_metodo_pago, p_monto, v_cambio, p_id_cuenta_bancaria);
    
    -- Actualizar estado
    UPDATE ventas.venta SET estado = 'PAGADA', total = v_total WHERE id = p_id_venta;
    
    -- Descontar stock
    FOR v_linea IN SELECT * FROM ventas.linea_venta WHERE id_venta = p_id_venta
    LOOP
        SELECT id INTO v_id_stock FROM inventario.stock
        WHERE id_producto = v_linea.id_producto
          AND id_sucursal = (SELECT id_sucursal FROM ventas.venta WHERE id = p_id_venta);
        
        UPDATE inventario.stock
        SET cantidad_actual = cantidad_actual - v_linea.cantidad
        WHERE id = v_id_stock;
        
        -- Registrar movimiento
        INSERT INTO inventario.movimiento_inventario (id_stock, tipo_movimiento, cantidad, motivo)
        VALUES (v_id_stock, 'SALIDA', v_linea.cantidad, 'Venta ' || p_id_venta);
    END LOOP;
    
    -- Generar recibo
    INSERT INTO ventas.recibo (id_venta, formato, contenido)
    VALUES (p_id_venta, 'TICKET', 'Recibo de venta ' || p_id_venta);
    
    RETURN TRUE;
END;
$$;


ALTER FUNCTION ventas.pagar_venta(p_id_venta uuid, p_metodo_pago public.metodo_pago, p_monto numeric, p_id_cuenta_bancaria uuid) OWNER TO postgres;

--
-- TOC entry 315 (class 1255 OID 17039)
-- Name: suspender_venta(uuid); Type: FUNCTION; Schema: ventas; Owner: postgres
--

CREATE FUNCTION ventas.suspender_venta(p_id_venta uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE ventas.venta SET estado = 'SUSPENDIDA' WHERE id = p_id_venta AND estado = 'ABIERTA';
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No se puede suspender la venta. Estado actual no es ABIERTA.';
    END IF;
END;
$$;


ALTER FUNCTION ventas.suspender_venta(p_id_venta uuid) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 245 (class 1259 OID 16775)
-- Name: cuenta_bancaria; Type: TABLE; Schema: bancos; Owner: postgres
--

CREATE TABLE bancos.cuenta_bancaria (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    numero character varying(50) NOT NULL,
    entidad character varying(100) NOT NULL,
    tipo character varying(50),
    saldo numeric(12,2) DEFAULT 0,
    moneda character varying(3) DEFAULT 'COP'::character varying,
    id_sucursal uuid
);


ALTER TABLE bancos.cuenta_bancaria OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16790)
-- Name: movimiento_bancario; Type: TABLE; Schema: bancos; Owner: postgres
--

CREATE TABLE bancos.movimiento_bancario (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_cuenta_bancaria uuid,
    fecha timestamp without time zone DEFAULT now(),
    concepto text,
    monto numeric(12,2) NOT NULL,
    tipo public.tipo_movimiento_bancario NOT NULL,
    referencia character varying(100)
);


ALTER TABLE bancos.movimiento_bancario OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16804)
-- Name: caja_principal; Type: TABLE; Schema: caja; Owner: postgres
--

CREATE TABLE caja.caja_principal (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    saldo_actual numeric(12,2) DEFAULT 0,
    fecha_apertura timestamp without time zone NOT NULL,
    fecha_cierre timestamp without time zone,
    estado public.estado_caja DEFAULT 'ABIERTA'::public.estado_caja,
    id_usuario_responsable uuid,
    id_sucursal uuid
);


ALTER TABLE caja.caja_principal OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16851)
-- Name: cierre_caja; Type: TABLE; Schema: caja; Owner: postgres
--

CREATE TABLE caja.cierre_caja (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_caja uuid,
    fecha timestamp without time zone DEFAULT now(),
    total_ventas numeric(12,2) DEFAULT 0,
    total_ingresos numeric(12,2) DEFAULT 0,
    total_egresos numeric(12,2) DEFAULT 0,
    diferencia numeric(12,2) DEFAULT 0,
    observaciones text
);


ALTER TABLE caja.cierre_caja OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 16827)
-- Name: movimiento_caja; Type: TABLE; Schema: caja; Owner: postgres
--

CREATE TABLE caja.movimiento_caja (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_caja uuid,
    tipo public.tipo_movimiento_caja NOT NULL,
    monto numeric(12,2) NOT NULL,
    concepto text,
    fecha timestamp without time zone DEFAULT now(),
    id_usuario uuid,
    referencia character varying(100),
    id_cuenta_bancaria uuid
);


ALTER TABLE caja.movimiento_caja OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16720)
-- Name: cliente; Type: TABLE; Schema: clientes; Owner: postgres
--

CREATE TABLE clientes.cliente (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre character varying(200) NOT NULL,
    email character varying(150),
    telefono character varying(20),
    direccion text,
    notas text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE clientes.cliente OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16745)
-- Name: cuenta_credito; Type: TABLE; Schema: clientes; Owner: postgres
--

CREATE TABLE clientes.cuenta_credito (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_cliente uuid,
    limite_credito numeric(12,2) NOT NULL,
    saldo numeric(12,2) DEFAULT 0,
    fecha_corte date
);


ALTER TABLE clientes.cuenta_credito OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16729)
-- Name: cuenta_fidelidad; Type: TABLE; Schema: clientes; Owner: postgres
--

CREATE TABLE clientes.cuenta_fidelidad (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_cliente uuid,
    puntos integer DEFAULT 0,
    fecha_ultima_actividad timestamp without time zone DEFAULT now(),
    CONSTRAINT cuenta_fidelidad_puntos_check CHECK ((puntos >= 0))
);


ALTER TABLE clientes.cuenta_fidelidad OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16759)
-- Name: tarjeta_regalo; Type: TABLE; Schema: clientes; Owner: postgres
--

CREATE TABLE clientes.tarjeta_regalo (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_cliente uuid,
    numero character varying(50) NOT NULL,
    saldo numeric(12,2) DEFAULT 0,
    fecha_vencimiento date,
    CONSTRAINT tarjeta_regalo_saldo_check CHECK ((saldo >= (0)::numeric))
);


ALTER TABLE clientes.tarjeta_regalo OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16877)
-- Name: compra; Type: TABLE; Schema: compras; Owner: postgres
--

CREATE TABLE compras.compra (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    fecha timestamp without time zone DEFAULT now(),
    total numeric(12,2) DEFAULT 0,
    estado public.estado_compra DEFAULT 'PENDIENTE'::public.estado_compra,
    id_proveedor uuid,
    id_usuario uuid
);


ALTER TABLE compras.compra OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16915)
-- Name: cuenta_por_pagar; Type: TABLE; Schema: compras; Owner: postgres
--

CREATE TABLE compras.cuenta_por_pagar (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_compra uuid,
    monto numeric(12,2) NOT NULL,
    fecha_emision date DEFAULT CURRENT_DATE,
    fecha_vencimiento date,
    estado public.estado_pago DEFAULT 'PENDIENTE'::public.estado_pago,
    saldo_pendiente numeric(12,2) NOT NULL
);


ALTER TABLE compras.cuenta_por_pagar OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16896)
-- Name: linea_compra; Type: TABLE; Schema: compras; Owner: postgres
--

CREATE TABLE compras.linea_compra (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_compra uuid,
    id_producto uuid,
    cantidad integer NOT NULL,
    precio_unitario numeric(12,2) NOT NULL,
    descuento numeric(12,2) DEFAULT 0,
    subtotal numeric(12,2) GENERATED ALWAYS AS ((((cantidad)::numeric * precio_unitario) - descuento)) STORED,
    CONSTRAINT linea_compra_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE compras.linea_compra OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16869)
-- Name: proveedor; Type: TABLE; Schema: compras; Owner: postgres
--

CREATE TABLE compras.proveedor (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre character varying(200) NOT NULL,
    contacto character varying(100),
    direccion text,
    telefono character varying(20),
    email character varying(150)
);


ALTER TABLE compras.proveedor OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16581)
-- Name: asistencia; Type: TABLE; Schema: configuracion; Owner: postgres
--

CREATE TABLE configuracion.asistencia (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_usuario uuid,
    hora_entrada timestamp without time zone NOT NULL,
    hora_salida timestamp without time zone,
    observaciones text
);


ALTER TABLE configuracion.asistencia OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16522)
-- Name: configuracion_global; Type: TABLE; Schema: configuracion; Owner: postgres
--

CREATE TABLE configuracion.configuracion_global (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre_negocio character varying(200) NOT NULL,
    direccion text,
    telefono character varying(20),
    modo_offline boolean DEFAULT false,
    idioma character varying(10) DEFAULT 'es'::character varying,
    moneda character varying(3) DEFAULT 'COP'::character varying,
    iva numeric(5,2) DEFAULT 19.00,
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE configuracion.configuracion_global OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16535)
-- Name: rol; Type: TABLE; Schema: configuracion; Owner: postgres
--

CREATE TABLE configuracion.rol (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE configuracion.rol OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16543)
-- Name: rol_permiso; Type: TABLE; Schema: configuracion; Owner: postgres
--

CREATE TABLE configuracion.rol_permiso (
    id_rol uuid NOT NULL,
    permiso public.permiso NOT NULL
);


ALTER TABLE configuracion.rol_permiso OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16511)
-- Name: sucursal; Type: TABLE; Schema: configuracion; Owner: postgres
--

CREATE TABLE configuracion.sucursal (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre character varying(150) NOT NULL,
    direccion text,
    telefono character varying(20),
    codigo character varying(10) NOT NULL,
    horario character varying(100),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE configuracion.sucursal OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16570)
-- Name: turno; Type: TABLE; Schema: configuracion; Owner: postgres
--

CREATE TABLE configuracion.turno (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_usuario uuid,
    id_caja uuid,
    hora_inicio timestamp without time zone NOT NULL,
    hora_fin timestamp without time zone,
    efectivo_esperado numeric(12,2),
    efectivo_real numeric(12,2)
);


ALTER TABLE configuracion.turno OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16553)
-- Name: usuario; Type: TABLE; Schema: configuracion; Owner: postgres
--

CREATE TABLE configuracion.usuario (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre_usuario character varying(50) NOT NULL,
    hash_pin character varying(255) NOT NULL,
    nombre_completo character varying(200) NOT NULL,
    id_rol uuid,
    activo boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE configuracion.usuario OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 17022)
-- Name: informe; Type: TABLE; Schema: informes; Owner: postgres
--

CREATE TABLE informes.informe (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    tipo character varying(50) NOT NULL,
    fecha_generacion timestamp without time zone DEFAULT now(),
    datos_json jsonb,
    id_usuario uuid
);


ALTER TABLE informes.informe OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16594)
-- Name: categoria; Type: TABLE; Schema: inventario; Owner: postgres
--

CREATE TABLE inventario.categoria (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    id_categoria_padre uuid
);


ALTER TABLE inventario.categoria OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16649)
-- Name: kit_componente; Type: TABLE; Schema: inventario; Owner: postgres
--

CREATE TABLE inventario.kit_componente (
    id_kit uuid NOT NULL,
    id_producto uuid NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT kit_componente_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE inventario.kit_componente OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16637)
-- Name: kit_producto; Type: TABLE; Schema: inventario; Owner: postgres
--

CREATE TABLE inventario.kit_producto (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_producto uuid,
    descuento_kit numeric(12,2) DEFAULT 0
);


ALTER TABLE inventario.kit_producto OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16706)
-- Name: lote; Type: TABLE; Schema: inventario; Owner: postgres
--

CREATE TABLE inventario.lote (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_producto uuid,
    numero_lote character varying(50) NOT NULL,
    fecha_fabricacion date,
    fecha_caducidad date,
    cantidad_inicial integer NOT NULL,
    cantidad_disponible integer DEFAULT 0 NOT NULL
);


ALTER TABLE inventario.lote OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16687)
-- Name: movimiento_inventario; Type: TABLE; Schema: inventario; Owner: postgres
--

CREATE TABLE inventario.movimiento_inventario (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_stock uuid,
    tipo_movimiento public.tipo_movimiento_inv NOT NULL,
    cantidad integer NOT NULL,
    motivo text,
    fecha timestamp without time zone DEFAULT now(),
    id_usuario uuid
);


ALTER TABLE inventario.movimiento_inventario OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16607)
-- Name: producto; Type: TABLE; Schema: inventario; Owner: postgres
--

CREATE TABLE inventario.producto (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sku character varying(50) NOT NULL,
    codigo_barras character varying(100),
    nombre character varying(200) NOT NULL,
    precio numeric(12,2) NOT NULL,
    costo numeric(12,2) NOT NULL,
    restringe_edad boolean DEFAULT false,
    venta_a_granel boolean DEFAULT false,
    id_categoria uuid,
    activo boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT producto_costo_check CHECK ((costo >= (0)::numeric)),
    CONSTRAINT producto_precio_check CHECK ((precio >= (0)::numeric))
);


ALTER TABLE inventario.producto OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16665)
-- Name: stock; Type: TABLE; Schema: inventario; Owner: postgres
--

CREATE TABLE inventario.stock (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_producto uuid,
    id_sucursal uuid,
    cantidad_actual integer DEFAULT 0 NOT NULL,
    nivel_minimo integer DEFAULT 0,
    nivel_maximo integer DEFAULT 9999,
    ubicacion character varying(100),
    CONSTRAINT stock_cantidad_actual_check CHECK ((cantidad_actual >= 0))
);


ALTER TABLE inventario.stock OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16626)
-- Name: variante_producto; Type: TABLE; Schema: inventario; Owner: postgres
--

CREATE TABLE inventario.variante_producto (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_producto_padre uuid,
    talla character varying(20),
    color character varying(30)
);


ALTER TABLE inventario.variante_producto OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 17007)
-- Name: devolucion; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.devolucion (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_venta uuid,
    motivo text NOT NULL,
    monto_reembolso numeric(12,2) NOT NULL,
    fecha timestamp without time zone DEFAULT now(),
    autorizada boolean DEFAULT false,
    codigo_autorizacion character varying(50)
);


ALTER TABLE ventas.devolucion OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16954)
-- Name: linea_venta; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.linea_venta (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_venta uuid,
    id_producto uuid,
    cantidad integer NOT NULL,
    precio_unitario numeric(12,2) NOT NULL,
    descuento_porcentaje numeric(5,2) DEFAULT 0,
    descuento_monto_fijo numeric(12,2) DEFAULT 0,
    subtotal numeric(12,2) GENERATED ALWAYS AS (((((cantidad)::numeric * precio_unitario) * ((1)::numeric - (descuento_porcentaje / (100)::numeric))) - descuento_monto_fijo)) STORED,
    CONSTRAINT linea_venta_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE ventas.linea_venta OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 16974)
-- Name: pago; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.pago (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_venta uuid,
    metodo_pago public.metodo_pago NOT NULL,
    monto numeric(12,2) NOT NULL,
    cambio numeric(12,2) DEFAULT 0,
    id_cuenta_bancaria uuid,
    fecha timestamp without time zone DEFAULT now()
);


ALTER TABLE ventas.pago OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 16992)
-- Name: recibo; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.recibo (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    id_venta uuid,
    formato character varying(20) DEFAULT 'TICKET'::character varying,
    contenido text,
    fecha_emision timestamp without time zone DEFAULT now()
);


ALTER TABLE ventas.recibo OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 16928)
-- Name: venta; Type: TABLE; Schema: ventas; Owner: postgres
--

CREATE TABLE ventas.venta (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    fecha timestamp without time zone DEFAULT now(),
    estado public.estado_venta DEFAULT 'ABIERTA'::public.estado_venta,
    total numeric(12,2) DEFAULT 0,
    impuestos numeric(12,2) DEFAULT 0,
    propina numeric(12,2) DEFAULT 0,
    id_cliente uuid,
    id_usuario uuid,
    id_sucursal uuid
);


ALTER TABLE ventas.venta OWNER TO postgres;

--
-- TOC entry 4541 (class 0 OID 16775)
-- Dependencies: 245
-- Data for Name: cuenta_bancaria; Type: TABLE DATA; Schema: bancos; Owner: postgres
--



--
-- TOC entry 4542 (class 0 OID 16790)
-- Dependencies: 246
-- Data for Name: movimiento_bancario; Type: TABLE DATA; Schema: bancos; Owner: postgres
--



--
-- TOC entry 4543 (class 0 OID 16804)
-- Dependencies: 247
-- Data for Name: caja_principal; Type: TABLE DATA; Schema: caja; Owner: postgres
--



--
-- TOC entry 4545 (class 0 OID 16851)
-- Dependencies: 249
-- Data for Name: cierre_caja; Type: TABLE DATA; Schema: caja; Owner: postgres
--



--
-- TOC entry 4544 (class 0 OID 16827)
-- Dependencies: 248
-- Data for Name: movimiento_caja; Type: TABLE DATA; Schema: caja; Owner: postgres
--



--
-- TOC entry 4537 (class 0 OID 16720)
-- Dependencies: 241
-- Data for Name: cliente; Type: TABLE DATA; Schema: clientes; Owner: postgres
--



--
-- TOC entry 4539 (class 0 OID 16745)
-- Dependencies: 243
-- Data for Name: cuenta_credito; Type: TABLE DATA; Schema: clientes; Owner: postgres
--



--
-- TOC entry 4538 (class 0 OID 16729)
-- Dependencies: 242
-- Data for Name: cuenta_fidelidad; Type: TABLE DATA; Schema: clientes; Owner: postgres
--



--
-- TOC entry 4540 (class 0 OID 16759)
-- Dependencies: 244
-- Data for Name: tarjeta_regalo; Type: TABLE DATA; Schema: clientes; Owner: postgres
--



--
-- TOC entry 4547 (class 0 OID 16877)
-- Dependencies: 251
-- Data for Name: compra; Type: TABLE DATA; Schema: compras; Owner: postgres
--



--
-- TOC entry 4549 (class 0 OID 16915)
-- Dependencies: 253
-- Data for Name: cuenta_por_pagar; Type: TABLE DATA; Schema: compras; Owner: postgres
--



--
-- TOC entry 4548 (class 0 OID 16896)
-- Dependencies: 252
-- Data for Name: linea_compra; Type: TABLE DATA; Schema: compras; Owner: postgres
--



--
-- TOC entry 4546 (class 0 OID 16869)
-- Dependencies: 250
-- Data for Name: proveedor; Type: TABLE DATA; Schema: compras; Owner: postgres
--

INSERT INTO compras.proveedor VALUES ('ae7dfe7a-56a9-4efa-a1d9-f3da40c0adfe', 'Distribuidora Principal', 'Juan Pérez', NULL, '555-1000', 'contacto@distprincipal.com');


--
-- TOC entry 4528 (class 0 OID 16581)
-- Dependencies: 232
-- Data for Name: asistencia; Type: TABLE DATA; Schema: configuracion; Owner: postgres
--



--
-- TOC entry 4523 (class 0 OID 16522)
-- Dependencies: 227
-- Data for Name: configuracion_global; Type: TABLE DATA; Schema: configuracion; Owner: postgres
--

INSERT INTO configuracion.configuracion_global VALUES ('42c943f8-efc8-46b6-bd38-2518e001af94', 'Mi Tienda POS', 'Calle 123, Ciudad', '555-0000', false, 'es', 'COP', 19.00, '2026-07-01 23:41:20.114518');


--
-- TOC entry 4524 (class 0 OID 16535)
-- Dependencies: 228
-- Data for Name: rol; Type: TABLE DATA; Schema: configuracion; Owner: postgres
--

INSERT INTO configuracion.rol VALUES ('4322850d-48bf-4ecc-8295-9f806893b39b', 'ADMINISTRADOR');
INSERT INTO configuracion.rol VALUES ('2ec9a261-12fb-4afb-a06c-189414f05266', 'CAJERO');
INSERT INTO configuracion.rol VALUES ('d9e93a14-41d6-41f6-a245-4a5c9738c695', 'SUPERVISOR');
INSERT INTO configuracion.rol VALUES ('6b0847aa-2a89-443b-b95e-14d3055abae2', 'BODEGUERO');


--
-- TOC entry 4525 (class 0 OID 16543)
-- Dependencies: 229
-- Data for Name: rol_permiso; Type: TABLE DATA; Schema: configuracion; Owner: postgres
--

INSERT INTO configuracion.rol_permiso VALUES ('4322850d-48bf-4ecc-8295-9f806893b39b', 'VENTAS');
INSERT INTO configuracion.rol_permiso VALUES ('4322850d-48bf-4ecc-8295-9f806893b39b', 'CAJA');
INSERT INTO configuracion.rol_permiso VALUES ('4322850d-48bf-4ecc-8295-9f806893b39b', 'INVENTARIO');
INSERT INTO configuracion.rol_permiso VALUES ('4322850d-48bf-4ecc-8295-9f806893b39b', 'COMPRAS');
INSERT INTO configuracion.rol_permiso VALUES ('4322850d-48bf-4ecc-8295-9f806893b39b', 'CLIENTES');
INSERT INTO configuracion.rol_permiso VALUES ('4322850d-48bf-4ecc-8295-9f806893b39b', 'CONFIGURACION');
INSERT INTO configuracion.rol_permiso VALUES ('4322850d-48bf-4ecc-8295-9f806893b39b', 'INFORMES');
INSERT INTO configuracion.rol_permiso VALUES ('4322850d-48bf-4ecc-8295-9f806893b39b', 'ADMIN_USUARIOS');


--
-- TOC entry 4522 (class 0 OID 16511)
-- Dependencies: 226
-- Data for Name: sucursal; Type: TABLE DATA; Schema: configuracion; Owner: postgres
--

INSERT INTO configuracion.sucursal VALUES ('5d43f74e-0acc-4c59-bd67-8eee0eded34f', 'Sucursal Principal', 'Calle 123, Ciudad', '555-0001', 'SP001', NULL, '2026-07-01 23:41:20.114518');


--
-- TOC entry 4527 (class 0 OID 16570)
-- Dependencies: 231
-- Data for Name: turno; Type: TABLE DATA; Schema: configuracion; Owner: postgres
--



--
-- TOC entry 4526 (class 0 OID 16553)
-- Dependencies: 230
-- Data for Name: usuario; Type: TABLE DATA; Schema: configuracion; Owner: postgres
--

INSERT INTO configuracion.usuario VALUES ('81a6dd82-73f6-46d3-b7dd-36340cb36908', 'admin', '$2a$06$V0D50.Ib1PoFlzYtWpZnJ.Vuk/ZAwADfYFgdVSQL3rPdgt6sK5nPK', 'Administrador Principal', '4322850d-48bf-4ecc-8295-9f806893b39b', true, '2026-07-01 23:41:20.114518');


--
-- TOC entry 4555 (class 0 OID 17022)
-- Dependencies: 259
-- Data for Name: informe; Type: TABLE DATA; Schema: informes; Owner: postgres
--



--
-- TOC entry 4529 (class 0 OID 16594)
-- Dependencies: 233
-- Data for Name: categoria; Type: TABLE DATA; Schema: inventario; Owner: postgres
--

INSERT INTO inventario.categoria VALUES ('186fb6da-883e-43ff-b9ab-087f4b3df3d5', 'Alimentos', 'Productos alimenticios', NULL);
INSERT INTO inventario.categoria VALUES ('4538d6a9-f33c-41d0-a2f1-a5bff250cc3d', 'Bebidas', 'Bebidas y refrescos', NULL);
INSERT INTO inventario.categoria VALUES ('d7c21607-2015-42e4-8152-80eac15dd15f', 'Lácteos', 'Productos lácteos', NULL);
INSERT INTO inventario.categoria VALUES ('6774ac42-cbe9-4a81-a8e2-922444cf2f4a', 'Limpieza', 'Artículos de limpieza', NULL);


--
-- TOC entry 4533 (class 0 OID 16649)
-- Dependencies: 237
-- Data for Name: kit_componente; Type: TABLE DATA; Schema: inventario; Owner: postgres
--



--
-- TOC entry 4532 (class 0 OID 16637)
-- Dependencies: 236
-- Data for Name: kit_producto; Type: TABLE DATA; Schema: inventario; Owner: postgres
--



--
-- TOC entry 4536 (class 0 OID 16706)
-- Dependencies: 240
-- Data for Name: lote; Type: TABLE DATA; Schema: inventario; Owner: postgres
--



--
-- TOC entry 4535 (class 0 OID 16687)
-- Dependencies: 239
-- Data for Name: movimiento_inventario; Type: TABLE DATA; Schema: inventario; Owner: postgres
--



--
-- TOC entry 4530 (class 0 OID 16607)
-- Dependencies: 234
-- Data for Name: producto; Type: TABLE DATA; Schema: inventario; Owner: postgres
--



--
-- TOC entry 4534 (class 0 OID 16665)
-- Dependencies: 238
-- Data for Name: stock; Type: TABLE DATA; Schema: inventario; Owner: postgres
--



--
-- TOC entry 4531 (class 0 OID 16626)
-- Dependencies: 235
-- Data for Name: variante_producto; Type: TABLE DATA; Schema: inventario; Owner: postgres
--



--
-- TOC entry 4554 (class 0 OID 17007)
-- Dependencies: 258
-- Data for Name: devolucion; Type: TABLE DATA; Schema: ventas; Owner: postgres
--



--
-- TOC entry 4551 (class 0 OID 16954)
-- Dependencies: 255
-- Data for Name: linea_venta; Type: TABLE DATA; Schema: ventas; Owner: postgres
--



--
-- TOC entry 4552 (class 0 OID 16974)
-- Dependencies: 256
-- Data for Name: pago; Type: TABLE DATA; Schema: ventas; Owner: postgres
--



--
-- TOC entry 4553 (class 0 OID 16992)
-- Dependencies: 257
-- Data for Name: recibo; Type: TABLE DATA; Schema: ventas; Owner: postgres
--



--
-- TOC entry 4550 (class 0 OID 16928)
-- Dependencies: 254
-- Data for Name: venta; Type: TABLE DATA; Schema: ventas; Owner: postgres
--



--
-- TOC entry 4304 (class 2606 OID 16784)
-- Name: cuenta_bancaria cuenta_bancaria_numero_key; Type: CONSTRAINT; Schema: bancos; Owner: postgres
--

ALTER TABLE ONLY bancos.cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_numero_key UNIQUE (numero);


--
-- TOC entry 4306 (class 2606 OID 16782)
-- Name: cuenta_bancaria cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: bancos; Owner: postgres
--

ALTER TABLE ONLY bancos.cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_pkey PRIMARY KEY (id);


--
-- TOC entry 4308 (class 2606 OID 16798)
-- Name: movimiento_bancario movimiento_bancario_pkey; Type: CONSTRAINT; Schema: bancos; Owner: postgres
--

ALTER TABLE ONLY bancos.movimiento_bancario
    ADD CONSTRAINT movimiento_bancario_pkey PRIMARY KEY (id);


--
-- TOC entry 4310 (class 2606 OID 16811)
-- Name: caja_principal caja_principal_pkey; Type: CONSTRAINT; Schema: caja; Owner: postgres
--

ALTER TABLE ONLY caja.caja_principal
    ADD CONSTRAINT caja_principal_pkey PRIMARY KEY (id);


--
-- TOC entry 4314 (class 2606 OID 16863)
-- Name: cierre_caja cierre_caja_pkey; Type: CONSTRAINT; Schema: caja; Owner: postgres
--

ALTER TABLE ONLY caja.cierre_caja
    ADD CONSTRAINT cierre_caja_pkey PRIMARY KEY (id);


--
-- TOC entry 4312 (class 2606 OID 16835)
-- Name: movimiento_caja movimiento_caja_pkey; Type: CONSTRAINT; Schema: caja; Owner: postgres
--

ALTER TABLE ONLY caja.movimiento_caja
    ADD CONSTRAINT movimiento_caja_pkey PRIMARY KEY (id);


--
-- TOC entry 4290 (class 2606 OID 16728)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 4296 (class 2606 OID 16753)
-- Name: cuenta_credito cuenta_credito_id_cliente_key; Type: CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.cuenta_credito
    ADD CONSTRAINT cuenta_credito_id_cliente_key UNIQUE (id_cliente);


--
-- TOC entry 4298 (class 2606 OID 16751)
-- Name: cuenta_credito cuenta_credito_pkey; Type: CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.cuenta_credito
    ADD CONSTRAINT cuenta_credito_pkey PRIMARY KEY (id);


--
-- TOC entry 4292 (class 2606 OID 16739)
-- Name: cuenta_fidelidad cuenta_fidelidad_id_cliente_key; Type: CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.cuenta_fidelidad
    ADD CONSTRAINT cuenta_fidelidad_id_cliente_key UNIQUE (id_cliente);


--
-- TOC entry 4294 (class 2606 OID 16737)
-- Name: cuenta_fidelidad cuenta_fidelidad_pkey; Type: CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.cuenta_fidelidad
    ADD CONSTRAINT cuenta_fidelidad_pkey PRIMARY KEY (id);


--
-- TOC entry 4300 (class 2606 OID 16768)
-- Name: tarjeta_regalo tarjeta_regalo_numero_key; Type: CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.tarjeta_regalo
    ADD CONSTRAINT tarjeta_regalo_numero_key UNIQUE (numero);


--
-- TOC entry 4302 (class 2606 OID 16766)
-- Name: tarjeta_regalo tarjeta_regalo_pkey; Type: CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.tarjeta_regalo
    ADD CONSTRAINT tarjeta_regalo_pkey PRIMARY KEY (id);


--
-- TOC entry 4318 (class 2606 OID 16885)
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY compras.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id);


--
-- TOC entry 4322 (class 2606 OID 16922)
-- Name: cuenta_por_pagar cuenta_por_pagar_pkey; Type: CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY compras.cuenta_por_pagar
    ADD CONSTRAINT cuenta_por_pagar_pkey PRIMARY KEY (id);


--
-- TOC entry 4320 (class 2606 OID 16904)
-- Name: linea_compra linea_compra_pkey; Type: CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY compras.linea_compra
    ADD CONSTRAINT linea_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 4316 (class 2606 OID 16876)
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY compras.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id);


--
-- TOC entry 4266 (class 2606 OID 16588)
-- Name: asistencia asistencia_pkey; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.asistencia
    ADD CONSTRAINT asistencia_pkey PRIMARY KEY (id);


--
-- TOC entry 4252 (class 2606 OID 16534)
-- Name: configuracion_global configuracion_global_pkey; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.configuracion_global
    ADD CONSTRAINT configuracion_global_pkey PRIMARY KEY (id);


--
-- TOC entry 4254 (class 2606 OID 16542)
-- Name: rol rol_nombre_key; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.rol
    ADD CONSTRAINT rol_nombre_key UNIQUE (nombre);


--
-- TOC entry 4258 (class 2606 OID 16547)
-- Name: rol_permiso rol_permiso_pkey; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.rol_permiso
    ADD CONSTRAINT rol_permiso_pkey PRIMARY KEY (id_rol, permiso);


--
-- TOC entry 4256 (class 2606 OID 16540)
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);


--
-- TOC entry 4248 (class 2606 OID 16521)
-- Name: sucursal sucursal_codigo_key; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.sucursal
    ADD CONSTRAINT sucursal_codigo_key UNIQUE (codigo);


--
-- TOC entry 4250 (class 2606 OID 16519)
-- Name: sucursal sucursal_pkey; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id);


--
-- TOC entry 4264 (class 2606 OID 16575)
-- Name: turno turno_pkey; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (id);


--
-- TOC entry 4260 (class 2606 OID 16564)
-- Name: usuario usuario_nombre_usuario_key; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.usuario
    ADD CONSTRAINT usuario_nombre_usuario_key UNIQUE (nombre_usuario);


--
-- TOC entry 4262 (class 2606 OID 16562)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 4334 (class 2606 OID 17030)
-- Name: informe informe_pkey; Type: CONSTRAINT; Schema: informes; Owner: postgres
--

ALTER TABLE ONLY informes.informe
    ADD CONSTRAINT informe_pkey PRIMARY KEY (id);


--
-- TOC entry 4268 (class 2606 OID 16601)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 4278 (class 2606 OID 16654)
-- Name: kit_componente kit_componente_pkey; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.kit_componente
    ADD CONSTRAINT kit_componente_pkey PRIMARY KEY (id_kit, id_producto);


--
-- TOC entry 4276 (class 2606 OID 16643)
-- Name: kit_producto kit_producto_pkey; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.kit_producto
    ADD CONSTRAINT kit_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4286 (class 2606 OID 16714)
-- Name: lote lote_id_producto_numero_lote_key; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.lote
    ADD CONSTRAINT lote_id_producto_numero_lote_key UNIQUE (id_producto, numero_lote);


--
-- TOC entry 4288 (class 2606 OID 16712)
-- Name: lote lote_pkey; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.lote
    ADD CONSTRAINT lote_pkey PRIMARY KEY (id);


--
-- TOC entry 4284 (class 2606 OID 16695)
-- Name: movimiento_inventario movimiento_inventario_pkey; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.movimiento_inventario
    ADD CONSTRAINT movimiento_inventario_pkey PRIMARY KEY (id);


--
-- TOC entry 4270 (class 2606 OID 16618)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4272 (class 2606 OID 16620)
-- Name: producto producto_sku_key; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.producto
    ADD CONSTRAINT producto_sku_key UNIQUE (sku);


--
-- TOC entry 4280 (class 2606 OID 16676)
-- Name: stock stock_id_producto_id_sucursal_key; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.stock
    ADD CONSTRAINT stock_id_producto_id_sucursal_key UNIQUE (id_producto, id_sucursal);


--
-- TOC entry 4282 (class 2606 OID 16674)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id);


--
-- TOC entry 4274 (class 2606 OID 16631)
-- Name: variante_producto variante_producto_pkey; Type: CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.variante_producto
    ADD CONSTRAINT variante_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 4332 (class 2606 OID 17016)
-- Name: devolucion devolucion_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.devolucion
    ADD CONSTRAINT devolucion_pkey PRIMARY KEY (id);


--
-- TOC entry 4326 (class 2606 OID 16963)
-- Name: linea_venta linea_venta_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.linea_venta
    ADD CONSTRAINT linea_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 4328 (class 2606 OID 16981)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id);


--
-- TOC entry 4330 (class 2606 OID 17001)
-- Name: recibo recibo_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.recibo
    ADD CONSTRAINT recibo_pkey PRIMARY KEY (id);


--
-- TOC entry 4324 (class 2606 OID 16938)
-- Name: venta venta_pkey; Type: CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id);


--
-- TOC entry 4354 (class 2606 OID 16785)
-- Name: cuenta_bancaria cuenta_bancaria_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: bancos; Owner: postgres
--

ALTER TABLE ONLY bancos.cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES configuracion.sucursal(id);


--
-- TOC entry 4355 (class 2606 OID 16799)
-- Name: movimiento_bancario movimiento_bancario_id_cuenta_bancaria_fkey; Type: FK CONSTRAINT; Schema: bancos; Owner: postgres
--

ALTER TABLE ONLY bancos.movimiento_bancario
    ADD CONSTRAINT movimiento_bancario_id_cuenta_bancaria_fkey FOREIGN KEY (id_cuenta_bancaria) REFERENCES bancos.cuenta_bancaria(id);


--
-- TOC entry 4356 (class 2606 OID 16817)
-- Name: caja_principal caja_principal_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: caja; Owner: postgres
--

ALTER TABLE ONLY caja.caja_principal
    ADD CONSTRAINT caja_principal_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES configuracion.sucursal(id);


--
-- TOC entry 4357 (class 2606 OID 16812)
-- Name: caja_principal caja_principal_id_usuario_responsable_fkey; Type: FK CONSTRAINT; Schema: caja; Owner: postgres
--

ALTER TABLE ONLY caja.caja_principal
    ADD CONSTRAINT caja_principal_id_usuario_responsable_fkey FOREIGN KEY (id_usuario_responsable) REFERENCES configuracion.usuario(id);


--
-- TOC entry 4361 (class 2606 OID 16864)
-- Name: cierre_caja cierre_caja_id_caja_fkey; Type: FK CONSTRAINT; Schema: caja; Owner: postgres
--

ALTER TABLE ONLY caja.cierre_caja
    ADD CONSTRAINT cierre_caja_id_caja_fkey FOREIGN KEY (id_caja) REFERENCES caja.caja_principal(id);


--
-- TOC entry 4358 (class 2606 OID 16836)
-- Name: movimiento_caja movimiento_caja_id_caja_fkey; Type: FK CONSTRAINT; Schema: caja; Owner: postgres
--

ALTER TABLE ONLY caja.movimiento_caja
    ADD CONSTRAINT movimiento_caja_id_caja_fkey FOREIGN KEY (id_caja) REFERENCES caja.caja_principal(id);


--
-- TOC entry 4359 (class 2606 OID 16846)
-- Name: movimiento_caja movimiento_caja_id_cuenta_bancaria_fkey; Type: FK CONSTRAINT; Schema: caja; Owner: postgres
--

ALTER TABLE ONLY caja.movimiento_caja
    ADD CONSTRAINT movimiento_caja_id_cuenta_bancaria_fkey FOREIGN KEY (id_cuenta_bancaria) REFERENCES bancos.cuenta_bancaria(id);


--
-- TOC entry 4360 (class 2606 OID 16841)
-- Name: movimiento_caja movimiento_caja_id_usuario_fkey; Type: FK CONSTRAINT; Schema: caja; Owner: postgres
--

ALTER TABLE ONLY caja.movimiento_caja
    ADD CONSTRAINT movimiento_caja_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES configuracion.usuario(id);


--
-- TOC entry 4352 (class 2606 OID 16754)
-- Name: cuenta_credito cuenta_credito_id_cliente_fkey; Type: FK CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.cuenta_credito
    ADD CONSTRAINT cuenta_credito_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES clientes.cliente(id) ON DELETE CASCADE;


--
-- TOC entry 4351 (class 2606 OID 16740)
-- Name: cuenta_fidelidad cuenta_fidelidad_id_cliente_fkey; Type: FK CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.cuenta_fidelidad
    ADD CONSTRAINT cuenta_fidelidad_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES clientes.cliente(id) ON DELETE CASCADE;


--
-- TOC entry 4353 (class 2606 OID 16769)
-- Name: tarjeta_regalo tarjeta_regalo_id_cliente_fkey; Type: FK CONSTRAINT; Schema: clientes; Owner: postgres
--

ALTER TABLE ONLY clientes.tarjeta_regalo
    ADD CONSTRAINT tarjeta_regalo_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES clientes.cliente(id);


--
-- TOC entry 4362 (class 2606 OID 16886)
-- Name: compra compra_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY compras.compra
    ADD CONSTRAINT compra_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES compras.proveedor(id);


--
-- TOC entry 4363 (class 2606 OID 16891)
-- Name: compra compra_id_usuario_fkey; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY compras.compra
    ADD CONSTRAINT compra_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES configuracion.usuario(id);


--
-- TOC entry 4366 (class 2606 OID 16923)
-- Name: cuenta_por_pagar cuenta_por_pagar_id_compra_fkey; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY compras.cuenta_por_pagar
    ADD CONSTRAINT cuenta_por_pagar_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES compras.compra(id);


--
-- TOC entry 4364 (class 2606 OID 16905)
-- Name: linea_compra linea_compra_id_compra_fkey; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY compras.linea_compra
    ADD CONSTRAINT linea_compra_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES compras.compra(id) ON DELETE CASCADE;


--
-- TOC entry 4365 (class 2606 OID 16910)
-- Name: linea_compra linea_compra_id_producto_fkey; Type: FK CONSTRAINT; Schema: compras; Owner: postgres
--

ALTER TABLE ONLY compras.linea_compra
    ADD CONSTRAINT linea_compra_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES inventario.producto(id);


--
-- TOC entry 4339 (class 2606 OID 16589)
-- Name: asistencia asistencia_id_usuario_fkey; Type: FK CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.asistencia
    ADD CONSTRAINT asistencia_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES configuracion.usuario(id);


--
-- TOC entry 4337 (class 2606 OID 16822)
-- Name: turno fk_turno_caja; Type: FK CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.turno
    ADD CONSTRAINT fk_turno_caja FOREIGN KEY (id_caja) REFERENCES caja.caja_principal(id);


--
-- TOC entry 4335 (class 2606 OID 16548)
-- Name: rol_permiso rol_permiso_id_rol_fkey; Type: FK CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.rol_permiso
    ADD CONSTRAINT rol_permiso_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES configuracion.rol(id) ON DELETE CASCADE;


--
-- TOC entry 4338 (class 2606 OID 16576)
-- Name: turno turno_id_usuario_fkey; Type: FK CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.turno
    ADD CONSTRAINT turno_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES configuracion.usuario(id);


--
-- TOC entry 4336 (class 2606 OID 16565)
-- Name: usuario usuario_id_rol_fkey; Type: FK CONSTRAINT; Schema: configuracion; Owner: postgres
--

ALTER TABLE ONLY configuracion.usuario
    ADD CONSTRAINT usuario_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES configuracion.rol(id);


--
-- TOC entry 4376 (class 2606 OID 17031)
-- Name: informe informe_id_usuario_fkey; Type: FK CONSTRAINT; Schema: informes; Owner: postgres
--

ALTER TABLE ONLY informes.informe
    ADD CONSTRAINT informe_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES configuracion.usuario(id);


--
-- TOC entry 4340 (class 2606 OID 16602)
-- Name: categoria categoria_id_categoria_padre_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.categoria
    ADD CONSTRAINT categoria_id_categoria_padre_fkey FOREIGN KEY (id_categoria_padre) REFERENCES inventario.categoria(id);


--
-- TOC entry 4344 (class 2606 OID 16655)
-- Name: kit_componente kit_componente_id_kit_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.kit_componente
    ADD CONSTRAINT kit_componente_id_kit_fkey FOREIGN KEY (id_kit) REFERENCES inventario.kit_producto(id) ON DELETE CASCADE;


--
-- TOC entry 4345 (class 2606 OID 16660)
-- Name: kit_componente kit_componente_id_producto_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.kit_componente
    ADD CONSTRAINT kit_componente_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES inventario.producto(id);


--
-- TOC entry 4343 (class 2606 OID 16644)
-- Name: kit_producto kit_producto_id_producto_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.kit_producto
    ADD CONSTRAINT kit_producto_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES inventario.producto(id) ON DELETE CASCADE;


--
-- TOC entry 4350 (class 2606 OID 16715)
-- Name: lote lote_id_producto_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.lote
    ADD CONSTRAINT lote_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES inventario.producto(id);


--
-- TOC entry 4348 (class 2606 OID 16696)
-- Name: movimiento_inventario movimiento_inventario_id_stock_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.movimiento_inventario
    ADD CONSTRAINT movimiento_inventario_id_stock_fkey FOREIGN KEY (id_stock) REFERENCES inventario.stock(id);


--
-- TOC entry 4349 (class 2606 OID 16701)
-- Name: movimiento_inventario movimiento_inventario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.movimiento_inventario
    ADD CONSTRAINT movimiento_inventario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES configuracion.usuario(id);


--
-- TOC entry 4341 (class 2606 OID 16621)
-- Name: producto producto_id_categoria_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.producto
    ADD CONSTRAINT producto_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES inventario.categoria(id);


--
-- TOC entry 4346 (class 2606 OID 16677)
-- Name: stock stock_id_producto_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.stock
    ADD CONSTRAINT stock_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES inventario.producto(id) ON DELETE CASCADE;


--
-- TOC entry 4347 (class 2606 OID 16682)
-- Name: stock stock_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.stock
    ADD CONSTRAINT stock_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES configuracion.sucursal(id);


--
-- TOC entry 4342 (class 2606 OID 16632)
-- Name: variante_producto variante_producto_id_producto_padre_fkey; Type: FK CONSTRAINT; Schema: inventario; Owner: postgres
--

ALTER TABLE ONLY inventario.variante_producto
    ADD CONSTRAINT variante_producto_id_producto_padre_fkey FOREIGN KEY (id_producto_padre) REFERENCES inventario.producto(id) ON DELETE CASCADE;


--
-- TOC entry 4375 (class 2606 OID 17017)
-- Name: devolucion devolucion_id_venta_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.devolucion
    ADD CONSTRAINT devolucion_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES ventas.venta(id);


--
-- TOC entry 4370 (class 2606 OID 16969)
-- Name: linea_venta linea_venta_id_producto_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.linea_venta
    ADD CONSTRAINT linea_venta_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES inventario.producto(id);


--
-- TOC entry 4371 (class 2606 OID 16964)
-- Name: linea_venta linea_venta_id_venta_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.linea_venta
    ADD CONSTRAINT linea_venta_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES ventas.venta(id) ON DELETE CASCADE;


--
-- TOC entry 4372 (class 2606 OID 16987)
-- Name: pago pago_id_cuenta_bancaria_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pago
    ADD CONSTRAINT pago_id_cuenta_bancaria_fkey FOREIGN KEY (id_cuenta_bancaria) REFERENCES bancos.cuenta_bancaria(id);


--
-- TOC entry 4373 (class 2606 OID 16982)
-- Name: pago pago_id_venta_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.pago
    ADD CONSTRAINT pago_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES ventas.venta(id);


--
-- TOC entry 4374 (class 2606 OID 17002)
-- Name: recibo recibo_id_venta_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.recibo
    ADD CONSTRAINT recibo_id_venta_fkey FOREIGN KEY (id_venta) REFERENCES ventas.venta(id);


--
-- TOC entry 4367 (class 2606 OID 16939)
-- Name: venta venta_id_cliente_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.venta
    ADD CONSTRAINT venta_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES clientes.cliente(id);


--
-- TOC entry 4368 (class 2606 OID 16949)
-- Name: venta venta_id_sucursal_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.venta
    ADD CONSTRAINT venta_id_sucursal_fkey FOREIGN KEY (id_sucursal) REFERENCES configuracion.sucursal(id);


--
-- TOC entry 4369 (class 2606 OID 16944)
-- Name: venta venta_id_usuario_fkey; Type: FK CONSTRAINT; Schema: ventas; Owner: postgres
--

ALTER TABLE ONLY ventas.venta
    ADD CONSTRAINT venta_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES configuracion.usuario(id);


-- Completed on 2026-08-14 18:28:39 -05

--
-- PostgreSQL database dump complete
--

\unrestrict J3vY0pXn3maYZoGH7efVKnnXgVdcw8bxQDfucgKSzhwnrLIEsjds4UW4eV3ct4H

