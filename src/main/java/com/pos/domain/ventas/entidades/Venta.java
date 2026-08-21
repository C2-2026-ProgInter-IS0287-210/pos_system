package com.pos.domain.ventas.entidades;

import java.util.Date;

import com.pos.domain.ventas.enumeradores.EstadoVenta;
import com.pos.domain.ventas.valueobjects.Money;

public class Venta {

  private String id;
  private Date fecha;
  private EstadoVenta estado;
  private Money total;
  private Money impuestos;
  private Money propina;
  private String motivoAnulacion;

  public void suspender() {

    if (estado == EstadoVenta.ABIERTA) {
      estado = EstadoVenta.SUSPENDIDA;

    } else if (estado == EstadoVenta.SUSPENDIDA) {
      throw new IllegalStateException("La venta ya se encuentra suspendida");
    } else {

      throw new IllegalStateException("La venta no puede ser suspendida");
    }
  }

  public void recuperar() {

    if (estado != EstadoVenta.SUSPENDIDA) {

      throw new IllegalStateException("La venta no puede ser recuperada ");
    } else {
      estado = EstadoVenta.ABIERTA;

    }

  }

  public void anular(String motivo) {
    if (estado == EstadoVenta.PAGADA || estado == EstadoVenta.ABIERTA) {
      estado = EstadoVenta.ANULADA;
      this.motivoAnulacion = motivo;
    } else {

      throw new IllegalStateException("La venta no puede ser anulada ");
    }

  }

  public void dividirCuenta(int comensales, Money propina) { // Implementada, dudas acerca del guardado de este dato

    if (estado != EstadoVenta.ABIERTA) {

      throw new IllegalStateException("Solo se pueden dividir cuentas de facturas abiertas");

    }

    this.propina = propina;
    Money totalFinal = calcularTotal();
    Money valorPorComensal = totalFinal.dividir(comensales);

  }

  public Money calcularTotal() {

    return total.sumar(impuestos).sumar(propina);

  }

}
