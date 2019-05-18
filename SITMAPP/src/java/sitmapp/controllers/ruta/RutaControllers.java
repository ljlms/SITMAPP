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

    public static void saveParaderosRuta(int IdRuta, int IdParadas[]) {// Guarda los paraderos de las rutas
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
            PreparedStatement pst = connect.prepareStatement("Select r.IdRuta, r.NombreRuta, r.TipoRuta, p.IdParada, p.Nombre, P.Ubicacion_Latitud, p.Ubicacion_Longitud, p.Tipo,\n"
                    + "r.HorarioLunes_Viernes, r.HorarioSabado, r.HorarioDomingo \n"
                    + "from ruta as r, parada as p, ruta_parada as rp where (r.IdRuta = rp.IdRuta) and (p.IdParada = rp.IdParada);");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Ruta c = new Ruta();
                Parada parada = new Parada();
                c.setId_ruta(rs.getInt(1));
                c.setNombre_Ruta(rs.getString(2));
                c.setTipo_Ruta(rs.getString(3));
//
//                parada.setIdParada(rs.getInt(4));
//                parada.setNombre(rs.getString(5));
//                parada.setLatitud(rs.getDouble(6));
//                parada.setLongitud(rs.getDouble(7));
//                parada.setTipo(rs.getString(8));
//
////                c.getParadas().add(parada);

                c.setLunes_viernes(rs.getString(9));
                c.setSabado(rs.getString(10));
                c.setDomingo_festivo(rs.getString(11));
                listado.add(c);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

}
