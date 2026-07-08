import com.pos.domain.compras.entidades.CuentaPorPagar;

interface ServicioCompras {
    
    public void crearCompra(Compra compra);
    public void recibirMercancia(Compra compra);
    public registrarPago(CuentaPorPagar cpp, Money monto);
    public Money calcularTotal(Compra compra);

}