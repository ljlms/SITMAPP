/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.articulado;

import sitmapp.models.Articulado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sitmapp.controllers.database.JdbcConnect;

public class ArticuladoController {

    public static void save(Articulado articulado) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Insert into "
                    + "articulado values(?,?,?,?,?,?,?,?,?,?)");
            pst.setNull(1, 0, "NULL");
            pst.setString(2, articulado.getCodigo_Articulado());
            pst.setString(3, articulado.getPlaca());
            pst.setString(4, articulado.getEstado());
            pst.setInt(5, articulado.getEmpresa_IdEmpresa());
            pst.setString(6, articulado.getNombre_Empresa());
            System.out.println("NOMBRE EMPRESA: " + articulado.getNombre_Empresa());
            pst.setString(7, articulado.getUbicacion_Latitud());
            pst.setString(8, articulado.getUbicacion_Longitud());
            pst.setInt(9, articulado.getConductor_Idconductor());
            pst.setInt(10, articulado.getRuta_IdRuta());
            pst.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void update(int id, Articulado articulado) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("update "
                    + " articulado set Placa=?,Codigo_Articulado=?, Nombre_Empresa=? where IdArticulado=" + id + ";");
            pst.setString(1, articulado.getPlaca());
            pst.setString(2, articulado.getCodigo_Articulado());
            pst.setString(3, articulado.getNombre_Empresa());
            pst.executeUpdate();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void delete(Articulado articulado) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Delete from "
                    + "articulado where IdArticulado=?");
            pst.setInt(1, articulado.getIdArticulado());
            pst.executeUpdate();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static ArrayList<Articulado> list() {
        ArrayList<Articulado> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select * "
                    + "from articulado order by 2");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Articulado c = new Articulado();

                c.setIdArticulado(rs.getInt(1));
                c.setCodigo_Articulado(rs.getString(2));
                c.setPlaca(rs.getString(3));
                c.setEstado(rs.getString(4));
                c.setEmpresa_IdEmpresa(rs.getInt(5));
                c.setNombre_Empresa(rs.getString(6));
                c.setUbicacion_Latitud(rs.getString(7));
                c.setUbicacion_Longitud(rs.getString(8));
                c.setConductor_Idconductor(rs.getInt(9));
                c.setRuta_IdRuta(rs.getInt(10));

                listado.add(c);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }
}
