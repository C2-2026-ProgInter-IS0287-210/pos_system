package com.pos.application.configuracion.casosdeuso; 

import com.pos.domain.configuracion.entidades.Usuario;
import com.pos.infrastructure.configuracion.RepositorioUsuariosImpl;
import com.pos.infrastructure.servicios.EncriptadorPin;

public class AutenticarUsuarioCasoUso {
    private final RepositorioUsuariosImpl repositorioUsuarios;

    public AutenticarUsuarioCasoUso(RepositorioUsuariosImpl repositorioUsuarios) {
        this.RepositorioUsuariosImpl = repositorioUsuarios;
    }

    /**
     * Ejecuta la autenticación de la US-07.
     * Retorna el usuario si el PIN/Hash coincide, o null si es inválido.
     */
    public Usuario ejecutar(String nombreUsuario, String pinIngresado) {
        Usuario usuario = RepositorioUsuariosImpl.buscarPorNombre(nombreUsuario);
        
        if (usuario == null) {
            return null; // Rechazar acceso
        }

        // Se encripta el PIN ingresado para compararlo contra el hash guardado
        String pinHash = EncriptadorPin.encriptar(pinIngresado);

        if (usuario.autenticar(pinHash)) {
            return usuario; // Autenticación exitosa
        }

        return null; // Rechazar acceso por PIN inválido
    }
}