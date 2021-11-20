
package modelo;

public class modelo 
{
    private int idModelo;
    private String nombre;
    private String descripcion;
    private String parametros;
    private String fecha;
    private double precio;
    private int valoracion;
    private int descargas;
    private String imagen;
    private String archivo;

    public modelo() {
    }

    public modelo(int idModelo, String nombre, String descripcion, String parametros, String fecha, double precio, int valoracion, int descargas, String imagen, String archivo) {
        this.idModelo = idModelo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.parametros = parametros;
        this.fecha = fecha;
        this.precio = precio;
        this.valoracion = valoracion;
        this.descargas = descargas;
        this.imagen = imagen;
        this.archivo = archivo;
    }

    public modelo(String nombre, String descripcion, String parametros, String fecha, double precio, String imagen, String archivo) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.parametros = parametros;
        this.fecha = fecha;
        this.precio = precio;
        this.valoracion = 0;
        this.descargas = 0;
        this.imagen = imagen;
        this.archivo = archivo;
    }

    public int getIdModelo() {
        return idModelo;
    }

    public void setIdModelo(int idModelo) {
        this.idModelo = idModelo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getParametros() {
        return parametros;
    }

    public void setParametros(String parametros) {
        this.parametros = parametros;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getValoracion() {
        return valoracion;
    }

    public void setValoracion(int valoracion) {
        this.valoracion = valoracion;
    }

    public int getDescargas() {
        return descargas;
    }

    public void setDescargas(int descargas) {
        this.descargas = descargas;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getArchivo() {
        return archivo;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }

    
    


    
    
    
    
    
    
    
    
    
}
