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
   private String Nombre_Ruta;
   private String Tipo_Ruta;
   private int Id_ruta;
   private LinkedList<Parada> Paradas;
   private Horario horario;

    public Ruta(String Nombre_Ruta, String Tipo_Ruta, LinkedList<Parada> Ubicaciones, Horario horario) {
        this.Nombre_Ruta = Nombre_Ruta;
        this.Tipo_Ruta = Tipo_Ruta;
        this.Paradas = Ubicaciones;
        this.horario = horario;
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

    public Horario getHorario() {
        return horario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    public Ruta() {
    }
   
}
