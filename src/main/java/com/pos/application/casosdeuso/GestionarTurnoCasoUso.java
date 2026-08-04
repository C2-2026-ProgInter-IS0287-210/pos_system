package com.pos.application.casosdeuso;

import com.pos.domain.configuracion.entidades.Turno;
import com.pos.domain.configuracion.entidades.Usuario;

public class GestionarTurnoCasoUso {

    public Turno abrirTurno(Usuario usuario, double baseEfectivo) {
        Turno turno = new Turno(usuario, baseEfectivo);
        turno.iniciar();
        return turno;
    }

    public void cerrarTurno(Turno turno, double efectivoReal) {
        if (turno != null) {
            turno.setEfectivoReal(efectivoReal);
            turno.finalizar();
        }
    }
}