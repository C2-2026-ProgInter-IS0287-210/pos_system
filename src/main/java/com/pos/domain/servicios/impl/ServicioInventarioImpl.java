package com.pos.domain.servicios.impl;

import com.pos.domain.servicios.ServicioInventario;
import com.pos.domain.inventario.entidades.Producto;
import com.pos.domain.inventario.entidades.Stock;
import com.pos.domain.inventario.entidades.Lote;
import com.pos.domain.inventario.entidades.MovimientoInventario;
import com.pos.domain.inventario.enumerados.TipoMovimiento;
import com.pos.domain.inventario.repositorios.RepositorioProductos;

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

   
}