package main.java.com.pos.domain.ventas.valueobjects;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Objects;

public final class Money {

  private final BigDecimal valor;

  public Money(double valor) {

    this(BigDecimal.valueOf(valor));
  }

  public Money(BigDecimal valor) {

    if (valor == null) {
      throw new IllegalArgumentException(
          "El valor no puede ser nulo."
      );
    }

    this.valor = valor.setScale(
        2,
        RoundingMode.HALF_UP
    );
  }

  public BigDecimal getValor() {

    return this.valor;
  }

  public Money sumar(Money otro) {

    validarMoney(otro);

    return new Money(
        this.valor.add(otro.valor)
    );
  }

  public Money restar(Money otro) {

    validarMoney(otro);

    return new Money(
        this.valor.subtract(otro.valor)
    );
  }

  public Money multiplicar(int cantidad) {

    return new Money(
        this.valor.multiply(
            BigDecimal.valueOf(cantidad)
        )
    );
  }

  public Money multiplicar(double valor) {

    return new Money(
        this.valor.multiply(
            BigDecimal.valueOf(valor)
        )
    );
  }

  public Money dividir(int partes) {

    if (partes <= 0) {
      throw new IllegalArgumentException(
          "La cantidad de partes debe ser mayor que cero."
      );
    }

    return new Money(
        this.valor.divide(
            BigDecimal.valueOf(partes),
            2,
            RoundingMode.HALF_UP
        )
    );
  }

  public boolean esMayorQue(Money otro) {

    validarMoney(otro);

    return this.valor.compareTo(otro.valor) > 0;
  }

  public boolean esCeroONegativo() {

    return this.valor.compareTo(BigDecimal.ZERO) <= 0;
  }

  private void validarMoney(Money otro) {

    if (otro == null) {
      throw new IllegalArgumentException(
          "El valor monetario no puede ser nulo."
      );
    }
  }

  @Override
  public String toString() {

    return "$" + valor;
  }

  @Override
  public boolean equals(Object objeto) {

    if (this == objeto) {
      return true;
    }

    if (!(objeto instanceof Money)) {
      return false;
    }

    Money otro = (Money) objeto;

    return valor.compareTo(otro.valor) == 0;
  }

  @Override
  public int hashCode() {

    return Objects.hash(valor);
  }
}