/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Empresa;


/**
 *
 * @author Jhon Baron
 */
public class Empresa {

    private int IdEmpresa;
    private String Nombre;
    private String Descripcion;

    

    public Empresa() {
    }

    public Empresa(int IdEmpresa, String Nombre, String Descripcion) {
        this.IdEmpresa = IdEmpresa;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
    }

    public int getIdEmpresa() {
        return IdEmpresa;
    }

    public void setIdEmpresa(int IdEmpresa) {
        this.IdEmpresa = IdEmpresa;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }


}
