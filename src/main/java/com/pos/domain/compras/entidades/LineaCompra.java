package com.pos.domain.compras.entidades;
import java.util.concurrent.atomic.DoubleAccumulator;
import com.pos.domain.ventas.valueobjets.*;

public class LineaCompra{
    private int cantidad;
    private Money precioUnitario;
    private Money descuento;
    private Double subtotal;

    public Money calcularSubtotal() {
        Money subtotal = precioUnitario.multiplicar(cantidad);
        subtotal = subtotal.restar(descuento);
        return subtotal;
    }
}
