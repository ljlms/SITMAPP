/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.dao;

import java.util.Date;
import java.util.List;
import sitmapp.controllers.HistorialConductorJpaController;
import sitmapp.entity.Historialconductor;

/**
 *
 * @author MANUEL PONTON RICO
 */
public class HistorialConductorDao {

    Historialconductor Historial = new Historialconductor();
    HistorialConductorJpaController tjc = new HistorialConductorJpaController();
    String mensaje = "";

    public String InsertarHistorialconductor(Date fecha, Integer articuladoIdArticulado) {
        try {
            Historial.setFecha(fecha);
            Historial.setArticuladoIdArticulado(articuladoIdArticulado);
            tjc.create(Historial);
            mensaje = "Se ha guardado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al insertar nueva persona: " + e.getMessage());
            mensaje = "No se ha guardado correctamente";
        }
        return mensaje;
    }

//    public String EditarHistorialconductor(int id, String placa, String estado, int idEmpresa, String nombreEmpresa, int idConductor, int idRuta) {
//        try {
//            Historial.setIdHistorialconductor(Integer.BYTES);
//            Historial.setPlaca(placa);
//            Historial.setEstado(estado);
//            Historial.setIdEmpresa(idEmpresa);
//            Historial.setNombreEmpresa(nombreEmpresa);
//            Historial.setIdConductor(idConductor);
//            Historial.setIdRuta(idRuta);
//
//            tjc.edit(Historial);
//            mensaje = "Se ha editado corrrectamente";
//        } catch (Exception e) {
//            System.out.println("Error al editar persona: " + e.getMessage());
//            mensaje = "No se ha editado correctamente";
//        }
//        return mensaje;
//    }

    public String EliminarHistorialconductor(int id) {

        try {
            tjc.destroy(id);
            mensaje = "Se ha eliminado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al eliminar persona: " + e.getMessage());
            mensaje = "No se ha eliminado correctamente";
        }
        return mensaje;
    }

    public List<Historialconductor> ListarHistorialconductors() {

        List<Historialconductor> usuarios = tjc.findHistorialconductorEntities();
        return usuarios;
    }

}
