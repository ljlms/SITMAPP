/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.dao;

import java.util.List;
import sitmapp.controllers.RutaJpaController;
import sitmapp.entity.Ruta;

/**
 *
 * @author MANUEL PONTON RICO
 */
public class RutaDao {
    
    Ruta ruta = new Ruta();
    RutaJpaController tjc = new RutaJpaController();
    String mensaje = "";

    public String InsertarRuta(String nombreRuta, String tipoRuta, String paraderos, String horarioLunesViernes,String horarioSabado,String horarioDomingo ) {

        try {
            ruta.setIdRuta(Integer.BYTES);
            ruta.setNombreRuta(nombreRuta);
            ruta.setTiporuta(tipoRuta);
            ruta.setParaderos(paraderos);
            ruta.setHorarioLunesViernes(horarioLunesViernes);
            ruta.setHorarioSabado(tipoRuta);
            ruta.setHorarioDomingo(horarioDomingo);

            tjc.create(ruta);
            mensaje = "Se ha guardado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al insertar nueva persona: " + e.getMessage());
            mensaje = "No se ha guardado correctamente";
        }
        return mensaje;
    }

    public String EditarRuta(int id, String nombreRuta, String tipoRuta, String paraderos, String horarioLunesViernes,String horarioSabado,String horarioDomingo ) {

        try {
            ruta.setIdRuta(id);
            ruta.setNombreRuta(nombreRuta);
            ruta.setTiporuta(tipoRuta);
            ruta.setParaderos(paraderos);
            ruta.setHorarioLunesViernes(horarioLunesViernes);
            ruta.setHorarioSabado(tipoRuta);
            ruta.setHorarioDomingo(horarioDomingo);

            tjc.edit(ruta);
            mensaje = "Se ha editado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al editar persona: " + e.getMessage());
            mensaje = "No se ha editado correctamente";
        }
        return mensaje;
    }

    public String EliminarRuta(int id) {

        try {
            tjc.destroy(id);
            mensaje = "Se ha eliminado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al eliminar persona: " + e.getMessage());
            mensaje = "No se ha eliminado correctamente";
        }
        return mensaje;
    }

    public List<Ruta> ListarRutas() {

        List<Ruta> usuarios = tjc.findRutaEntities();
        return usuarios;
    }

}

