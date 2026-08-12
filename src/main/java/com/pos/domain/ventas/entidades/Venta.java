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

 public void suspender() {// En proceso de implementacion / Sin logica
 
 estado = EstadoVenta.SUSPENDIDA;

 }

 public void recuperar() {// En proceso de implementacion / Sin logica

  estado = EstadoVenta.DEVUELTA;

 }

 public void anular(String motivo) {// En proceso de implementacion / Sin logica


 estado = EstadoVenta.ANULADA;

 }

 public void dividirCuenta(int comensales, Money propina) {// En proceso de implementacion / Sin logica


 }

 public Money calcularTotal() {// En proceso de implementacion / Sin logica

  


  return propina;// Variable temporal
 }

}
