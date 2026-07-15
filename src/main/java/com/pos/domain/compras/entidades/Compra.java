// package main.java.com.pos.domain.compras.entidades;
package main.java.com.pos.domain.compras.entidades;


import main.java.com.pos.ventas.valueobjects;

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