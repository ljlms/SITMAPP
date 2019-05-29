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

    public static ArrayList<Articulado> ArticuladoRutaEspecifica(int id) {
        ArrayList<Articulado> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select * "
                    + "from articulado where Id_Ruta=" + id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Articulado articulado = new Articulado();
                articulado.setIdArticulado(rs.getInt(1));
                articulado.setCodigo_Articulado(rs.getString(2));
                articulado.setPlaca(rs.getString(3));
                articulado.setEstado(rs.getString(4));
                articulado.setEmpresa_IdEmpresa(rs.getInt(5));
                articulado.setNombre_Empresa(rs.getString(6));
                articulado.setUbicacion_Latitud(rs.getDouble(7));
                articulado.setUbicacion_Longitud(rs.getDouble(8));
                articulado.setConductor_Idconductor(rs.getInt(9));
                articulado.setRuta_IdRuta(rs.getInt(10));
                
                listado.add(articulado);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }

    public static Articulado ArticuladoEspecificoConductor(int id) {
        Articulado articulado = new Articulado();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select * "
                    + "from articulado where Id_Conductor=" + id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                articulado.setIdArticulado(rs.getInt(1));
                articulado.setCodigo_Articulado(rs.getString(2));
                articulado.setPlaca(rs.getString(3));
                articulado.setEstado(rs.getString(4));
                articulado.setEmpresa_IdEmpresa(rs.getInt(5));
                articulado.setNombre_Empresa(rs.getString(6));
                articulado.setUbicacion_Latitud(rs.getDouble(7));
                articulado.setUbicacion_Longitud(rs.getDouble(8));
                articulado.setConductor_Idconductor(rs.getInt(9));
                articulado.setRuta_IdRuta(rs.getInt(10));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }

        return articulado;
    }

    public static Boolean VerificarActividad(int id) {
        boolean activo = false;
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select Id_Conductor "
                    + "from articulado where Id_conductor =" + id + ";");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                System.out.println("Entra a while");
                activo = true;
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("ACTIVO RETURN: " + activo);
        return activo;
    }

    public static void FinalizarLocalizacion(int id) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("update "
                    + " articulado set Estado=?,Ubicacion_Latitud=?, Ubicacion_Longitud=?, Id_Conductor=?,"
                    + "Id_Ruta=?  where IdArticulado=" + id + ";");
            pst.setString(1, "NO ASIGNADO");
            pst.setDouble(2, 0);
            pst.setDouble(3, 0);
            pst.setInt(4, 0);
            pst.setInt(5, 0);
            pst.executeUpdate();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void AsignarRutaConductor(int IdConductor, int IdArticulado, int IdRuta) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("update "
                    + " articulado set Estado=?,Id_Conductor=?, Id_Ruta=? where IdArticulado=" + IdArticulado + ";");

            pst.setString(1, "ASIGNADO");
            pst.setInt(2, IdConductor);
            pst.setInt(3, IdRuta);
            pst.executeUpdate();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void updateLocation(int id, double lat, double lng) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("update "
                    + " articulado set Ubicacion_Latitud=?,Ubicacion_Longitud=? where IdArticulado=" + id + ";");
            pst.setDouble(1, lat);
            pst.setDouble(2, lng);
            pst.executeUpdate();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Articulado.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

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
            pst.setDouble(7, articulado.getUbicacion_Latitud());
            pst.setDouble(8, articulado.getUbicacion_Longitud());
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
                c.setUbicacion_Latitud(rs.getDouble(7));
                c.setUbicacion_Longitud(rs.getDouble(8));
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
