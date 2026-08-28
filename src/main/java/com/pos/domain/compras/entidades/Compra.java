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
    private Proveedor proveedor;
    private List<LineaCompra> lineas;
    private CuentaPorPagar cuentaPorPagar;

    public Compra(String id, LocalDate fecha, Proveedor proveedor) {

    this.id = id;
    this.fecha = fecha;
    this.proveedor = proveedor;
    this.lineas = new ArrayList<>();
    this.total = new Money(0);
    this.estado = EstadoCompra.PENDIENTE;
    }

    public void recibirMercancia() {
        if (estado != EstadoCompra.PENDIENTE) {
            return;
        }
        calcularTotal();
        estado = EstadoCompra.RECIBIDA;
        cuentaPorPagar = new CuentaPorPagar(total, fecha, fecha.plusDays(30));
    }

    public void anular() {
        if (estado == EstadoCompra.PENDIENTE) {
            estado = EstadoCompra.ANULADA;
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