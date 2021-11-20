
package modelo;

public class CarritoBD {
    
    int id;
    int item;
    int idUsuario;
    int idModelo;
    double subTotal;

    public CarritoBD() {
    }

    

    public CarritoBD(int id, int item, int idUsuario, int idModelo, double subTotal) {
        this.id = id;
        this.item = item;
        this.idUsuario = idUsuario;
        this.idModelo = idModelo;
        this.subTotal = subTotal;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdModelo() {
        return idModelo;
    }

    public void setIdModelo(int idModelo) {
        this.idModelo = idModelo;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }


    
    
}
