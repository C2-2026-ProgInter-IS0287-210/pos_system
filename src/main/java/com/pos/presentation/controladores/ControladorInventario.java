package com.pos.presentation.controladores;

import main.java.com.pos.domain.servicios.ServicioInventario;
import main.java.com.pos.domain.inventario.entidades.Producto;
import main.java.com.pos.domain.inventario.entidades.Stock;
import main.java.com.pos.domain.inventario.enumerados.TipoMovimiento;
import main.java.com.pos.domain.configuracion.entidades.Sucursal;

public class ControladorInventario {

    private ServicioInventario servicio;

    public ControladorInventario(ServicioInventario servicio) {
        this.servicio = servicio;
    }

    public int consultarStock(Producto p) {
        Stock stock = servicio.consultarStock(p);
        return stock.getCantidadActual();
    }

    public void realizarEntrada(Producto p, int cantidad, String motivo) {
        servicio.realizarMovimiento(p, cantidad, TipoMovimiento.ENTRADA, motivo);
    }

    public void realizarSalida(Producto p, int cantidad, String motivo) {
        servicio.realizarMovimiento(p, cantidad, TipoMovimiento.SALIDA, motivo);
    }

    public void trasladarStock(Producto p, int cantidad, Sucursal origen, Sucursal destino) {
        String motivo = "Traslado de " + origen.getNombre() + " a " + destino.getNombre();
        servicio.realizarMovimiento(p, cantidad, TipoMovimiento.TRASLADO, motivo);
    }
}