
package modelo;

public class rol 
{
    public int id;
    public String nombre;

    public rol(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }
        public rol( String nombre) {
       
        this.nombre = nombre;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
        
        

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    @Override
    public String toString() {
        return "rol{" + "id=" + id + ", nombre=" + nombre + '}';
    }
    
    
}
