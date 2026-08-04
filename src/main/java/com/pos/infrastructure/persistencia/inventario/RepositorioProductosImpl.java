package com.pos.infrastructure.persistencia.inventario;

import main.java.com.pos.domain.inventario.repositorios.RepositorioProductos;
import main.java.com.pos.domain.inventario.entidades.Producto;
import main.java.com.pos.domain.inventario.entidades.Categoria;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

public class RepositorioProductosImpl implements RepositorioProductos {

    private Map<String, Producto> productos;

    public RepositorioProductosImpl() {
        this.productos = new HashMap<>();
    }

    @Override
    public void guardar(Producto p) {
        productos.put(p.getSku(), p);
    }

    @Override
    public Producto buscarPorSku(String sku) {
        return productos.get(sku);
    }

    @Override
    public List<Producto> buscarPorCategoria(Categoria cat) {
        List<Producto> resultado = new ArrayList<>();
        for (Producto p : productos.values()) {
            if (p.getCategoria() != null && p.getCategoria().equals(cat)) {
                resultado.add(p);
            }
        }
        return resultado;
    }

    @Override
    public List<Producto> listarTodos() {
        return new ArrayList<>(productos.values());
    }
}