

package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
public class Conexion {
    
    Connection enlazar = null;


    public Connection conectar()
    {
        try 
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            enlazar = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-E50Q2OQ:1433;databaseName=Unique3D","sa","123456789");
        } 
        catch (Exception ex) 
        {
            ex.printStackTrace();
        }
        return enlazar;
    }
}
