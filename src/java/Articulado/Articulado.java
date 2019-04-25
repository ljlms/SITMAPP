/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Articulado;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import jdbcsitmapp.db.JdbcConnect;

/**
 *
 * @author E201
 */
public class Articulado {

    private int IdArticulado = 0;
    private String Codigo_Articulado = "NO ASIGNADO";
    private String Placa = "NO ASIGNADO";
    private String Estado = "NO ASIGNADO";
    private String Ubicacion_Latitud = "NO ASIGNADO";
    private String Ubicacion_Longitud = "NO ASIGNADO";
    private String Nombre_Empresa = "NO ASIGNADO";
    private int empresa_IdEmpresa = 0;
    private int ruta_IdRuta = 0;
    private int conductor_Idconductor = 0;

    public Articulado() {
    }

    public Articulado(String Codigo_Articulado, String Placa, String Nombre_Empresa, int empresa_IdEmpresa) {
        this.Codigo_Articulado = Codigo_Articulado;
        this.Placa = Placa;
        this.Nombre_Empresa = Nombre_Empresa;
        this.empresa_IdEmpresa = empresa_IdEmpresa;
    }

    public Articulado(String Codigo_Articulado, String Placa, String Nombre_Empresa, int id, String Estado) {
        this.Codigo_Articulado = Codigo_Articulado;
        this.Placa = Placa;
        this.Nombre_Empresa = Nombre_Empresa;
        this.IdArticulado = id;
        this.Estado = Estado;
    }

    public int getIdArticulado() {
        return IdArticulado;
    }

    public void setIdArticulado(int IdArticulado) {
        this.IdArticulado = IdArticulado;
    }

    public String getPlaca() {
        return Placa;
    }

    public void setPlaca(String Placa) {
        this.Placa = Placa;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getUbicacion_Latitud() {
        return Ubicacion_Latitud;
    }

    public void setUbicacion_Latitud(String Ubicacion_Latitud) {
        this.Ubicacion_Latitud = Ubicacion_Latitud;
    }

    public String getUbicacion_Longitud() {
        return Ubicacion_Longitud;
    }

    public void setUbicacion_Longitud(String Ubicacion_Longitud) {
        this.Ubicacion_Longitud = Ubicacion_Longitud;
    }

    public int getEmpresa_IdEmpresa() {
        return empresa_IdEmpresa;
    }

    public void setEmpresa_IdEmpresa(int empresa_IdEmpresa) {
        this.empresa_IdEmpresa = empresa_IdEmpresa;
    }

    public int getRuta_IdRuta() {
        return ruta_IdRuta;
    }

    public void setRuta_IdRuta(int ruta_IdRuta) {
        this.ruta_IdRuta = ruta_IdRuta;
    }

    public int getConductor_Idconductor() {
        return conductor_Idconductor;
    }

    public void setConductor_Idconductor(int conductor_Idconductor) {
        this.conductor_Idconductor = conductor_Idconductor;
    }

    public String getNombre_Empresa() {
        return Nombre_Empresa;
    }

    public void setNombre_Empresa(String Nombre_Empresa) {
        this.Nombre_Empresa = Nombre_Empresa;
    }

    public String getCodigo_Articulado() {
        return Codigo_Articulado;
    }

    public void setCodigo_Articulado(String Codigo_Articulado) {
        this.Codigo_Articulado = Codigo_Articulado;
    }

    /*
    idarticulado
    codigo_articulado
    placa
    estado
    empresa_idempresa
    nombre_empresa
    ubicacion_latitud
    ubicacion_longitud
    conductor_idconductor
    ruta_idruta
     */
    //Añadir
    public static void save(Articulado articulado) {
        //id-nombre-apellidos-nomusuario-contraseña-correo-telefono-tipousuario-
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
            /*
            idarticulado
            codigo_articulado
            placa
            estado
            empresa_idempresa
            nombre_empresa
            ubicacion_latitud
            ubicacion_longitud
            conductor_idconductor
            ruta_idruta
             */
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
