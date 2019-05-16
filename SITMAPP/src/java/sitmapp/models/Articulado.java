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
public class Articulado {

    private int IdArticulado = 0;
    private String Codigo_Articulado = "NO ASIGNADO";
    private String Placa = "NO ASIGNADO";
    private String Estado = "NO ASIGNADO";
    private String Ubicacion_Latitud = "NO ASIGNADO";
    private String Ubicacion_Longitud = "NO ASIGNADO";
    private String Nombre_Empresa = "NO ASIGNADO";
    private int empresa_IdEmpresa = 0;
    private int ruta_IdRuta = 0;
    private int conductor_Idconductor = 0;

    public Articulado() {
    }

    public Articulado(String Codigo_Articulado, String Placa, String Nombre_Empresa, int empresa_IdEmpresa) {
        this.Codigo_Articulado = Codigo_Articulado;
        this.Placa = Placa;
        this.Nombre_Empresa = Nombre_Empresa;
        this.empresa_IdEmpresa = empresa_IdEmpresa;
    }

    public Articulado(String Codigo_Articulado, String Placa, String Nombre_Empresa, int id, String Estado) {
        this.Codigo_Articulado = Codigo_Articulado;
        this.Placa = Placa;
        this.Nombre_Empresa = Nombre_Empresa;
        this.IdArticulado = id;
        this.Estado = Estado;
    }

    public int getIdArticulado() {
        return IdArticulado;
    }

    public void setIdArticulado(int IdArticulado) {
        this.IdArticulado = IdArticulado;
    }

    public String getPlaca() {
        return Placa;
    }

    public void setPlaca(String Placa) {
        this.Placa = Placa;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getUbicacion_Latitud() {
        return Ubicacion_Latitud;
    }

    public void setUbicacion_Latitud(String Ubicacion_Latitud) {
        this.Ubicacion_Latitud = Ubicacion_Latitud;
    }

    public String getUbicacion_Longitud() {
        return Ubicacion_Longitud;
    }

    public void setUbicacion_Longitud(String Ubicacion_Longitud) {
        this.Ubicacion_Longitud = Ubicacion_Longitud;
    }

    public int getEmpresa_IdEmpresa() {
        return empresa_IdEmpresa;
    }

    public void setEmpresa_IdEmpresa(int empresa_IdEmpresa) {
        this.empresa_IdEmpresa = empresa_IdEmpresa;
    }

    public int getRuta_IdRuta() {
        return ruta_IdRuta;
    }

    public void setRuta_IdRuta(int ruta_IdRuta) {
        this.ruta_IdRuta = ruta_IdRuta;
    }

    public int getConductor_Idconductor() {
        return conductor_Idconductor;
    }

    public void setConductor_Idconductor(int conductor_Idconductor) {
        this.conductor_Idconductor = conductor_Idconductor;
    }

    public String getNombre_Empresa() {
        return Nombre_Empresa;
    }

    public void setNombre_Empresa(String Nombre_Empresa) {
        this.Nombre_Empresa = Nombre_Empresa;
    }

    public String getCodigo_Articulado() {
        return Codigo_Articulado;
    }

    public void setCodigo_Articulado(String Codigo_Articulado) {
        this.Codigo_Articulado = Codigo_Articulado;
    }

   
}
