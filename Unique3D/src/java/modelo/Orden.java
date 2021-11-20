
package modelo;

import java.util.List;

public class Orden 
{
    private int id;
    private int idUsuario;
    private int idMetodoPago;
    private int idPago;
    private double total;
    private String fecha;
    
    public Orden() {
    }

    public Orden(int id, int idUsuario, int idMetodoPago, int idPago, double total, String fecha) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.idMetodoPago = idMetodoPago;
        this.idPago = idPago;
        this.total = total;
        this.fecha = fecha;
    }
        public Orden( int idUsuario, int idMetodoPago, int idPago, double total, String fecha) {
        
        this.idUsuario = idUsuario;
        this.idMetodoPago = idMetodoPago;
        this.idPago = idPago;
        this.total = total;
        this.fecha = fecha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdMetodoPago() {
        return idMetodoPago;
    }

    public void setIdMetodoPago(int idMetodoPago) {
        this.idMetodoPago = idMetodoPago;
    }

    public int getIdPago() {
        return idPago;
    }

    public void setIdPago(int idPago) {
        this.idPago = idPago;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
        



    

    

    
    
    
            
    
}
