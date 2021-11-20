
package modelo;

public class reporteVentas {
    
    int id;
    int idU;
    String cliente;
    int idM;
    String modelo;
    String fecha;
    double total;

    public reporteVentas() {
    }

    public reporteVentas(int id, int idU, String cliente, int idM, String modelo, String fecha, double total) {
        this.id = id;
        this.idU = idU;
        this.cliente = cliente;
        this.idM = idM;
        this.modelo = modelo;
        this.fecha = fecha;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdU() {
        return idU;
    }

    public void setIdU(int idU) {
        this.idU = idU;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public int getIdM() {
        return idM;
    }

    public void setIdM(int idM) {
        this.idM = idM;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }


    
    
   
    
    
            
}
