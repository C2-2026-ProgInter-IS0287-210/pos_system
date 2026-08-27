package com.pos.domain.ventas.entidades;

import com.pos.domain.ventas.valueobjects.Money;

public class Devolucion {

  private String motivo;
  private Money montoReembolso;

  public Devolucion( String motivo, Money montoReembolso) {

    if (motivo == null || motivo.isBlank()) {

      throw new IllegalArgumentException(
          "El motivo de la devolución es obligatorio.");
    }

    if (montoReembolso == null) {

      throw new IllegalArgumentException(
          "El monto del reembolso es obligatorio.");
    }

    this.motivo = motivo;
    this.montoReembolso = montoReembolso;

  }

  public void procesarReembolso() {

    if (motivo == null || motivo.isBlank()) {

      throw new IllegalStateException(
          "No se puede procesar una devolución sin motivo.");
    }

    if (montoReembolso == null) {

      throw new IllegalStateException(
          "No se puede procesar una devolución sin monto.");
    }
//To do : Implementar el proceso de reembolso 
  }

  public boolean autorizar(String codigo) {
    if (codigo == null || codigo.isBlank()) {

      return false;
    }

    if (motivo == null || motivo.isBlank()) {

      return false;
    }

    if (montoReembolso == null) {

      return false;
    }

    return true;
  }

}
//Evaluar regla cuando permite generar el reembolso