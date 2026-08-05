package com.pos.application.inventario.casosdeuso;

import main.java.com.pos.domain.servicios.ServicioInventario;
import main.java.com.pos.domain.inventario.entidades.Producto;
import main.java.com.pos.domain.inventario.repositorios.RepositorioProductos;

public class VerificarReordenCasoUso {

    private ServicioInventario servicioInventario;
    private RepositorioProductos repositorioProductos;

    public VerificarReordenCasoUso(ServicioInventario servicioInventario, RepositorioProductos repositorioProductos) {
        this.servicioInventario = servicioInventario;
        this.repositorioProductos = repositorioProductos;
    }

    public boolean ejecutar(String sku) {
        Producto producto = repositorioProductos.buscarPorSku(sku);
        if (producto == null) {
            throw new IllegalArgumentException("Producto no encontrado: " + sku);
        }
        return servicioInventario.verificarPuntoReorden(producto);
    }
}