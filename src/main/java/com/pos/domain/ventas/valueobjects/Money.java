package main.java.com.pos.domain.ventas.valueobjects;

import java.math.BigDecimal;

public class Money {

 private BigDecimal valor;

 public Money(BigDecimal valor) {
  this.valor = valor;
 }

 public BigDecimal getValor() {
  return valor;
 }
}
