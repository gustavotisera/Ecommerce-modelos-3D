package gestor;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Carrito;
import modelo.CarritoBD;
import modelo.Orden;
import modelo.carritoDTO;
import modelo.contacto;
import modelo.detalleOrden;
import modelo.metodoPago;
import modelo.modelo;
import modelo.pedido;
import modelo.repGrafTopClientes;
import modelo.reporte1;
import modelo.reporte3;
import modelo.reporte4;
import modelo.reporteGrafico;
import modelo.reporteVentas;
import modelo.rol;
import modelo.usuario;
import modelo.usuarioLogin;

public class GestorDB {

    private Connection con;
    private final String CON_STR = "jdbc:sqlserver://DESKTOP-E50Q2OQ:1433;databaseName=Unique3D";
    private final String USER = "sa";
    private final String PASS = "123456789";

    private void abrirConexion() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();

            con = DriverManager.getConnection(CON_STR, USER, PASS);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void cerrarConexion() {
        try {

            if (con != null && !con.isClosed()) {
                con.close();
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    //--------------- ALTA USUARIO -------------------------------------------------------------
    public String login(usuario usu) throws Exception {
        String estado = "";
        ResultSet rs;
        try {
            abrirConexion();
            String sql = "select idRol, id_usuario, email from usuario where nombre=? and password=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, usu.getNombre());
//            st.setString(2, usu.getPassword());
            st.setString(2, usu.getPassword());

            rs = st.executeQuery();
            if (rs.next()) {

                estado = "true";

            }
            usu.setIdRol(rs.getInt("idRol"));
            usu.setId(rs.getInt("id_usuario"));
            usu.setEmail(rs.getString("email"));

        } catch (Exception e) {
            throw e;
        } finally {
            cerrarConexion();
        }
        return estado;
    }

    public boolean obtenerUsuarioPorNombre(String nom) {
        boolean existe = false;
        try {
            abrirConexion();
            String sql = "select * from usuario WHERE nombre=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, nom);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getRow() > 0) {
                    existe = true;
                }

//                int idU = rs.getInt("id_usuario");
//                String nomb = rs.getString("nombre");
//                String pass = rs.getString("password");
//                String email = rs.getString("email");
//
//                u = new usuario(idU, nomb, pass, email);
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return existe;
    }

    public boolean existeRolAdmin() {
        boolean existe = false;
        try {
            abrirConexion();
            String sql = "select * from usuario WHERE idRol=1";
            PreparedStatement st = con.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getRow() > 0) {
                    existe = true;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return existe;
    }

    public boolean existeCarrito(int idUsuario, int idModelo) {
        boolean existe = false;
        try {
            abrirConexion();
            String sql = "select * from carrito where idUsuario = ? and idModelo = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idUsuario);
            st.setInt(2, idModelo);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getRow() > 0) {
                    existe = true;
                }

            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return existe;
    }

    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public String buscarPass(String usuario) {
        String pass = null;

        try {
            abrirConexion();
            PreparedStatement st = con.prepareStatement("SELECT * FROM usuario WHERE nombre = ?");
            st.setString(1, usuario);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                pass = rs.getString("password");

            }
            rs.close();
        } catch (Exception exc) {
            exc.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return pass;
    }

    public int buscarRol() {
        int id = 0;
        try {
            abrirConexion();
            PreparedStatement st = con.prepareStatement("select * from rol where id=1");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {

                id = 1;

            }
            rs.close();
        } catch (Exception exc) {
            exc.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return id;
    }

    public int IdRol() {
        int idR = 0;
        ResultSet rs;
        String sql = "select idRol from usuario where idRol=1";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idR = rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return idR;
    }

//
//    public rol obtenerRol(int id) {
//        rol resultado = null;
//
//        try {
//            abrirConexion();
//            String sql = "SELECT * FROM rol WHERE id = ?;";
//            PreparedStatement st = con.prepareStatement(sql);
//            st.setInt(1, id);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                String nombre = rs.getString("nombre");
//                resultado = new rol(id, nombre);
//            }
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        } finally {
//            cerrarConexion();
//        }
//
//        return resultado;
//    }
    public void altaUsuario(usuario u) {
        try {
            abrirConexion();
            String sql = "INSERT INTO usuario (nombre, password, email, idRol) VALUES (?,?,?,?)";
            PreparedStatement p = con.prepareStatement(sql);

            p.setString(1, u.getNombre());
//            p.setString(2, getMD5(u.getPassword()));
            p.setString(2, u.getPassword());
            p.setString(3, u.getEmail());
            p.setInt(4, u.getIdRol());

            p.executeUpdate();
            p.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public ArrayList<rol> getRoles() {
        ArrayList<rol> lista = new ArrayList<rol>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM rol";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");

                lista.add(new rol(id, nombre));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<rol> ObtenerRoles() {
        ArrayList<rol> lista = new ArrayList<rol>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM rol";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                lista.add(new rol(id, nombre));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public void eliminarUsuario(String nombre) {
        try {
            abrirConexion();

            String sql = "DELETE FROM usuario WHERE nombre = ? ";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, nombre);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public boolean modificarUsuario(usuario u) {
        boolean up = false;
        try {
            abrirConexion();
            String sql = "UPDATE usuario SET nombre=?, password=?, email=? WHERE id_usuario=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, u.getNombre());
            st.setString(2, u.getPassword());
            st.setString(3, u.getEmail());
            st.setInt(4, u.getId());

            st.executeUpdate();
            up = true;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return up;
    }

    public ArrayList<usuario> getObtenerUsuarios() {
        ArrayList<usuario> lista = new ArrayList<usuario>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM usuario";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_usuario");
                String nombre = rs.getString("nombre");
                String password = rs.getString("password");
                String email = rs.getString("email");
                int idRol = rs.getInt("idRol");

                lista.add(new usuario(id, nombre, password, email, idRol));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public usuario obtenerUsuarioPorID(int id) {
        usuario u = null;
        try {
            abrirConexion();
            String sql = "select * from usuario WHERE id_usuario=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                int idU = rs.getInt("id_usuario");
                String nom = rs.getString("nombre");
                String pass = rs.getString("password");
                String email = rs.getString("email");

                u = new usuario(idU, nom, pass, email);
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return u;
    }

    //--------------- ABM MODELO -------------------------------------------------------------  
    public void altaModelo(modelo m) {
        try {
            abrirConexion();
            String sql = "INSERT INTO modelo (nombre, descripcion, parametros, fechapublicacion, precio, valoracion, descargas, imagen, archivo) VALUES (?,?,?,?,?,0,0,?,?)";
            PreparedStatement p = con.prepareStatement(sql);

            p.setString(1, m.getNombre());
            p.setString(2, m.getDescripcion());
            p.setString(3, m.getParametros());
            p.setString(4, m.getFecha());
            p.setDouble(5, m.getPrecio());
            p.setString(6, m.getImagen());
            p.setString(7, m.getArchivo());

            p.executeUpdate();
            p.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public ArrayList<modelo> ObtenerModelo() {
        ArrayList<modelo> lista = new ArrayList<modelo>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM modelo";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_modelo");
                String nom = rs.getString("nombre");
                String des = rs.getString("descripcion");
                String par = rs.getString("parametros");
                String fec = rs.getString("fechapublicacion");
                double pre = rs.getDouble("precio");
                int val = rs.getInt("valoracion");
                int desc = rs.getInt("descargas");
                String img = rs.getString("imagen");
                String arc = rs.getString("archivo");

                lista.add(new modelo(id, nom, des, par, fec, pre, val, desc, img, arc));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<modelo> getListaModelo() {
        ArrayList<modelo> lista = new ArrayList<modelo>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM modelo";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_modelo");
                String nom = rs.getString("nombre");
                String des = rs.getString("descripcion");
                String par = rs.getString("parametros");
                String fec = rs.getString("fechapublicacion");
                double pre = rs.getDouble("precio");
                int val = rs.getInt("valoracion");
                int desc = rs.getInt("descargas");
                String img = rs.getString("imagen");
                String arc = rs.getString("archivo");

                lista.add(new modelo(id, nom, des, par, fec, pre, val, desc, img, arc));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<modelo> ultimos6Modelos() {
        ArrayList<modelo> lista = new ArrayList<modelo>();
        try {
            abrirConexion();
            String sql = "SELECT TOP 6 * FROM modelo order by id_modelo desc";

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_modelo");
                String nom = rs.getString("nombre");
                String des = rs.getString("descripcion");
                String par = rs.getString("parametros");
                String fec = rs.getString("fechapublicacion");
                double pre = rs.getDouble("precio");
                int val = rs.getInt("valoracion");
                int desc = rs.getInt("descargas");
                String img = rs.getString("imagen");
                String arc = rs.getString("archivo");

                lista.add(new modelo(id, nom, des, par, fec, pre, val, desc, img, arc));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<modelo> modelosMvalor() {
        ArrayList<modelo> lista = new ArrayList<modelo>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM modelo order by valoracion desc";

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id_modelo");
                String nom = rs.getString("nombre");
                String des = rs.getString("descripcion");
                String par = rs.getString("parametros");
                String fec = rs.getString("fechapublicacion");
                double pre = rs.getDouble("precio");
                int val = rs.getInt("valoracion");
                int desc = rs.getInt("descargas");
                String img = rs.getString("imagen");
                String arc = rs.getString("archivo");

                lista.add(new modelo(id, nom, des, par, fec, pre, val, desc, img, arc));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<modelo> buscarM(String nombre) {
        ArrayList<modelo> lista = new ArrayList<modelo>();

        String sql = "select * from modelo where nombre like '%" + nombre + "%'";
        try {
            abrirConexion();
            Statement st = con.createStatement();
//            st.setString(1, nombre);
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {

                int id = rs.getInt("id_modelo");
                String nom = rs.getString("nombre");
                String des = rs.getString("descripcion");
                String par = rs.getString("parametros");
                String fec = rs.getString("fechapublicacion");
                double pre = rs.getDouble("precio");
                int val = rs.getInt("valoracion");
                int desc = rs.getInt("descargas");
                String img = rs.getString("imagen");
                String arc = rs.getString("archivo");

                lista.add(new modelo(id, nom, des, par, fec, pre, val, desc, img, arc));
            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public modelo obtenerModeloPorId(int id) {
        modelo m = null;
        try {
            abrirConexion();

            String sql = "select * from modelo WHERE id_modelo=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String nom = rs.getString("nombre");
                String des = rs.getString("descripcion");
                String par = rs.getString("parametros");
                String fec = rs.getString("fechapublicacion");
                double pre = rs.getDouble("precio");
                int val = rs.getInt("valoracion");
                int desc = rs.getInt("descargas");
                String img = rs.getString("imagen");
                String arc = rs.getString("archivo");

                m = new modelo(id, nom, des, par, fec, pre, val, desc, img, arc);
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return m;
    }

    public modelo getModeloPorId(int id) {
        modelo m = null;
        try {
            abrirConexion();
            String sql = "select * from modelo WHERE id_modelo=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String nom = rs.getString("nombre");
                String des = rs.getString("descripcion");
                String par = rs.getString("parametros");
                String fec = rs.getString("fechapublicacion");
                double pre = rs.getDouble("precio");
                int val = rs.getInt("valoracion");
                int desc = rs.getInt("descargas");
                String img = rs.getString("imagen");
                String arc = rs.getString("archivo");

                m = new modelo(id, nom, des, par, fec, pre, val, desc, img, arc);
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return m;
    }
//       public modelo obtenerModeloACarrito(int id) {
//        modelo m = new modelo();
//        try {
//            abrirConexion();
//            String sql = "select * from modelo WHERE id_modelo=?";
//            PreparedStatement st = con.prepareStatement(sql);
//            st.setInt(1, id);
//
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                String nom = rs.getString("nombre");
//                String des = rs.getString("descripcion");
//                String par = rs.getString("parametros");
//                String fec = rs.getString("fechapublicacion");
//                double pre = rs.getDouble("precio");
//                int val = rs.getInt("valoracion");
//                int desc = rs.getInt("descargas");
//                String img = rs.getString("imagen");
//
//                m = new modelo(id, nom, des, par, fec, pre, val, desc, img);
//            }
//            rs.close();
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        } finally {
//            cerrarConexion();
//        }
//        return m;
//    }

//    public boolean modificarModelo(modelo m) {
//        boolean up = false;
//        try {
//            abrirConexion();
//            String sql = "UPDATE modelo "
//                    + "SET nombre=?, descripcion=?, "
//                    + "parametros=?, fechapublicacion=?, "
//                    + "precio=?, valoracion=?, descargas=?, imagen=?, archivo=? WHERE id_modelo=?";
//            PreparedStatement st = con.prepareStatement(sql);
//            st.setString(1, m.getNombre());
//            st.setString(2, m.getDescripcion());
//            st.setString(3, m.getParametros());
//            st.setString(4, m.getFecha());
//            st.setDouble(5, m.getPrecio());
//            st.setInt(6, m.getValoracion());
//            st.setInt(7, m.getDescargas());
//            st.setString(8, m.getImagen());
//            st.setString(9, m.getArchivo());
//            st.setInt(10, m.getIdModelo());
//
//            st.executeUpdate();
//            up = true;
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        } finally {
//            cerrarConexion();
//        }
//
//        return up;
//    }
    public boolean modificarModelo(modelo m) {
        boolean up = false;
        try {
            abrirConexion();
            String sql = "UPDATE modelo "
                    + "SET nombre=?, descripcion=?, "
                    + "parametros=?, fechapublicacion=?, "
                    + "precio=?, valoracion=?, descargas=?, imagen=?, archivo=? WHERE id_modelo=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, m.getNombre());
            st.setString(2, m.getDescripcion());
            st.setString(3, m.getParametros());
            st.setString(4, m.getFecha());
            st.setDouble(5, m.getPrecio());
            st.setInt(6, m.getValoracion());
            st.setInt(7, m.getDescargas());
            st.setString(8, m.getImagen());
            st.setString(9, m.getArchivo());
            st.setInt(10, m.getIdModelo());

            st.executeUpdate();
            up = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return up;
    }

    public void eliminarModelo(int idModelo) {
        try {
            abrirConexion();

            String sql = "DELETE FROM modelo WHERE id_modelo = ? ";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idModelo);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

//-------GENERAR COMPRA----------------------------------------------------------------------------------------------------------------
//    public int GenerarOrden(Orden o) {
//        String sql = "insert into orden(idUsuario,idMetodoPago,total)values(?,?,?)";
//
//        int r = 0;
//        ResultSet rs;
//        int idOrden;
//        try {
//            abrirConexion();
//            
//            PreparedStatement st = con.prepareStatement(sql);
//            st.setInt(1, o.getUser().getId());
//            st.setInt(2, o.getIdMetodoPago());
//            st.setDouble(3, o.getTotal());
//            r = st.executeUpdate();
//
//   
////            sql="select MAX(id) from orden";
//            sql = "select @@IDENTITY AS id";
//            rs = st.executeQuery(sql);
//            rs.next();
//            idOrden = rs.getInt("id");
//            rs.close();
//
//            for (Carrito detalle : o.getDetalleCompras()) {
//                sql = "insert into detalle_Orden(idOrden,idModelo,precio)values(?,?,?)";
//                st = con.prepareStatement(sql);
//                st.setInt(1, idOrden);
//                st.setInt(2, detalle.getIdModelo());
//                st.setDouble(3, detalle.getPrecioCompra());
//                r = st.executeUpdate();
//            }
//
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        } finally {
//            cerrarConexion();
//        }
//
//        return r;
//
//    }
    public int idOrden() {
        int idO = 0;
        ResultSet rs;

        try {
            abrirConexion();
            String sql = "select max(id) from orden";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idO = rs.getInt(1);
            }
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return idO;
    }

    public void guardarCarrito(CarritoBD car) {
        try {
            abrirConexion();
            String sql = "INSERT INTO carrito (idUsuario, idModelo, subtotal) VALUES (?,?,?)";
            PreparedStatement p = con.prepareStatement(sql);

            p.setInt(1, car.getIdUsuario());
            p.setInt(2, car.getIdModelo());
            p.setDouble(3, car.getSubTotal());

            p.executeUpdate();
            p.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public void eliminaCarrito(int item) {
        try {
            abrirConexion();

            String sql = "DELETE FROM carrito WHERE id = ? ";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, item);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public void LimpiarCarrito(int idUs) {
        try {
            abrirConexion();

            String sql = "DELETE FROM carrito WHERE idUsuario = ? ";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idUs);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

//    public boolean ifExiste(int idM ,idU) {
//        boolean existe = false;
//        ResultSet rs;
//        try {
//            abrirConexion();
//
//            String sql = "SELECT idModelo FROM carrito WHERE idModelo = ? ";
//            PreparedStatement st = con.prepareStatement(sql);
//
//            st.setInt(1, item);
//            rs = st.executeQuery();
//            while (rs.next()) {
//                id = rs.getInt(1);
//            }
//            st.executeUpdate();
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        } finally {
//            cerrarConexion();
//        }
//        return existe;
//    }
    public ArrayList<carritoDTO> listaCarritoUsuario(int id) {
        ArrayList<carritoDTO> lista = new ArrayList<carritoDTO>();
        String sql = "select  c.id, idUsuario,idModelo,m.imagen, m.nombre,m.descripcion, m.precio from carrito c join usuario u on c.idUsuario=u.id_usuario join modelo m  on m.id_modelo=c.idModelo where c.idUsuario = ?";
        try {
            abrirConexion();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                int item = rs.getInt("id");
                int idU = rs.getInt("idUsuario");
                int idM = rs.getInt("idModelo");
                String img = rs.getString("imagen");
                String nom = rs.getString("nombre");
                String des = rs.getString("descripcion");
                double pre = rs.getDouble("precio");

                lista.add(new carritoDTO(item, idU, idM, img, nom, des, pre));
            }
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public int guardarOrden(Orden o) {
        try {
            abrirConexion();
            String sql = "insert into orden(idUsuario,idMetodoPago,idPago,total,fecha)values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, o.getIdUsuario());
            ps.setInt(2, o.getIdMetodoPago());
            ps.setInt(3, o.getIdPago());
            ps.setDouble(4, o.getTotal());
            ps.setString(5, o.getFecha());

            ps.executeUpdate();

            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return 1;
    }

    public int guardarDetalleOrden(detalleOrden d) {

        try {
            abrirConexion();
            String sql = "insert into detalle_Orden(idOrden,idModelo,precio)values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, d.getIdOrden());
            ps.setInt(2, d.getIdModelo());
            ps.setDouble(3, d.getPrecioCompra());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return 1;
    }

    public List misOrdenes(int id) {
        ResultSet rs;
        List lista = new ArrayList();
        String sql = "select * from orden where idUsuario=" + id;
        try {
            abrirConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Orden o = new Orden();
                o.setId(rs.getInt(1));
                o.setIdUsuario(rs.getInt(2));
                o.setIdMetodoPago(rs.getInt(3));
                o.setIdPago(rs.getInt(4));
                o.setTotal(rs.getDouble(5));
                o.setFecha(rs.getString(6));

                lista.add(o);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public List Detalle(int id) {
        ResultSet rs;
        List lista = new ArrayList();
        String sql = "select id, m.nombre , m.imagen , idOrden, d.precio ,m.archivo from detalle_Orden d join modelo m on d.idModelo=m.id_modelo where idOrden = ?";
        try {
            abrirConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                detalleOrden don = new detalleOrden();
                don.setId(rs.getInt(1));
                don.setModel(new modelo());
                don.getModel().setNombre(rs.getString(2));
                don.getModel().setImagen(rs.getString(3));
                don.setIdOrden(rs.getInt(4));
                don.setPrecioCompra(rs.getDouble(5));
                don.getModel().setArchivo(rs.getString(6));

                lista.add(don);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public int Pagar(double monto) {
        try {
            abrirConexion();
            String sql = "insert into pago (Monto) values(?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setDouble(1, monto);

            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return 1;
    }

    public int IdPago() {
        int idpago = 0;
        ResultSet rs;

        try {
            abrirConexion();
            String sql = "select max(id) from pago";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                idpago = rs.getInt(1);
            }
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return idpago;
    }

    //-*---------------------------------------------------------------------------------------------------
    public void altaMetodoPago(metodoPago m) {
        try {
            abrirConexion();
            String sql = "INSERT INTO metodoPago (nombre) VALUES (?)";
            PreparedStatement p = con.prepareStatement(sql);

            p.setString(1, m.getNombre());

            p.executeUpdate();
            p.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public ArrayList<metodoPago> getObtenerMP() {
        ArrayList<metodoPago> lista = new ArrayList<metodoPago>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM metodoPago";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                lista.add(new metodoPago(id, nombre));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public void incrementarValoracion(int id) {
        try {
            abrirConexion();
            String sql = "UPDATE modelo SET valoracion = valoracion + 1  WHERE id_modelo=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, id);

            st.executeUpdate();
            st.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public void incrementarDescarga(String nom) {
        try {
            abrirConexion();
            String sql = "UPDATE modelo SET descargas = descargas + 1  WHERE nombre=?";
            PreparedStatement st = con.prepareStatement(sql);

            st.setString(1, nom);

            st.executeUpdate();
            st.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    ///-modelos mas vendidos y el total 
    public ArrayList<reporte1> reporte1(String fecha1, String fecha2) {
        ArrayList<reporte1> lista = new ArrayList<reporte1>();
        try {
            abrirConexion();
            String sql = "select COUNT(d.idModelo) 'CantVtas',m.nombre,SUM(d.precio) 'SubTotal'\n"
                    + "FROM detalle_Orden d join modelo m on d.idModelo=m.id_modelo join orden o on o.id=d.idOrden\n"
                    + "where o.fecha between ? AND ?\n"
                    + "group by d.idModelo, m.nombre,d.precio\n"
                    + "order by COUNT(1) desc";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, fecha1);
            st.setString(2, fecha2);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int cantVtas = rs.getInt("CantVtas");
                String nom = rs.getString("nombre");
                double pre = rs.getDouble("SubTotal");

                lista.add(new reporte1(cantVtas, nom, pre));
            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

//////////////--usuarios que no compraron entre un rango de fechas///////////
    public ArrayList<usuarioLogin> reporte2(String fecha1, String fecha2) {
        ArrayList<usuarioLogin> lista = new ArrayList<usuarioLogin>();
        String sql = "select id_usuario, nombre\n"
                + "from usuario \n"
                + "where id_usuario not in(select idUsuario\n"
                + "from Orden \n"
                + "where fecha between ? AND ? ) ";
        try {
            abrirConexion();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, fecha1);
            st.setString(2, fecha2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                int id = rs.getInt("id_usuario");
                String nom = rs.getString("nombre");

                lista.add(new usuarioLogin(id, nom));
            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }
//////////--Modelo con mas valoracion  en rango de fechas/////////////////

    public ArrayList<reporte3> reporte3(String fecha1, String fecha2) {
        ArrayList<reporte3> lista = new ArrayList<reporte3>();
        try {
            abrirConexion();
            String sql = " select id_modelo,nombre,descripcion,fechapublicacion,valoracion\n"
                    + "from modelo\n"
                    + "where fechapublicacion between ? AND ?\n"
                    + "order by valoracion desc";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, fecha1);
            st.setString(2, fecha2);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id_modelo");
                String nom = rs.getString("nombre");
                String des = rs.getString("descripcion");
                String fec = rs.getString("fechapublicacion");
                int val = rs.getInt("valoracion");

                lista.add(new reporte3(id, nom, des, fec, val));
            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<reporte4> reporte4(String año) {
        ArrayList<reporte4> lista = new ArrayList<reporte4>();
        String sql = "Select month(fecha) Mes, sum(total) Total ,max(total) maximo, min(total) minimo\n"
                + "From orden\n"
                + "Where year(fecha) = 2021 \n"
                + "Group by month(fecha)";
        try {
            abrirConexion();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, año);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                String mes = rs.getString("Mes");
                double total = rs.getDouble("Total");
                double max = rs.getDouble("maximo");
                double min = rs.getDouble("minimo");

                lista.add(new reporte4(mes, total, max, min));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public void altaContacto(contacto c) {
        try {
            abrirConexion();
            String sql = "INSERT INTO contacto (nombre, email, asunto, mensaje) VALUES (?,?,?,?)";
            PreparedStatement p = con.prepareStatement(sql);

            p.setString(1, c.getNombre());
            p.setString(2, c.getEmail());
            p.setString(3, c.getAsunto());
            p.setString(4, c.getMensaje());

            p.executeUpdate();
            p.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public ArrayList<contacto> bandejaEntrada() {
        ArrayList<contacto> lista = new ArrayList<contacto>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM contacto";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                String nombre = rs.getString("nombre");
                String email = rs.getString("email");
                String asunto = rs.getString("asunto");
                String mensaje = rs.getString("mensaje");

                lista.add(new contacto(nombre, email, asunto, mensaje));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public void altaPedido(pedido pe) {
        try {
            abrirConexion();
            String sql = "INSERT INTO pedido (descripcion, presupuesto, plazo, archivo, nomApe, email) VALUES (?,?,?,?,?,?)";
            PreparedStatement p = con.prepareStatement(sql);

            p.setString(1, pe.getDescripcion());
            p.setString(2, pe.getPresupuesto());
            p.setString(3, pe.getPlazo());
            p.setString(4, pe.getArchivo());
            p.setString(5, pe.getNomApe());
            p.setString(6, pe.getEmail());

            p.executeUpdate();
            p.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }
        public void eliminarPedido(int idPedido) {
        try {
            abrirConexion();

            String sql = "DELETE FROM pedido WHERE id = ? ";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idPedido);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }

    public ArrayList<pedido> getObtenerPedido() {
        ArrayList<pedido> lista = new ArrayList<pedido>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM pedido";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String des = rs.getString("descripcion");
                String par = rs.getString("presupuesto");
                String pla = rs.getString("plazo");
                String pre = rs.getString("archivo");
                String nomApe = rs.getString("nomApe");
                String email = rs.getString("email");

                lista.add(new pedido(id, des, par, pla, pre, nomApe, email));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<pedido> listaPedidos() {
        ArrayList<pedido> lista = new ArrayList<pedido>();
        try {
            abrirConexion();
            String sql = "SELECT * FROM pedido";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String des = rs.getString("descripcion");
                String par = rs.getString("presupuesto");
                String pla = rs.getString("plazo");
                String pre = rs.getString("archivo");
                String nomApe = rs.getString("nomApe");
                String email = rs.getString("email");

                lista.add(new pedido(id, des, par, pla, pre, nomApe, email));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<reporteGrafico> getReporteG() {
        ArrayList<reporteGrafico> lista = new ArrayList<reporteGrafico>();
        try {
            abrirConexion();
            String sql = "select  month(fecha) Mes, COUNT(*) cantidad\n"
                    + "from orden\n"
                    + "where YEAR(fecha) = 2021\n"
                    + "Group by  month(fecha)";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {

                String mes = rs.getString("Mes");
                int cant = rs.getInt("cantidad");
                lista.add(new reporteGrafico(mes, cant));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<repGrafTopClientes> getReporteG2() {
        ArrayList<repGrafTopClientes> lista = new ArrayList<repGrafTopClientes>();
        try {
            abrirConexion();
            String sql = "select top 5 count(idUsuario) as cant , u.nombre\n"
                    + "from orden o join usuario u on o.idUsuario=u.id_usuario\n"
                    + "group by idUsuario , u.nombre\n"
                    + "order by  cant desc";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while (rs.next()) {

                int cant = rs.getInt("cant");
                String nom = rs.getString("nombre");
                lista.add(new repGrafTopClientes(cant, nom));

            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<reporteVentas> reporteVentas(int cl, int mod, String fecha1, String fecha2) {
        ArrayList<reporteVentas> lista = new ArrayList<reporteVentas>();
        try {
            abrirConexion();
            String sql = "select d.id , u.id_usuario ,u.nombre as 'Cliente',m.id_modelo, m.nombre as 'Modelo', o.fecha , o.total\n"
                    + "	from modelo m join detalle_Orden d on m.id_modelo=d.idModelo join  orden o on d.idOrden=o.id join usuario u on o.idUsuario=u.id_usuario\n"
                    + "	where 1=1";

            if (cl != 0) {
                sql = sql + " and u.id_usuario=" + cl;
            }
            if (mod != 0) {
                sql = sql + " and m.id_modelo =" + mod;
            } else {
                sql = sql;
            }
            if (fecha1 != null && !fecha1.equals("") && fecha2 != null && !fecha2.equals("")) {
                sql = sql + " and o.fecha between ? and ?";
            } else {
                sql = sql;
            }
//            String sql = "select d.id , u.nombre as 'Cliente', m.nombre as 'Modelo', o.fecha , o.total\n"
//                    + "from modelo m join detalle_Orden d on m.id_modelo=d.idModelo join  orden o on d.idOrden=o.id join usuario u on o.idUsuario=u.id_usuario\n"
//                    + "where u.id_usuario = " + cl + " and m.id_modelo = " + mod + " and o.fecha between " + fecha1 + "  AND " + fecha2;
            PreparedStatement st = con.prepareStatement(sql);
            if (fecha1 != null && !fecha1.equals("") && fecha2 != null && !fecha2.equals("")) {
                st.setString(1, fecha1);
                st.setString(2, fecha2);
            }

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int idU = rs.getInt("id_usuario");
                String cliente = rs.getString("Cliente");
                int idM = rs.getInt("id_modelo");
                String modelo = rs.getString("Modelo");
                String fecha = rs.getString("fecha");
                double total = rs.getInt("total");

                lista.add(new reporteVentas(id, idU, cliente, idM, modelo, fecha, total));
            }
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

}
