/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.noticia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sitmapp.controllers.database.JdbcConnect;
import sitmapp.models.Empresa;
import sitmapp.models.Noticia;

/**
 *
 * @author Jhon Baron
 */
public class NoticiaController {

     public static void update(int id, Noticia noticia) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("update "
                    + " noticia set Titulo=?,Contenido=?, Fecha=?, Id_Usuario=? where IdNoticia=" + id + ";");
            pst.setString(1, noticia.getTitulo());
            pst.setString(2, noticia.getContenido());
            pst.setString(3, noticia.getFecha());
            pst.setInt(4, noticia.getIdUsuario());

            pst.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Noticia.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public static void save(Noticia notica) {
        //id-nombre-apellidos-nomusuario-contraseña-correo-telefono-tipousuario-
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Insert into "
                    + "noticia values(?,?,?,?,?)");
            pst.setNull(1, 0, "NULL");
            pst.setString(2, notica.getTitulo());
            pst.setString(3, notica.getContenido());
            pst.setString(4, notica.getFecha());
            pst.setInt(5, notica.getIdUsuario());
            pst.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Noticia.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Noticia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      public static ArrayList<Noticia> list() {
        ArrayList<Noticia> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select * "
                    + "from noticia order by 4");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Noticia c = new Noticia();
                c.setId(rs.getInt(1));
                c.setTitulo(rs.getString(2));
                c.setContenido(rs.getString(3));
                c.setFecha(rs.getString(4));
                c.setIdUsuario(rs.getInt(5));
                listado.add(c);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Noticia.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Noticia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }
      public static void delete(int id) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Delete from "
                    + "noticia where IdNoticia=?");
            pst.setInt(1, id);
            pst.executeUpdate();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Noticia.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Noticia.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
