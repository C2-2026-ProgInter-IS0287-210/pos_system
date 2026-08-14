package com.pos.domain.inventario.entidades.casosdeuso;

import com.pos.domain.inventario.entidades.casosdeuso.dtos.StockDTO;
import com.pos.domain.servicios.ServicioInventario;
import com.pos.domain.inventario.entidades.Producto;
import com.pos.domain.inventario.entidades.Stock;
import com.pos.domain.inventario.repositorios.RepositorioProductos;

public class ConsultarStockCasoUso {

    private ServicioInventario servicioInventario;
    private RepositorioProductos repositorioProductos;

    public ConsultarStockCasoUso(ServicioInventario servicioInventario, RepositorioProductos repositorioProductos) {
        this.servicioInventario = servicioInventario;
        this.repositorioProductos = repositorioProductos;
    }

    public StockDTO ejecutar(String sku) {
        Producto producto = repositorioProductos.buscarPorSku(sku);
        if (producto == null) {
            throw new IllegalArgumentException("Producto no encontrado: " + sku);
        }
        Stock stock = servicioInventario.consultarStock(producto);
        return new StockDTO(sku, stock.getCantidadActual(), stock.getNivelMinimo(),
                stock.getNivelMaximo(), stock.getUbicacion());
    }
}