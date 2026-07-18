package main. java. com. pos. domain. gestioncaja.entidades;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class MovimientoCaja {
    private TipoMovimientoCaja tipo;
    private BigDecimal monto; 
    private String concepto;
    private LocalDateTime fecha; 
    private Usuario usuario;
    private String referencia;

    
    public MovimientoCaja() {}

    public MovimientoCaja(TipoMovimientoCaja tipo, BigDecimal monto, String concepto, 
                          LocalDateTime fecha, Usuario usuario, String referencia) {
        this.tipo = tipo;
        this.monto = monto;
        this.concepto = concepto;
        this.fecha = fecha;
        this.usuario = usuario;
        this.referencia = referencia;
    }

   
   