//map - estructura llave valor 
// java.list para creal la list}
package main.java.com.pos.domain.informes.entidades; 
public class Dashboard{


    private double ventasTotales;
    private int cantidadVentas;
    private int productosVendidos;
    private int clientesAtendidos;


public Dashboard(double ventasTotales,

 int cantidadVentas,
 int productosVendidos,
 int clientesAtendidos)
 {

  this.ventasTotales = ventasTotales;
  this.cantidadVentas = cantidadVentas;
  this.productosVendidos = productosVendidos;
  this.clientesAtendidos = clientesAtendidos;
}

public double getVentasTotales() {
        return ventasTotales;
    }

    public int getCantidadVentas() {
        return cantidadVentas;
    }

    public int getProductosVendidos() {
        return productosVendidos;
    }

    public int getClientesAtendidos() {
        return clientesAtendidos;
    }




}