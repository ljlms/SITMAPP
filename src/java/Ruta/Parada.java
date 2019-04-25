/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ruta;

/**
 *
 * @author E201
 */
public class Parada {
   private String latitud;
   private String Logitud;
   private String Nombre;

    public Parada(String latitud, String Logitud, String Nombre) {
        this.latitud = latitud;
        this.Logitud = Logitud;
        this.Nombre = Nombre;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLogitud() {
        return Logitud;
    }

    public void setLogitud(String Logitud) {
        this.Logitud = Logitud;
    }
   
}
