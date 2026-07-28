package main.java.com.pos.domain.ventas.entidades;

import main.java.com.pos.domain.ventas.enumeradores.MetodoPago;
import main.java.com.pos.domain.ventas.valueobjects.Money;

public class Pago {

  private MetodoPago metodo;
  private Money monto;
  private Money cambio;

  public Pago(MetodoPago metodo, Money monto) {

    if (metodo == null) {

      throw new IllegalArgumentException(
          "El método de pago no puede ser nulo.");
    }

    if (monto == null) {

      throw new IllegalArgumentException(
          "El monto no puede ser nulo.");
    }

    this.metodo = metodo;
    this.monto = monto;
    this.cambio = new Money(0);
  }

  boolean t;// Variable temporal

  public boolean procesar() {// En proceso de implementacion / Sin logica

    return t;

  }

  public boolean validar() {// En proceso de implementacion / Sin logica

    return t;

  }

}
