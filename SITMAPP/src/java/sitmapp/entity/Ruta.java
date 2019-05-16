/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author MANUEL PONTON RICO
 */
@Entity
@Table(name = "ruta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ruta.findAll", query = "SELECT r FROM Ruta r")
    , @NamedQuery(name = "Ruta.findByIdRuta", query = "SELECT r FROM Ruta r WHERE r.idRuta = :idRuta")
    , @NamedQuery(name = "Ruta.findByNombreRuta", query = "SELECT r FROM Ruta r WHERE r.nombreRuta = :nombreRuta")
    , @NamedQuery(name = "Ruta.findByTiporuta", query = "SELECT r FROM Ruta r WHERE r.tiporuta = :tiporuta")
    , @NamedQuery(name = "Ruta.findByHorarioLunesViernes", query = "SELECT r FROM Ruta r WHERE r.horarioLunesViernes = :horarioLunesViernes")
    , @NamedQuery(name = "Ruta.findByHorarioSabado", query = "SELECT r FROM Ruta r WHERE r.horarioSabado = :horarioSabado")
    , @NamedQuery(name = "Ruta.findByHorarioDomingo", query = "SELECT r FROM Ruta r WHERE r.horarioDomingo = :horarioDomingo")})
public class Ruta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IdRuta")
    private Integer idRuta;
    @Basic(optional = false)
    @Column(name = "NombreRuta")
    private String nombreRuta;
    @Column(name = "Tipo ruta")
    private String tiporuta;
    @Basic(optional = false)
    @Lob
    @Column(name = "Paraderos")
    private String paraderos;
    @Column(name = "HorarioLunes_Viernes")
    private String horarioLunesViernes;
    @Column(name = "HorarioSabado")
    private String horarioSabado;
    @Column(name = "HorarioDomingo")
    private String horarioDomingo;

    public Ruta() {
    }

    public Ruta(Integer idRuta) {
        this.idRuta = idRuta;
    }

    public Ruta(Integer idRuta, String nombreRuta, String paraderos) {
        this.idRuta = idRuta;
        this.nombreRuta = nombreRuta;
        this.paraderos = paraderos;
    }

    public Integer getIdRuta() {
        return idRuta;
    }

    public void setIdRuta(Integer idRuta) {
        this.idRuta = idRuta;
    }

    public String getNombreRuta() {
        return nombreRuta;
    }

    public void setNombreRuta(String nombreRuta) {
        this.nombreRuta = nombreRuta;
    }

    public String getTiporuta() {
        return tiporuta;
    }

    public void setTiporuta(String tiporuta) {
        this.tiporuta = tiporuta;
    }

    public String getParaderos() {
        return paraderos;
    }

    public void setParaderos(String paraderos) {
        this.paraderos = paraderos;
    }

    public String getHorarioLunesViernes() {
        return horarioLunesViernes;
    }

    public void setHorarioLunesViernes(String horarioLunesViernes) {
        this.horarioLunesViernes = horarioLunesViernes;
    }

    public String getHorarioSabado() {
        return horarioSabado;
    }

    public void setHorarioSabado(String horarioSabado) {
        this.horarioSabado = horarioSabado;
    }

    public String getHorarioDomingo() {
        return horarioDomingo;
    }

    public void setHorarioDomingo(String horarioDomingo) {
        this.horarioDomingo = horarioDomingo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idRuta != null ? idRuta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ruta)) {
            return false;
        }
        Ruta other = (Ruta) object;
        if ((this.idRuta == null && other.idRuta != null) || (this.idRuta != null && !this.idRuta.equals(other.idRuta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sitmapp.entity.Ruta[ idRuta=" + idRuta + " ]";
    }
    
}
