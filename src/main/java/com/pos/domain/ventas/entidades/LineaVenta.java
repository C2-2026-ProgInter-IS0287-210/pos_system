package main.java.com.pos.domain.ventas.entidades;

import main.java.com.pos.domain.ventas.valueobjects.Descuento;
import main.java.com.pos.domain.ventas.valueobjects.Money;

public class LineaVenta {

  private int cantidad;
  private Money precioUnitario;
  private Money descuento;

  public LineaVenta(
      int cantidad,
      Money precioUnitario) {

    if (cantidad <= 0) {

      throw new IllegalArgumentException(
          "La cantidad debe ser mayor que cero.");
    }

    if (precioUnitario == null) {

      throw new IllegalArgumentException(
          "El precio unitario no puede ser nulo.");
    }

    this.cantidad = cantidad;
    this.precioUnitario = precioUnitario;
    this.descuento = new Money(0);
  }

  public void modificarCantidad(int nuevaCantidad) {

    if (nuevaCantidad <= 0) {

      throw new IllegalArgumentException(
          "La nueva cantidad debe ser mayor que cero.");
    }

    this.cantidad = nuevaCantidad;

  }

  public void aplicarDescuento(Descuento desc) {
    if (desc == null) {

      throw new IllegalArgumentException(
          "El descuento no puede ser nulo.");
    }

    Money valorSinDescuento = precioUnitario.multiplicar(cantidad);

    this.descuento = desc.aplicar(valorSinDescuento);
  }

  public Money calcularSubtotal() {
    Money valorSinDescuento = precioUnitario.multiplicar(cantidad);

    return valorSinDescuento.restar(descuento);
  }

}
