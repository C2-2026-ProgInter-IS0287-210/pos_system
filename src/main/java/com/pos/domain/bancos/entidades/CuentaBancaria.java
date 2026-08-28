package com.pos.domain.bancos.entidades;
import com.pos.domain.ventas.valueobjets.*;
import java.util.ArrayList;
import java.util.List;

public class CuentaBancaria {
    private String numero;
    private String entidad;
    private String tipo;
    private Money saldo;
    private String moneda;
    private List<MovimientoBancario> movimientos;

    public void depositar(Money monto){
     saldo = saldo.sumar(monto);
        MovimientoBancario movimiento = new MovimientoBancario(monto, TipoMovimiento.DEPOSITO);
            movimientos.add(movimiento);
    }

    public void retirar(Money monto) {
        if (monto.getValor() > saldo.getValor()) {
        System.out.println("Saldo insuficiente.");
        return;
    }
    saldo = saldo.restar(monto);
    MovimientoBancario movimiento = new MovimientoBancario(monto, TipoMovimiento.RETIRO);
    movimientos.add(movimiento);
    }

    public void transferir (CuentaBancaria destino, Money monto){
        public void transferir(CuentaBancaria destino, Money monto) {
        if (monto.getValor() > saldo.getValor()) {
        System.out.println("Saldo insuficiente.");
        return;
    }
        retirar(monto);
        destino.depositar(monto);
        }
    }

    public Money consultarSaldo(){
        public Money consultarSaldo() {
            return saldo;
            }
    }
}