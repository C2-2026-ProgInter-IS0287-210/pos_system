package com.pos.domain.ventas.entidades;

import com.pos.domain.ventas.enumeradores.MetodoPago;
import com.pos.domain.ventas.valueobjects.Money;

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

  public boolean procesar() {
    if (!validar()) {
      return false;
    }
    return true;

  }

  public boolean validar() {
    return metodo != null
        && monto != null
        && !monto.esCeroONegativo();

  }

}
