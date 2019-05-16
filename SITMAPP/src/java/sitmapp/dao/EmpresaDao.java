/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.dao;

import java.util.List;
import sitmapp.controllers.EmpresaJpaController;
import sitmapp.entity.Empresa;

/**
 *
 * @author MANUEL PONTON RICO
 */
public class EmpresaDao {
    
    Empresa empresa = new Empresa();
    EmpresaJpaController tjc = new EmpresaJpaController();
    String mensaje = "";

    public String InsertarEmpresa(String nombres, String descripcion) {

        try {
            empresa.setIdEmpresa(Integer.BYTES);
            empresa.setNombre(nombres);
            empresa.setDescripcion(descripcion);
            tjc.create(empresa);
            mensaje = "Se ha guardado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al insertar nueva persona: " + e.getMessage());
            mensaje = "No se ha guardado correctamente";
        }
        return mensaje;
    }

    public String Editar(int id,String nombres, String descripcion) {

        try {
            empresa.setIdEmpresa(id);
            empresa.setNombre(nombres);
            empresa.setDescripcion(descripcion);
            tjc.edit(empresa);
            mensaje = "Se ha editado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al editar persona: " + e.getMessage());
            mensaje = "No se ha editado correctamente";
        }
        return mensaje;
    }

    public String EliminarEmpresa(int id) {

        try {
            tjc.destroy(id);
            mensaje = "Se ha eliminado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al eliminar persona: " + e.getMessage());
            mensaje = "No se ha eliminado correctamente";
        }
        return mensaje;
    }

    public List<Empresa> ListarEmpresas() {

        List<Empresa> usuarios = tjc.findEmpresaEntities();
        return usuarios;
    }

}

