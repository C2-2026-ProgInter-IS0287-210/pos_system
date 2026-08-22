package com.pos.infrastructure.persistencia.Configuracion;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.pos.domain.configuracion.servicio.ServicioEncriptacion;

public class EncriptadorPin implements ServicioEncriptacion {

    @Override
    public String encriptar(String pin) {
        if (pin == null) return null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(pin.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error al encriptar el PIN", e);
        }
    }
}
