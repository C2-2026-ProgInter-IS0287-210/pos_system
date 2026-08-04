package com.pos.domain.configuracion.entidades;

import com.pos.domain.configuracion.enumerados.Permiso;

public class Usuario {
    private String nombreUsuario;
    private String hashPin;
    private String nombreCompleto;
    private Rol rol;

    public Usuario(String nombreUsuario, String hashPin, String nombreCompleto, Rol rol) {
        this.nombreUsuario = nombreUsuario;
        this.hashPin = hashPin;
        this.nombreCompleto = nombreCompleto;
        this.rol = rol;
    }

    /**
     * Valida si el PIN o Hash recibido coincide con el almacenado en la entidad.
     */
    public boolean autenticar(String pin) {
        if (pin == null || this.hashPin == null) {
            return false;
        }
        return this.hashPin.equals(pin);
    }

    public void cambiarPin(String nuevoPin) {
        if (nuevoPin != null && !nuevoPin.trim().isEmpty()) {
            this.hashPin = nuevoPin;
        }
    }

    /**
     * Evalúa si el usuario cuenta con un permiso a través de su Rol asignado.
     */
    public boolean tienePermiso(Permiso permiso) {
        if (this.rol == null) {
            return false;
        }
        return this.rol.tienePermiso(permiso);
    }

    // Getters y Setters
    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public String getHashPin() {
        return hashPin;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }
}