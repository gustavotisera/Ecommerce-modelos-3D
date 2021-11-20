
package modelo;

public class detalleOrden {
        int id;
    int idOrden;
    int idModelo;   
    double precioCompra;
    modelo model;

    public detalleOrden() {
    }

    public detalleOrden(int id, int idOrden, int idModelo, double precioCompra, modelo model) {
        this.id = id;
        this.idOrden = idOrden;
        this.idModelo = idModelo;
        this.precioCompra = precioCompra;
        this.model = model;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public int getIdModelo() {
        return idModelo;
    }

    public void setIdModelo(int idModelo) {
        this.idModelo = idModelo;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public modelo getModel() {
        return model;
    }

    public void setModel(modelo model) {
        this.model = model;
    }
    
    
    
}
