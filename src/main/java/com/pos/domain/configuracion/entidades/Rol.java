package com.pos.domain.configuracion.entidades;
import util.List;
import com.pos.domain.configuracion.enumerados.Permiso;
import util.ArrayList;


public class Rol {
    private String nombre;
    private List<Permiso> permisos;

    public Rol(String nombre) {
        this.nombre = nombre;
        this.permisos = new ArrayList<>();
    }

    public void agregarPermiso(Permiso p) {
        if (p != null && !permisos.contains(p)) {
            this.permisos.add(p);
        }
    }

    public void removerPermiso(Permiso p) {
        this.permisos.remove(p);
    }

    public boolean tienePermiso(Permiso p) {
        return this.permisos.contains(p);
    }

    // Getters y Setters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Permiso> getPermisos() {
        return permisos;
    }
}