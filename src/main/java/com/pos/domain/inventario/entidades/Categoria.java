package main.java.com.pos.domain.inventario.entidades;
class Categoria {

    private String nombre;
    private String descripcion;
    private Categoria categoriaPadre;

    public Categoria(String nombre, String descripcion, Categoria categoriaPadre) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.categoriaPadre = categoriaPadre;
    }

    

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public Categoria getCategoriaPadre() {
        return categoriaPadre;
    }
}