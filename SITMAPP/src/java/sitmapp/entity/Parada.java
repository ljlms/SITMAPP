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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author MANUEL PONTON RICO
 */
@Entity
@Table(name = "parada")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Parada.findAll", query = "SELECT p FROM Parada p")
    , @NamedQuery(name = "Parada.findByIdParada", query = "SELECT p FROM Parada p WHERE p.idParada = :idParada")
    , @NamedQuery(name = "Parada.findByNombre", query = "SELECT p FROM Parada p WHERE p.nombre = :nombre")
    , @NamedQuery(name = "Parada.findByUbicacionLatitud", query = "SELECT p FROM Parada p WHERE p.ubicacionLatitud = :ubicacionLatitud")
    , @NamedQuery(name = "Parada.findByUbicacionLongitud", query = "SELECT p FROM Parada p WHERE p.ubicacionLongitud = :ubicacionLongitud")
    , @NamedQuery(name = "Parada.findByTipo", query = "SELECT p FROM Parada p WHERE p.tipo = :tipo")})
public class Parada implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "IdParada")
    private Integer idParada;
    @Basic(optional = false)
    @Column(name = "Nombre")
    private String nombre;
    @Column(name = "Ubicacion_Latitud")
    private String ubicacionLatitud;
    @Column(name = "Ubicacion_Longitud")
    private String ubicacionLongitud;
    @Basic(optional = false)
    @Column(name = "Tipo")
    private String tipo;

    public Parada() {
    }

    public Parada(Integer idParada) {
        this.idParada = idParada;
    }

    public Parada(Integer idParada, String nombre, String tipo) {
        this.idParada = idParada;
        this.nombre = nombre;
        this.tipo = tipo;
    }

    public Integer getIdParada() {
        return idParada;
    }

    public void setIdParada(Integer idParada) {
        this.idParada = idParada;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idParada != null ? idParada.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Parada)) {
            return false;
        }
        Parada other = (Parada) object;
        if ((this.idParada == null && other.idParada != null) || (this.idParada != null && !this.idParada.equals(other.idParada))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sitmapp.entity.Parada[ idParada=" + idParada + " ]";
    }
    
}
