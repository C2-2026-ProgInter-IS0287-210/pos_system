public class ControladorCompras {
    private RecibirMercanciaCasoUso recibirMercanciaCasoUso;
    
    public ControladorCompras() {
        recibirMercanciaCasoUso = new RecibirMercanciaCasoUso();
    }

    public void recibirMercancia(Compra compra) {
        recibirMercanciaCasoUso.ejecutar(compra);
    }
}
