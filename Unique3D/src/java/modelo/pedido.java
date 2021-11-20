
package modelo;

public class pedido 
{
    int id;
    String descripcion;
    String presupuesto;
    String plazo;
    String archivo;
    String nomApe;
    String email;

    public pedido() {
    }

    public pedido(int id, String descripcion, String presupuesto, String plazo, String archivo, String nomApe, String email) {
        this.id = id;
        this.descripcion = descripcion;
        this.presupuesto = presupuesto;
        this.plazo = plazo;
        this.archivo = archivo;
        this.nomApe = nomApe;
        this.email = email;
    }
        public pedido( String descripcion, String presupuesto, String plazo, String archivo, String nomApe, String email) {
        
        this.descripcion = descripcion;
        this.presupuesto = presupuesto;
        this.plazo = plazo;
        this.archivo = archivo;
        this.nomApe = nomApe;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPresupuesto() {
        return presupuesto;
    }

    public void setPresupuesto(String presupuesto) {
        this.presupuesto = presupuesto;
    }

    public String getPlazo() {
        return plazo;
    }

    public void setPlazo(String plazo) {
        this.plazo = plazo;
    }

    public String getArchivo() {
        return archivo;
    }

    public void setArchivo(String archivo) {
        this.archivo = archivo;
    }

    public String getNomApe() {
        return nomApe;
    }

    public void setNomApe(String nomApe) {
        this.nomApe = nomApe;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    

    
    
}
