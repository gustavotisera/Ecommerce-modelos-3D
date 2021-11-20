
package modelo;

public class reporte1 {
    
    int cantVtas;
    String nombreModelo;
    double subTotal;
    

    public reporte1() {
    }

    public reporte1(int cantVtas, String nombreModelo, double subTotal) {
        this.cantVtas = cantVtas;
        this.nombreModelo = nombreModelo;
        this.subTotal = subTotal;
    }

    public int getCantVtas() {
        return cantVtas;
    }

    public void setCantVtas(int cantVtas) {
        this.cantVtas = cantVtas;
    }

    public String getNombreModelo() {
        return nombreModelo;
    }

    public void setNombreModelo(String nombreModelo) {
        this.nombreModelo = nombreModelo;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    

    
            
            
}
