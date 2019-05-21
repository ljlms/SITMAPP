/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.empresa;
import sitmapp.models.Empresa;
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
 * @author MANUEL PONTON RICO
 */
public class EmpresaController {
    
    public static ArrayList<Empresa> list() {
        ArrayList<Empresa> listado = new ArrayList<>();
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Select * "
                    + "from empresa order by 2");
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Empresa c = new Empresa();
                c.setIdEmpresa(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setDescripcion(rs.getString(3));
                listado.add(c);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Empresa.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Empresa.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listado;
    }
    //Añadir
    public static void save(Empresa empresa) {
        //id-nombre-apellidos-nomusuario-contraseña-correo-telefono-tipousuario-
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("Insert into "
                    + "empresa values(?,?,?)");
            pst.setInt(1, empresa.getIdEmpresa());
            pst.setString(2, empresa.getNombre());
            pst.setString(3, empresa.getDescripcion());
            pst.executeUpdate();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Empresa.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Empresa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void update(int nit, Empresa empresa) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            PreparedStatement pst = connect.prepareStatement("update "
                    + "empresa set IdEmpresa=?, Nombre=?, Descripcion=? where IdEmpresa=" + nit + "");
            
            pst.setInt(1, empresa.getIdEmpresa());
            pst.setString(2, empresa.getNombre());
            pst.setString(3, empresa.getDescripcion());

            pst.executeUpdate();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Empresa.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Empresa.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void delete(Empresa empresa) {
        Connection connect;
        try {
            connect = JdbcConnect.connect();
            //Si se elimina una empresa, sus articulados también.
            PreparedStatement consulta_a = connect.prepareStatement("select idArticulado from articulado where Id_Empresa="
                    + "'" + empresa.getIdEmpresa() + "';");

            ResultSet rs = consulta_a.executeQuery();
            ArrayList<Integer> n = new ArrayList();
            while (rs.next()) {
                n.add(rs.getInt(1));
            }
            PreparedStatement pst2;
            for (Integer m : n) {
                pst2 = connect.prepareStatement("Delete from "
                        + " articulado where IdArticulado="
                        + m + "");
                pst2.executeUpdate();
            }
            //Elimina la empresa.
            PreparedStatement pst = connect.prepareStatement("Delete from "
                    + "empresa where IdEmpresa=?");
            pst.setInt(1, empresa.getIdEmpresa());
            pst.executeUpdate();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Empresa.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Empresa.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

        public static String NombreEmpresa(int IdEmpresa) {
        String nombre = "";
        for (Empresa e : list()) {
            if (e.getIdEmpresa() == IdEmpresa) {

                return e.getNombre();
            }

        }
        return nombre;
    }
    
    
}
