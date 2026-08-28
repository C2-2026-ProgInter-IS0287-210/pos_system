package com.pos.domain.bancos.entidades;
import java.util.LocalDateDate;
import com.pos.domain.bancos.enumerados.TipoMovimientoBancario;
import com.pos.domain.ventas.valueobjets.*;

public class MovimientoBancario{
    private Date fecha;
    private String concepto;
    private Money monto;
    private TipoMovimientoBancario tipo;
    private String referencia;


public MovimientoBancario(Money monto, TipoMovimiento tipo) {
        this.fecha = LocalDateTime.now();
        this.monto = monto;
        this.tipo = tipo;
        this.referencia = UUID.randomUUID().toString();
    }

public Money getMonto() {
        return monto;
    }

public TipoMovimiento getTipo() {
        return tipo;
    }

}