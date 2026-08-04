package com.pos.application.inventario.casosdeuso;

import main.java.com.pos.domain.servicios.ServicioInventario;
import main.java.com.pos.domain.inventario.entidades.Producto;
import main.java.com.pos.domain.inventario.enumerados.TipoMovimiento;
import main.java.com.pos.domain.inventario.repositorios.RepositorioProductos;

public class RealizarMovimientoCasoUso {

    private ServicioInventario servicioInventario;
    private RepositorioProductos repositorioProductos;

    public RealizarMovimientoCasoUso(ServicioInventario servicioInventario, RepositorioProductos repositorioProductos) {
        this.servicioInventario = servicioInventario;
        this.repositorioProductos = repositorioProductos;
    }

    public void ejecutar(String sku, int cantidad, TipoMovimiento tipo, String motivo) {
        Producto producto = repositorioProductos.buscarPorSku(sku);
        if (producto == null) {
            throw new IllegalArgumentException("Producto no encontrado: " + sku);
        }
        servicioInventario.realizarMovimiento(producto, cantidad, tipo, motivo);
    }
}