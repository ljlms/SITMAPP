/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.models;

/**
 *
 * @author Jhon Baron
 */
public class Noticia {
    private int Id;
    private int IdUsuario;
    private String Titulo;
    private String Contenido;
    private String Fecha;

    public Noticia() {
    }

    public Noticia(int Id, int IdUsuario, String Titulo, String Contenido, String Fecha) {
        this.Id = Id;
        this.IdUsuario = IdUsuario;
        this.Titulo = Titulo;
        this.Contenido = Contenido;
        this.Fecha = Fecha;
    }
    public Noticia(int IdUsuario, String Titulo, String Contenido, String Fecha) { // Used in NRegistrar
        this.IdUsuario = IdUsuario;
        this.Titulo = Titulo;
        this.Contenido = Contenido;
        this.Fecha = Fecha;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public String getContenido() {
        return Contenido;
    }

    public void setContenido(String Contenido) {
        this.Contenido = Contenido;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    
}
