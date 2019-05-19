/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.ruta;

import Empresa.Empresa;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sitmapp.controllers.database.JdbcConnect;
import sitmapp.models.Parada;
import sitmapp.models.Ruta;

/**
 *
 * @author Jhon Baron
 */
public class RutaControllers {

    public static void saveRuta(Ruta ruta) {//Guarda Ruta
        //id-nombre-apellidos-nomusuario-contraseña-correo-telefono-tipousuario-
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Insert into "
                    + "ruta values(?,?,?,?,?,?)");
            pst.setNull(1, 0, "NULL");
            pst.setString(2, ruta.getNombre_Ruta());
            pst.setString(3, ruta.getTipo_Ruta());
            pst.setString(4, ruta.getLunes_viernes());
            pst.setString(5, ruta.getSabado());
            pst.setString(6, ruta.getDomingo_festivo());
            pst.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void saveParaderosRuta(int IdRuta, int IdParadas[]) {// Guarda los paraderos de las rutas --> Ruta_Parada
        //id-nombre-apellidos-nomusuario-contraseña-correo-telefono-tipousuario-
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Insert into "
                    + "ruta_parada values(?,?)");
            for (int IdParada : IdParadas) {
                pst.setInt(1, IdRuta);
                pst.setInt(2, IdParada);
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static int IdRutaBack(String nom) {// Regresa el Id de la Ruta
        int id = 0;
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select IdRuta "
                    + "from ruta where NombreRuta=?");
            pst.setString(1, nom);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Empresa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public static ArrayList<Ruta> list() {//listar ruta con sus
        ArrayList<Ruta> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("select * from Ruta");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Ruta c = new Ruta();

                c.setId_ruta(rs.getInt(1));
                c.setNombre_Ruta(rs.getString(2));
                c.setTipo_Ruta(rs.getString(3));
                c.setLunes_viernes(rs.getString(4));
                c.setSabado(rs.getString(5));
                c.setDomingo_festivo(rs.getString(6));
                listado.add(c);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

    public static ArrayList<String> listParada(int id) {//listar paradas de una ruta en especifica
        ArrayList<String> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("select p.Nombre from parada as p,  ruta_parada as rp where (p.IdParada = rp.IdParada) and (rp.IdRuta= "+id+")");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                listado.add(rs.getString(1));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

}
