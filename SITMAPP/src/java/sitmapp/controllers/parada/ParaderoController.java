/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.parada;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sitmapp.controllers.database.JdbcConnect;
import sitmapp.models.Parada;


/**
 *
 * @author Jhon Baron
 */
public class ParaderoController {

    //Añadir
    public static void save(Parada parada) throws ClassNotFoundException, SQLException {
        Connection connect = JdbcConnect.connect();
        PreparedStatement pst = connect.prepareStatement("Insert into "
                + " parada values(?,?,?,?,?)");
        pst.setNull(1, 0, "NULL");
        pst.setString(2, parada.getNombre());
        pst.setDouble(3, parada.getLatitud());
        pst.setDouble(4, parada.getLongitud());
        pst.setString(5, parada.getTipo());
        pst.executeUpdate();
    }

    public static void update(int id, Parada parada) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("update "
                    + "parada set Nombre=?, Ubicacion_Latitud=?, Ubicacion_Longitud=?, Tipo=? where IdParada=" + id + "");

            pst.setString(1, parada.getNombre());
            pst.setDouble(2, parada.getLatitud());
            pst.setDouble(3, parada.getLongitud());
            pst.setString(4, parada.getTipo());

            pst.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Parada.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void delete(int id) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Delete from "
                    + "parada where IdParada=?");
            pst.setInt(1, id);
            pst.executeUpdate();
            
            PreparedStatement pst2 = connect.prepareStatement("Delete from "
                    + "ruta_parada where IdParada=?");
            pst2.setInt(1, id);
            pst2.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Parada.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static ArrayList<Parada> list() {
        ArrayList<Parada> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select * "
                    + "from parada order by 5");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {

                Parada c = new Parada();

                c.setIdParada(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setLatitud(rs.getDouble(3));
                c.setLongitud(rs.getDouble(4));
                c.setTipo(rs.getString(5));

                listado.add(c);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Parada.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

}
