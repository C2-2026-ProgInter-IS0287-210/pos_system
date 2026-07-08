package com.pos.infrastructure.persistencia.compras;

/**
 * RepositorioComprasImpl
 */
public interface RepositorioComprasImpl {

    public void guardar (Compra c);
    public Compra buscarPorId (String id);
    public List<Compra> buscarPorProveedor (Proveedor p);
     
}