/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author MANUEL PONTON RICO
 */
@Entity
@Table(name = "historialconductor")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Historialconductor.findAll", query = "SELECT h FROM Historialconductor h")
    , @NamedQuery(name = "Historialconductor.findByFecha", query = "SELECT h FROM Historialconductor h WHERE h.fecha = :fecha")
    , @NamedQuery(name = "Historialconductor.findByArticuladoIdArticulado", query = "SELECT h FROM Historialconductor h WHERE h.articuladoIdArticulado = :articuladoIdArticulado")})
public class Historialconductor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "Fecha")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @Id
    @Basic(optional = false)
    @Column(name = "articulado_IdArticulado")
    private Integer articuladoIdArticulado;
    @JoinColumn(name = "articulado_IdArticulado", referencedColumnName = "IdArticulado", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Articulado articulado;

    public Historialconductor() {
    }

    public Historialconductor(Integer articuladoIdArticulado) {
        this.articuladoIdArticulado = articuladoIdArticulado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Integer getArticuladoIdArticulado() {
        return articuladoIdArticulado;
    }

    public void setArticuladoIdArticulado(Integer articuladoIdArticulado) {
        this.articuladoIdArticulado = articuladoIdArticulado;
    }

    public Articulado getArticulado() {
        return articulado;
    }

    public void setArticulado(Articulado articulado) {
        this.articulado = articulado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (articuladoIdArticulado != null ? articuladoIdArticulado.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Historialconductor)) {
            return false;
        }
        Historialconductor other = (Historialconductor) object;
        if ((this.articuladoIdArticulado == null && other.articuladoIdArticulado != null) || (this.articuladoIdArticulado != null && !this.articuladoIdArticulado.equals(other.articuladoIdArticulado))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sitmapp.entity.Historialconductor[ articuladoIdArticulado=" + articuladoIdArticulado + " ]";
    }

}
