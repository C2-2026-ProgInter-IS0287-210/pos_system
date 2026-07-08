package main.java.com.pos.domain.ventas.entidades;

import java.io.File;

public class Recibo {

 private String formato;
 private String contenido;

 public void imprimir() {//En proceso de implementacion / Sin logica

 }

 public void enviarDigital(String contacto) {//En proceso de implementacion / Sin logica

 }

 public File generarPDF() {//En proceso de implementacion / Sin logica

  return new File(contenido);

 }

}
