/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.models;

import java.util.LinkedList;

/**
 *
 * @author Jhon
 */
public class Ruta {
    private int Id_ruta;
    private String Nombre_Ruta;
    private String Tipo_Ruta;
    private LinkedList<Parada> Paradas; 
    private String lunes_viernes;
    private String sabado;
    private String domingo_festivo;

    public Ruta() {
    }

    public Ruta(int Id_ruta, String Nombre_Ruta, String Tipo_Ruta, LinkedList<Parada> Paradas, String lunes_viernes, String sabado, String domingo_festivo) {
        this.Id_ruta = Id_ruta;
        this.Nombre_Ruta = Nombre_Ruta;
        this.Tipo_Ruta = Tipo_Ruta;
        this.Paradas = Paradas;
        this.lunes_viernes = lunes_viernes;
        this.sabado = sabado;
        this.domingo_festivo = domingo_festivo;
    }
    
     public Ruta(String Nombre_Ruta, String Tipo_Ruta, String lunes_viernes, String sabado, String domingo_festivo) { // used in "SRModificar"
        this.Nombre_Ruta = Nombre_Ruta;
        this.Tipo_Ruta = Tipo_Ruta;
        this.lunes_viernes = lunes_viernes;
        this.sabado = sabado;
        this.domingo_festivo = domingo_festivo;
    }
    

    public int getId_ruta() {
        return Id_ruta;
    }

    public void setId_ruta(int Id_ruta) {
        this.Id_ruta = Id_ruta;
    }

    public String getNombre_Ruta() {
        return Nombre_Ruta;
    }

    public void setNombre_Ruta(String Nombre_Ruta) {
        this.Nombre_Ruta = Nombre_Ruta;
    }

    public String getTipo_Ruta() {
        return Tipo_Ruta;
    }

    public void setTipo_Ruta(String Tipo_Ruta) {
        this.Tipo_Ruta = Tipo_Ruta;
    }

    public LinkedList<Parada> getParadas() {
        return Paradas;
    }

    public void setParadas(LinkedList<Parada> Paradas) {
        this.Paradas = Paradas;
    }

    public String getLunes_viernes() {
        return lunes_viernes;
    }

    public void setLunes_viernes(String lunes_viernes) {
        this.lunes_viernes = lunes_viernes;
    }

    public String getSabado() {
        return sabado;
    }

    public void setSabado(String sabado) {
        this.sabado = sabado;
    }

    public String getDomingo_festivo() {
        return domingo_festivo;
    }

    public void setDomingo_festivo(String domingo_festivo) {
        this.domingo_festivo = domingo_festivo;
    }

    
}
