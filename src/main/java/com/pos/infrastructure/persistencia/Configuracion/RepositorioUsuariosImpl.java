package com.pos.infrastructure.persistencia.configuracion;

import com.pos.domain.configuracion.entidades.Rol;
import com.pos.domain.configuracion.entidades.Usuario;
import com.pos.domain.configuracion.enumerados.Permiso;
import com.pos.domain.configuracion.RepositorioUsuarios;
import com.pos.infrastructure.servicios.EncriptadorPin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RepositorioUsuariosImpl implements RepositorioUsuarios {
    private final Map<String, Usuario> tablaUsuarios = new HashMap<>();

    public RepositorioUsuariosImpl() {
        // Datos de prueba para validar Criterios de Aceptación US-07
        Rol rolCajero = new Rol("Cajero");
        rolCajero.agregarPermiso(Permiso.VENTAS); // Solo permiso de VENTAS

        // PIN original "1234" encriptado
        String pinEncriptado = EncriptadorPin.encriptar("1234");
        Usuario cajero = new Usuario("cajero1", pinEncriptado, "Juan Pérez", rolCajero);

        guardar(cajero);
    }

    @Override
    public void guardar(Usuario u) {
        if (u != null) {
            tablaUsuarios.put(u.getNombreUsuario(), u);
        }
    }

    @Override
    public Usuario buscarPorNombre(String nombre) {
        return tablaUsuarios.get(nombre);
    }

    @Override
    public List<Usuario> listarTodos() {
        return new ArrayList<>(tablaUsuarios.values());
    }
}
