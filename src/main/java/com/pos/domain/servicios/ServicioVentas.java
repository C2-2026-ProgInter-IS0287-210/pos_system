package main.java.com.pos.domain.servicios;

import java.util.List;

import main.java.com.pos.domain.ventas.entidades.Pago;
import main.java.com.pos.domain.ventas.entidades.Venta;

public class ServicioVentas {
 

 Venta pre;//Variable temporal
public Venta iniciarVenta(){

 return pre;
}

public void pagarVenta(Venta v, List <Pago> pagos){

}

public void suspenderVenta(Venta v){


}

public void anularVenta(Venta v, String motivo){

}


}
