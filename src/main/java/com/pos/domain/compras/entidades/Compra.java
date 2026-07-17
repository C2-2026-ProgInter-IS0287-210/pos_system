// package main.java.com.pos.domain.compras.entidades;
package com.pos.domain.compras.entidades;

import java.util.Date;
import com.pos.domain.compras.enumerados.EstadoCompra;
import com.pos.domain.ventas.valueobjets.*;
import com.pos.domain.compras.enumerados.LineaCompra;

public class Compra {
    private String id;
    private Date fecha;
    private Money total;
    private EstadoCompra estado;

    public void recibirMercancia() {
        // metodo a crear
    }

    public void anular() {
        // metodo a crear
    }

    public Money calcularTotal() {
        this.total = subtotal - descuento;
        return total;
    }
}