package main.java.com.pos.application.casosdeuso; 

import main.java.com.pos.domain.configuracion.entidades.Usuario;
import main.java.com.pos.infrastructure.configuracion.RepositorioUsuariosImpl;
import main.java.com.pos.infrastructure.servicios.EncriptadorPin;

public class AutenticarUsuarioCasoUso {
    private final RepositorioUsuarios repositorioUsuarios;

    public AutenticarUsuarioCasoUso(RepositorioUsuarios repositorioUsuarios) {
        this.repositorioUsuarios = repositorioUsuarios;
    }

    /**
     * Ejecuta la autenticación de la US-07.
     * Retorna el usuario si el PIN/Hash coincide, o null si es inválido.
     */
    public Usuario ejecutar(String nombreUsuario, String pinIngresado) {
        Usuario usuario = repositorioUsuarios.buscarPorNombre(nombreUsuario);
        
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