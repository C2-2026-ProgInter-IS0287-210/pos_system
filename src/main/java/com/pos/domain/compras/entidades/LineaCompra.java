package com.pos.domain.compras.entidades;
import com.pos.domain.ventas.valueobjets.*;
import 

public class LineaCompra{
    private int cantidad;
    private Money precioUnitario;
    private Money descuento;
    private Money subtotal;

    public Money calcularSubtotal(){
       this.subtotal = subtotal;
        return subtotal;
    }
}