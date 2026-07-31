package com.pos.domain.compras.entidades;

public class Proveedor {
    private String nombre;
    private String contacto;
    private String direccion;
    private String telefono;
    private String email;
    
    public void actualizarDatos(String nombre, String contacto, String direccion, String telefono, String email) {
        this.nombre = nombre;
        this.contacto = contacto;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
    }
}