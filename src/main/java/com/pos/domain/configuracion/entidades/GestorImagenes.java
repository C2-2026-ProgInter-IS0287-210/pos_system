package com.pos.domain.configuracion.entidades;

import util.HashMap;
import util.Map;

public class GestorImagenes {
    private Map<String, String> cache = new HashMap<>();

    public void subirImagen(String idProducto, String rutaImagen) {
        cache.put(idProducto, rutaImagen);
    }

    public void eliminarImagen(String idProducto) {
        cache.remove(idProducto);
    }

    public String obtenerImagen(String idProducto) {
        return cache.get(idProducto);
    }
}