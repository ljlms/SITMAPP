/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author MANUEL PONTON RICO
 */
@Entity
@Table(name = "articulado")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Articulado.findAll", query = "SELECT a FROM Articulado a")
    , @NamedQuery(name = "Articulado.findByIdArticulado", query = "SELECT a FROM Articulado a WHERE a.idArticulado = :idArticulado")
    , @NamedQuery(name = "Articulado.findByCodigoArticulado", query = "SELECT a FROM Articulado a WHERE a.codigoArticulado = :codigoArticulado")
    , @NamedQuery(name = "Articulado.findByPlaca", query = "SELECT a FROM Articulado a WHERE a.placa = :placa")
    , @NamedQuery(name = "Articulado.findByEstado", query = "SELECT a FROM Articulado a WHERE a.estado = :estado")
    , @NamedQuery(name = "Articulado.findByIdEmpresa", query = "SELECT a FROM Articulado a WHERE a.idEmpresa = :idEmpresa")
    , @NamedQuery(name = "Articulado.findByNombreEmpresa", query = "SELECT a FROM Articulado a WHERE a.nombreEmpresa = :nombreEmpresa")
    , @NamedQuery(name = "Articulado.findByUbicacionLatitud", query = "SELECT a FROM Articulado a WHERE a.ubicacionLatitud = :ubicacionLatitud")
    , @NamedQuery(name = "Articulado.findByUbicacionLongitud", query = "SELECT a FROM Articulado a WHERE a.ubicacionLongitud = :ubicacionLongitud")
    , @NamedQuery(name = "Articulado.findByIdConductor", query = "SELECT a FROM Articulado a WHERE a.idConductor = :idConductor")
    , @NamedQuery(name = "Articulado.findByIdRuta", query = "SELECT a FROM Articulado a WHERE a.idRuta = :idRuta")})
public class Articulado implements Serializable {

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "articulado")
    private Historialconductor historialConductor;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdArticulado")
    private Integer idArticulado;
    @Column(name = "Codigo_Articulado")
    private String codigoArticulado;
    @Basic(optional = false)
    @Column(name = "Placa")
    private String placa;
    @Basic(optional = false)
    @Column(name = "Estado")
    private String estado;
    @Basic(optional = false)
    @Column(name = "Id_Empresa")
    private int idEmpresa;
    @Basic(optional = false)
    @Column(name = "Nombre_Empresa")
    private String nombreEmpresa;
    @Column(name = "Ubicacion_Latitud")
    private String ubicacionLatitud;
    @Column(name = "Ubicacion_Longitud")
    private String ubicacionLongitud;
    @Basic(optional = false)
    @Column(name = "Id_Conductor")
    private int idConductor;
    @Basic(optional = false)
    @Column(name = "Id_Ruta")
    private int idRuta;

    public Articulado() {
    }

    public Articulado(Integer idArticulado) {
        this.idArticulado = idArticulado;
    }

    public Articulado(Integer idArticulado, String placa, String estado, int idEmpresa, String nombreEmpresa, int idConductor, int idRuta) {
        this.idArticulado = idArticulado;
        this.placa = placa;
        this.estado = estado;
        this.idEmpresa = idEmpresa;
        this.nombreEmpresa = nombreEmpresa;
        this.idConductor = idConductor;
        this.idRuta = idRuta;
    }

    public Integer getIdArticulado() {
        return idArticulado;
    }

    public void setIdArticulado(Integer idArticulado) {
        this.idArticulado = idArticulado;
    }

    public String getCodigoArticulado() {
        return codigoArticulado;
    }

    public void setCodigoArticulado(String codigoArticulado) {
        this.codigoArticulado = codigoArticulado;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getUbicacionLatitud() {
        return ubicacionLatitud;
    }

    public void setUbicacionLatitud(String ubicacionLatitud) {
        this.ubicacionLatitud = ubicacionLatitud;
    }

    public String getUbicacionLongitud() {
        return ubicacionLongitud;
    }

    public void setUbicacionLongitud(String ubicacionLongitud) {
        this.ubicacionLongitud = ubicacionLongitud;
    }

    public int getIdConductor() {
        return idConductor;
    }

    public void setIdConductor(int idConductor) {
        this.idConductor = idConductor;
    }

    public int getIdRuta() {
        return idRuta;
    }

    public void setIdRuta(int idRuta) {
        this.idRuta = idRuta;
    }

 
  
    public Historialconductor getHistorialConductor() {
        return historialConductor;
    }

    public void setHistorialConductor(Historialconductor historialConductor) {
        this.historialConductor = historialConductor;
    }

}
