package main.java.com.pos.domain.servicios.impl;

import main.java.com.pos.domain.servicios.ServicioInventario;
import main.java.com.pos.domain.inventario.entidades.Producto;
import main.java.com.pos.domain.inventario.entidades.Stock;
import main.java.com.pos.domain.inventario.entidades.Lote;
import main.java.com.pos.domain.inventario.entidades.MovimientoInventario;
import main.java.com.pos.domain.inventario.enumerados.TipoMovimiento;
import main.java.com.pos.domain.inventario.repositorios.RepositorioProductos;

import java.util.List;

public class ServicioInventarioImpl implements ServicioInventario {

    private RepositorioProductos repositorioProductos;

    public ServicioInventarioImpl(RepositorioProductos repositorioProductos) {
        this.repositorioProductos = repositorioProductos;
    }

    @Override
    public Stock consultarStock(Producto p) {
        return p.getStock();
    }

    @Override
    public void realizarMovimiento(Producto p, int cantidad, TipoMovimiento tipo, String motivo) {
        MovimientoInventario movimiento = new MovimientoInventario(tipo, cantidad, motivo, p.getStock());
        movimiento.registrar();
    }

    @Override
    public boolean verificarPuntoReorden(Producto p) {
        return p.getStock().verificarPuntoReorden();
    }

    @Override
    public List<Lote> obtenerLotes(Producto p) {
        return p.getLotes();
    }
}