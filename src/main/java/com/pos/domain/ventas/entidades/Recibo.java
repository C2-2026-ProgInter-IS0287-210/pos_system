package main.java.com.pos.domain.ventas.entidades;

import java.io.File;

public class Recibo {

  private String formato;
  private String contenido;

  public Recibo(String formato, String contenido) {

    if (formato == null || formato.isBlank()) {

      throw new IllegalArgumentException(
          "El formato del recibo no puede estar vacío.");
    }

    if (contenido == null || contenido.isBlank()) {

      throw new IllegalArgumentException(
          "El contenido del recibo no puede estar vacío.");
    }

    this.formato = formato;
    this.contenido = contenido;

  }

  public String getFormato() {

    return this.formato;
  }

  public String getContenido() {

    return this.contenido;
  }

  public void imprimir() {

    if (contenido.isBlank()) {

      throw new IllegalStateException("No hay nada para imprimir");

    }

  }

  public void enviarDigital(String contacto) {

    if (contacto == null || contacto.isBlank()) {

      throw new IllegalArgumentException(
          "El contacto no puede estar vacío.");
    }

    if (contenido == null || contenido.isBlank()) {

      throw new IllegalStateException(
          "El recibo no tiene contenido para enviar.");
    }
  }

  public File generarPDF() {

    if (contenido == null || contenido.isBlank()) {

      throw new IllegalStateException(
          "El recibo no tiene contenido para generar el PDF.");
    }
    return new File("recibo.pdf");
  }

}
