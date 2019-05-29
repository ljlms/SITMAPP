/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.ruta;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

    public static void updateRuta(int id, Ruta ruta) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("update "
                    + "ruta set NombreRuta=?, TipoRuta=?, HorarioLunes_Viernes=?, HorarioSabado=?, HorarioDomingo=?"
                    + " where IdRuta=" + id + "");

            pst.setString(1, ruta.getNombre_Ruta());
            pst.setString(2, ruta.getTipo_Ruta());
            pst.setString(3, ruta.getLunes_viernes());
            pst.setString(4, ruta.getSabado());
            pst.setString(5, ruta.getDomingo_festivo());

            pst.executeUpdate();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public static ArrayList<Ruta> list() {//listar ruta con sus
        ArrayList<Ruta> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("select * from Ruta order by 2;");
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
            PreparedStatement pst = connect.prepareStatement("select p.Nombre from parada as p,  ruta_parada as rp where (p.IdParada = rp.IdParada) and (rp.IdRuta= " + id + ")");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                listado.add(rs.getString(1));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

    public static ArrayList<Parada> listTodasParadas() {//listar todas las paradas registradas-asignadas
        ArrayList<Parada> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("select * from parada;");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Parada parada = new Parada();

                parada.setIdParada(rs.getInt(1));
                parada.setNombre(rs.getString(2));
                parada.setTipo(rs.getString(5));

                listado.add(parada);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Parada.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listado;
    }

    public static ArrayList<Parada> ParadasDiferentes(ArrayList<Parada> paradas_asignadas, ArrayList<Parada> paradas) {
        ArrayList<Parada> listado = new ArrayList<>();
        String p_asignadas = "";
        for (Parada paradas_asignada : paradas_asignadas) {
            p_asignadas = p_asignadas + "-" + paradas_asignada.getNombre();
        }
        String v_split[] = p_asignadas.split("-");
        for (Parada parada : paradas) {
            if (!con(v_split, parada.getNombre())) {
                listado.add(parada);
                System.out.println("--> " + parada.getNombre());
            }
        }
        return listado;
    }

    public static boolean con(String arreglo[], String nombre) {
        int i = 0;
        boolean respuesta = false;
        for (String p : arreglo) {
            if (p.equalsIgnoreCase(nombre)) {
                respuesta = true;
            }
        }
        return respuesta;
    }

    public static ArrayList<String> listParadasDiferentes(int id) {//listar paradas de una ruta en especifica
        ArrayList<String> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("select p.nombre from ruta_parada as rp, parada as p where (rp.idruta = '" + id + "') and (rp.idparada <> p.idparada) group by p.nombre;");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                listado.add(rs.getString(1));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

    public static void delete(int id) {
        Connection connect;
        try {

            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Delete from "
                    + "ruta where IdRuta=?");
            pst.setInt(1, id);
            pst.executeUpdate();

            PreparedStatement pst2 = connect.prepareStatement("Delete from "
                    + "ruta_parada where IdRuta=?");
            pst2.setInt(1, id);
            pst2.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Parada.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /////////////////////////////ZONA PONTON///////////////////////////////////////////////
    public static Ruta BusquedaRuta(int id) {// Regresa el Id de la Ruta
        Ruta ruta = null;
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select * "
                    + "from ruta where IdRuta=?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                ruta = new Ruta();
                ruta.setId_ruta(rs.getInt(1));
                ruta.setNombre_Ruta(rs.getString(2));
                ruta.setTipo_Ruta(rs.getString(3));
                ruta.setLunes_viernes(rs.getString(4));
                ruta.setSabado(rs.getString(5));
                ruta.setDomingo_festivo(rs.getString(6));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ruta;
    }

//    select datos.IdParada from parada as paradas,  ruta_parada as datos where (paradas.IdParada = datos.IdParada) and (datos.IdRuta=12);
    public static ArrayList<Parada> BusquedaParadasDeRutaEspecifica(int id) {//listar paradas de una ruta en especifica
        ArrayList<Parada> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("select datos.IdParada, paradas.Nombre from parada as paradas,"
                    + "  ruta_parada as datos where (paradas.IdParada = datos.IdParada) and (datos.IdRuta=" + id + ")");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Parada resulta = new Parada();
                resulta.setIdParada(rs.getInt(1));
                resulta.setNombre(rs.getString(2));
                listado.add(resulta);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Ruta.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

    public static void BorrarParaderoRutaEspecifica(int idRuta, int IdParada) {
        Connection connect;
        try {

            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("delete from ruta_parada where"
                    + " (IdParada = " + IdParada + ") and (IdRuta=" + idRuta + ")");
            pst.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Parada.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
