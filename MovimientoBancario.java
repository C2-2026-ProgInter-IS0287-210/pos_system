package com.pos.domain.bancos.entidades;
import java.time.LocalDateTime;
import java.util.UUID;
import com.pos.domain.bancos.enumerados.TipoMovimientoBancario;
import com.pos.domain.ventas.valueobjets.*;

public class MovimientoBancario{
    private LocalDateTime fecha;
    private String concepto;
    private Money monto;
    private TipoMovimientoBancario tipo;
    private String referencia;
    
    public MovimientoBancario (Money monto, TipoMovimientoBancario tipo, String referencia) {
        this.fecha = LocalDateTime.now();
        this.monto = monto;
        this.tipo = tipo;
        this.referencia = UUID.randomUUID().toString();
    }
    
    public Money getMonto() {
        return monto;
    }
    
    public TipoMovimientoBancario getTipo(){
        return tipo;
    }
    
    public String getReferencia(){
        return referencia;
    }

}
