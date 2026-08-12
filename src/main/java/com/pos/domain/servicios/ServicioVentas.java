package com.pos.domain.servicios;

import java.util.List;

import com.pos.domain.ventas.entidades.Pago;
import com.pos.domain.ventas.entidades.Venta;

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
