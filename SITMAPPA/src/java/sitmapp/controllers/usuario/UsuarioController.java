/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.usuario;

import sitmapp.models.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import sitmapp.controllers.database.JdbcConnect;

/**
 *
 * @author Jhon Baron
 */
public class UsuarioController {

    public static Usuario listEspecificUser(int id) {
        Usuario c = new Usuario();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select * "
                    + "from usuario where IdUsuario=" + id + "");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                c.setId_usuario(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setApellidos(rs.getString(3));
                c.setNombreUsuario(rs.getString(4));
                c.setContraseña(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setNumero_telefono(rs.getLong(7));
                c.setTipo_usuario(rs.getString(8));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public static void update(int id, Usuario usuario) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("update "
                    + " usuario set Nombre=?,Apellidos=?, NombreUsuario=?, Contraseña=?, Correo=?, Telefono=?, TipoUsuario=? where IdUsuario=" + id + ";");
            pst.setString(1, usuario.getNombre());
            pst.setString(2, usuario.getApellidos());
            pst.setString(3, usuario.getNombreUsuario());
            pst.setString(4, usuario.getContraseña());
            pst.setString(5, usuario.getEmail());
            pst.setLong(6, usuario.getNumero_telefono());
            pst.setString(7, usuario.getTipo_usuario());

            pst.executeUpdate();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static ArrayList<Usuario> ValidarUsuario() {
        ArrayList<Usuario> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("select Correo, Telefono, NombreUsuario,IdUsuario from usuario");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Usuario c = new Usuario();

                c.setEmail(rs.getString(1));
                c.setNumero_telefono(rs.getInt(2));
                c.setNombreUsuario(rs.getString(3));
                c.setId_usuario(rs.getInt(4));

                listado.add(c);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

    
    
    
    
    public static ArrayList<Usuario> list() {
        ArrayList<Usuario> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select * "
                    + "from usuario order by 8");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Usuario c = new Usuario();

                c.setId_usuario(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setApellidos(rs.getString(3));
                c.setNombreUsuario(rs.getString(4));
                c.setContraseña(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setNumero_telefono(rs.getLong(7));
                c.setTipo_usuario(rs.getString(8));

                listado.add(c);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

    //Añadir
    public static void save(Usuario user) throws ClassNotFoundException, SQLException {
        //id-nombre-apellidos-nomusuario-contraseña-correo-telefono-tipousuario-
        Connection connect = JdbcConnect.connect();
        PreparedStatement pst = connect.prepareStatement("Insert into "
                + " Usuario values(?,?,?,?,?,?,?,?)");
        pst.setNull(1, 0, "NULL");
        pst.setString(2, user.getNombre());
        pst.setString(3, user.getApellidos());
        pst.setString(4, user.getNombreUsuario());
        pst.setString(5, user.getContraseña());
        pst.setString(6, user.getEmail());
        pst.setLong(7, user.getNumero_telefono());
        pst.setString(8, user.getTipo_usuario());
        pst.executeUpdate();
    }

    //Listar Consultar
    public static Usuario Iniciar_Sesion(String Correo_NombreUsuario, String Contraseña) {
        Usuario pu = null;
        try {
            Connection connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("SELECT * FROM usuario where ((NombreUsuario ='" + Correo_NombreUsuario + "'or Correo='"
                    + Correo_NombreUsuario + "') and (Contraseña='" + Contraseña + "'))");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Usuario c = new Usuario();
                c.setId_usuario(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setApellidos(rs.getString(3));
                c.setNombreUsuario(rs.getString(4));
                c.setContraseña(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setNumero_telefono(rs.getLong(7));
                c.setTipo_usuario(rs.getString(8));
                pu = c;

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pu;
    }

    public static void delete(int id) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Delete from "
                    + "usuario where IdUsuario=?");
            pst.setInt(1, id);
            pst.executeUpdate();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
