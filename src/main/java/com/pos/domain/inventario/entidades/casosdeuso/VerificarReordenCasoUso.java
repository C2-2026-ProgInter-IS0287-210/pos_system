package com.pos.domain.inventario.entidades.casosdeuso;

import com.pos.domain.servicios.ServicioInventario;
import com.pos.domain.inventario.entidades.Producto;
import com.pos.domain.inventario.repositorios.RepositorioProductos;

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