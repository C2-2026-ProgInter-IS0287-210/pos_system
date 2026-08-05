 package main.java.com.pos.domain.configuracion.entidades;

public class ConfiguracionGlobal {
private String nombreNegocio;
private String direccion;
private String telefono;
private boolean modoOffline;
private Idioma idioma;
private Moneda moneda;
private double iva;

public ConfiguracionGlobal(String nombreNegocio,String direccion,String telefono,boolean modoOffline, Idioma idioma,Moneda moneda,double iva){
    this.nombreNegocio=nombreNegocio;
    this.direccion=direccion;
    this.telefono=telefono;
    this.modoOffline=modoOffline;
    this.idioma=idioma;
    this.moneda=moneda;
    this.iva=iva;
}
public void cargarConfiguracion(){

}
public void guardarConfiguracion(){

}



    
}