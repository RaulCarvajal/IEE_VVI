/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author raulrcg
 */
public class MetodosDB {
    
    Conexion conn;
    public MetodosDB(){
        conn = new Conexion();
    }
    
    //Metodos insertar
    //Insertar personal
    public boolean insertar_personal(String nom,String ap,String am,String rfc,Date fecn,String tel,String call,String col,String cp,String nl,String nc,String te,String a){
        try {
            
            String sql="INSERT INTO `personal`(`nombrePersonal`, `apellidoPaterno`, `apellidoMaterno`, `calle`, `colonia`, `codigoPostal`, `telefono`, `fechaNac`, `rfc`, `nolic`, `nocred`, `nombreArea`, `tipoPuesto`, `usuarios_idusuarios`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

            Connection con=conn.getConexion();
            
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, nom);
            pst.setString(2, ap);
            pst.setString(3, am);
            pst.setString(4, call);
            pst.setString(5, col);
            pst.setString(6, cp);
            pst.setString(7,tel);
            pst.setDate(8, fecn);
            pst.setString(9,rfc);
            pst.setString(10, nl);
            pst.setString(11,nc);
            pst.setString(12, a);
            pst.setString(13,te);
            pst.setInt(14,lastIdUser());
            
            pst.executeUpdate();
            
            con.close();
  
        } catch (SQLException ex) {
            Logger.getLogger(MetodosDB.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            return true;
        }
    }
    
    //Insertar usuario, es necesario primero ingresar al usuario para poder insertar al personal
    public boolean insertar_usuario(String nu,String ps,int ti){
        try {
            
            String sql ="INSERT INTO usuarios (nombreUsuario,password,tipoUsuario,status) VALUES (?,?,?,'Activo');";
            Connection con=conn.getConexion();
            PreparedStatement pst = con.prepareStatement(sql);
          
            pst.setString(1, nu);
            pst.setString(2, ps);
            pst.setInt(3,ti);
            pst.executeUpdate();
            
            con.close();

        } catch (SQLException ex) {
            return false;
        }finally{
            return true;
        }
    }
    
    
    //UPDATES
    //Actualizar personal
    public boolean update_personal(int idp, String nom,String ap,String am,String rfc,long fecn,String tel,String call,String col,String cp,String nl,String nc,String te,String a){
        try {
            java.sql.Date sqlDate;
            sqlDate = new java.sql.Date(fecn);
            
            String sqlpersonal = "UPDATE personal SET nombrePersonal=?,apellidoPaterno=?,apellidoMaterno=?,"
                               + "calle=?,colonia=?,codigoPostal=?,telefono=?,fechaNac=?,rfc=?,nolic=?,nocred=?,"
                               + "nombreArea=?,tipoPuesto=? WHERE idpersonal="+idp+";";
            Connection con=conn.getConexion();
            PreparedStatement pst = con.prepareStatement(sqlpersonal);
            pst.setString(1, nom);
            pst.setString(2, ap);
            pst.setString(3, am);
            pst.setString(4, call);
            pst.setString(5, col);
            pst.setString(6, cp);
            pst.setString(7,tel);
            pst.setDate(8, sqlDate);
            pst.setString(9,rfc);
            pst.setString(10, nl);
            pst.setString(11,nc);
            pst.setString(12, a);
            pst.setString(13,te);
            
            pst.executeUpdate();
            
            con.close();
  
        } catch (SQLException ex) {
            Logger.getLogger(MetodosDB.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            return true;
        }
    }
    
    //Actualizar usuario
    public boolean update_usuario(int idu,String nu,String ps,int ti,String status){
        try {
            
            String sql ="UPDATE usuarios "
                      + "SET nombreUsuario=?,password=?,tipoUsuario=?,status=\"Activo\" WHERE = idusuarios = "+idu+";";
            Connection con=conn.getConexion();
            PreparedStatement pst = con.prepareStatement(sql);
          
            pst.setString(1, nu);
            pst.setString(2, ps);
            pst.setInt(3,ti);
            pst.executeUpdate();
            
            con.close();

        } catch (SQLException ex) {
            return false;
        }finally{
            return true;
        }
    }
    
    //Delete 
    //Seria update al campo de activo/inactivo
    public boolean eliminar_usuario(String nu){
        try {
            
            String sql ="UPDATE usuarios "
                      + "SET status=\"Inactivo\" WHERE = nombreUsuario = "+nu+";";
            Connection con=conn.getConexion();
            PreparedStatement pst = con.prepareStatement(sql);
            pst.executeQuery(sql);
            
            con.close();

        } catch (SQLException ex) {
            return false;
        }finally{
            return true;
        }
    }
    
    //Recuperaciones
    //Traer un solo usuario por nombre de usuario
    public ResultSet getUsuario(String usu){
        try{
            Connection con = conn.getConexion();
            Statement s =  con.createStatement();
            
            String sql="select * from usuarios where nombreUsuario =\""+usu+"\"";
            ResultSet r = s.executeQuery(sql);
            s.close();
            boolean found = false;
            while(r.next()){ 
                found=true; 
            }
            if(found){return r;}else{return null;}
        }catch(SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    //Traer un solo elemento de personal dependiendo de que antes se ejecuto la 
    //funcion getUsuario para tener un lugar de donde obtener el idusuario para
    //realizar la consulta
    public ResultSet getPersonal(int idusu){
        try{
            Connection con = conn.getConexion();
            Statement s =  con.createStatement();
            
            String sql="select * from personal where usuarios_idusuarios = "+idusu+";";
            ResultSet r = s.executeQuery(sql);
            s.close();
            boolean found = false;
            while(r.next()){ 
                found=true; 
            }
            if(found){return r;}else{return null;}
        }catch(SQLException e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    //obtener el ultimo  id de usuario insertado para la funcion insertar personal
    private int lastIdUser(){
        int lastid=0;
        try{
            Connection con = conn.getConexion();
            Statement s =  con.createStatement();
            
            String sql="select idusuarios from usuarios order by idusuarios desc limit 1; ";
            ResultSet r = s.executeQuery(sql);
            
            while(r.next()){ 
                lastid=r.getInt("idusuarios");
            }
            return lastid;
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
            return -1;
        }
    }
    
}