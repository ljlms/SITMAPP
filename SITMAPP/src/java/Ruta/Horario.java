/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ruta;

/**
 *
 * @author Jhon
 */
public class Horario {
    private String lunes_viernes;
    private String sabado;
    private String domingo_festivo;

    public Horario() {
    }

    public Horario(String lunes_viernes, String sabado, String domingo_festivo) {
        this.lunes_viernes = lunes_viernes;
        this.sabado = sabado;
        this.domingo_festivo = domingo_festivo;
    }
    
}
