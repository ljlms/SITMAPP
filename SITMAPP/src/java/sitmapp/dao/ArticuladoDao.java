/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.dao;

import java.util.List;
import sitmapp.controllers.ArticuladoJpaController;
import sitmapp.entity.Articulado;

/**
 *
 * @author MANUEL PONTON RICO
 */
public class ArticuladoDao {
       Articulado articulado = new Articulado();
    ArticuladoJpaController tjc = new ArticuladoJpaController();
    String mensaje = "";

    public String InsertarArticulado(String placa, String estado, int idEmpresa, String nombreEmpresa, int idConductor, int idRuta) {
        try {
            articulado.setIdArticulado(Integer.BYTES);
            articulado.setPlaca(placa);
            articulado.setEstado(estado);
            articulado.setIdEmpresa(idEmpresa);
            articulado.setNombreEmpresa(nombreEmpresa);
            articulado.setIdConductor(idConductor);
            articulado.setIdRuta(idRuta);

            tjc.create(articulado);
            mensaje = "Se ha guardado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al insertar nueva persona: " + e.getMessage());
            mensaje = "No se ha guardado correctamente";
        }
        return mensaje;
    }

    public String EditarArticulado(int id, String placa, String estado, int idEmpresa, String nombreEmpresa, int idConductor, int idRuta) {
        try {
            articulado.setIdArticulado(Integer.BYTES);
            articulado.setPlaca(placa);
            articulado.setEstado(estado);
            articulado.setIdEmpresa(idEmpresa);
            articulado.setNombreEmpresa(nombreEmpresa);
            articulado.setIdConductor(idConductor);
            articulado.setIdRuta(idRuta);

            tjc.edit(articulado);
            mensaje = "Se ha editado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al editar persona: " + e.getMessage());
            mensaje = "No se ha editado correctamente";
        }
        return mensaje;
    }

    public String EliminarArticulado(int id) {

        try {
            tjc.destroy(id);
            mensaje = "Se ha eliminado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al eliminar persona: " + e.getMessage());
            mensaje = "No se ha eliminado correctamente";
        }
        return mensaje;
    }

    public List<Articulado> ListarArticulados() {

        List<Articulado> usuarios = tjc.findArticuladoEntities();
        return usuarios;
    }
}
