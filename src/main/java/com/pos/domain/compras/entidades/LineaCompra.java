package com.pos.domain.compras.entidades;
import java.util.concurrent.atomic.DoubleAccumulator;
import com.pos.domain.ventas.valueobjets.*;

public class LineaCompra{
    private int cantidad;
    private Money precioUnitario;
    private Money descuento;
    private Double subtotal;

    public Money calcularSubtotal(){
        subtotal = (cantidad* precioUnitario.getValor())- descuento.getValor();
        return new Money(subtotal);
    }
}
