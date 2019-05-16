/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.models;

/**
 *
 * @author E201
 */
public class Parada {
    private int IdParada;
    private String Nombre;
    private String Tipo;
    private Double Latitud;
    private Double Longitud;

    public Parada(int IdParada, String Nombre, String Tipo, Double Latitud, Double Longitud) {
        this.IdParada = IdParada;
        this.Nombre = Nombre;
        this.Tipo = Tipo;
        this.Latitud = Latitud;
        this.Longitud = Longitud;
    }

    public Parada() {
    }

    public int getIdParada() {
        return IdParada;
    }

    public void setIdParada(int IdParada) {
        this.IdParada = IdParada;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public Double getLatitud() {
        return Latitud;
    }

    public void setLatitud(Double Latitud) {
        this.Latitud = Latitud;
    }

    public Double getLongitud() {
        return Longitud;
    }

    public void setLongitud(Double Longitud) {
        this.Longitud = Longitud;
    }
    
}
