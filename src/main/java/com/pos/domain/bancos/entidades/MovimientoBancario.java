package com.pos.domain.bancos.entidades;
import java.util.Date;
import com.pos.domain.bancos.enumerados.TipoMovimientoBancario;
import com.pos.domain.ventas.valueobjets.*;

public class MovimientoBancario{
    private Date fecha;
    private String concepto;
    private Money monto;
    private TipoMovimientoBancario tipo;
    private String referencia;

}