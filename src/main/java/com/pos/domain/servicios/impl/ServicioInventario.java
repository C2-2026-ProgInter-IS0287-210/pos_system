package com.pos.domain.servicios;

public interface ServicioInventario {
    Stock consultarStock(Producto p);
    void realizarMovimiento(Producto p, int cantidad, TipoMovimiento tipo, String motivo);
    boolean verificarPuntoReorden(Producto p);
    List<Lote> obtenerLotes(Producto p);
}