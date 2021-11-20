
package modelo;

public class repGrafTopClientes
{
    private int cant;
    private String nom;

    
    public repGrafTopClientes(int cant, String nom) {
        this.cant = cant;
        this.nom = nom;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    
}
