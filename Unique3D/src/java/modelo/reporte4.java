
package modelo;

public class reporte4 {
    
    String Mes;
    double Total;
    double maximo;
    double minimo;

    public reporte4() {
    }

    public reporte4(String Mes, double Total, double maximo, double minimo) {
        this.Mes = Mes;
        this.Total = Total;
        this.maximo = maximo;
        this.minimo = minimo;
    }

    public String getMes() {
        return Mes;
    }

    public void setMes(String Mes) {
        this.Mes = Mes;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double Total) {
        this.Total = Total;
    }

    public double getMaximo() {
        return maximo;
    }

    public void setMaximo(double maximo) {
        this.maximo = maximo;
    }

    public double getMinimo() {
        return minimo;
    }

    public void setMinimo(double minimo) {
        this.minimo = minimo;
    }

    
    
    
    
    
}
