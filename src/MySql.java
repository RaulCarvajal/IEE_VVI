
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author raulrcg
 */
public class MySql {
    Connection conexion = null;
    Statement comando = null;
    ResultSet registro;

    public Connection MySQLConnect() {

        try {
            //Driver JDBC
            Class.forName("com.mysql.jdbc.Driver");
            //Nombre del servidor. localhost:3306 es la ruta y el puerto de la conexión MySQL
            //panamahitek_text es el nombre que le dimos a la base de datos
            String servidor = "jdbc:mysql://localhost:3306/ieen";
            //El root es el nombre de usuario por default. No hay contraseña
            String usuario = "root";
            String pass = "";
            //Se inicia la conexión
            conexion = DriverManager.getConnection(servidor, usuario, pass);

        } catch (ClassNotFoundException ex) {
            System.out.println("Error en la conexión a la base de datos: " + ex.getMessage());
            conexion = null;
        } catch (SQLException ex) {
            System.out.println("Error en la conexión a la base de datos: " + ex.getMessage());
            conexion = null;
        } catch (Exception ex) {
            System.out.println("Error en la conexión a la base de datos: " + ex.getMessage());
            conexion = null;
        } finally {
            System.out.println("Conexión Exitosa");
            return conexion;
        }
    }
}
