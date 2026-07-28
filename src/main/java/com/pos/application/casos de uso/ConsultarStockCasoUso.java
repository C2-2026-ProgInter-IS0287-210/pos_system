package main.java.com.pos.application.inventario.casosdeuso;

import main.java.com.pos.application.inventario.dtos.StockDTO;
import main.java.com.pos.domain.servicios.ServicioInventario;
import main.java.com.pos.domain.inventario.entidades.Producto;
import main.java.com.pos.domain.inventario.entidades.Stock;
import main.java.com.pos.domain.inventario.repositorios.RepositorioProductos;

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