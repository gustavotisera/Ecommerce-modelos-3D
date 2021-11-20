package modelo;

public class usuario {

    private int id;
    private String nombre;
    private String password;
    private String email;
    private int idRol;

    public usuario() {
    }

    public usuario(int id, String nombre, String password, String email, int idRol) {
        this.id = id;
        this.nombre = nombre;
        this.password = password;
        this.email = email;
        this.idRol = idRol;
    }
        public usuario(int id, String nombre, String password, String email) {
        this.id = id;
        this.nombre = nombre;
        this.password = password;
        this.email = email;
        
    }

    public usuario(String nombre, String password, String email, int idRol) {

        this.nombre = nombre;
        this.password = password;
        this.email = email;
        this.idRol = idRol;
    }

 

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public int getIdRol() {
        return idRol;
    }

    @Override
    public String toString() {
        return "usuario{" + "id=" + id + ", nombre=" + nombre + ", password=" + password + ", email=" + email + ", idRol=" + idRol + '}';
    }

}
