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
        if (estado == EstadoCompra.PENDIENTE) {
            estado = EstadoCompra.RECIBIDA;
            System.out.println("Estado de mercancia: Recibido");
        } else {
            System.out.println("Error de recepción");
        }
    }

    public void anular() {
       if (estado != EstadoCompra.RECIBIDA) {
        estado = EstadoCompra.ANULADA;
        System.out.println("Compra anulada.")
       } else {
        System.out.println("Compra no puede ser anulada")
       }
    }

    public Money calcularTotal() {
        Money suma = new Money(0);
        for (LineaCompra linea : lineas) {
            suma = suma.add(linea.calcularSubtotal());
        }

        total =suma;
        return total;
    }
}