/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.dao;

import java.util.List;
import sitmapp.controllers.UsuarioJpaController;
import sitmapp.entity.Usuario;

/**
 *
 * @author MANUEL PONTON RICO
 */
public class UsuarioDao {

    Usuario persona = new Usuario();
    UsuarioJpaController tjc = new UsuarioJpaController();
    String mensaje = "";

    public String InsertarUsuario(String nombres, String apellidos, String correo, String telefono, String tipoUsuario, String nombreUsuario) {

        try {
            persona.setIdUsuario(Integer.BYTES);
            persona.setNombre(nombres);
            persona.setApellidos(apellidos);
            persona.setCorreo(correo);
            persona.setTelefono(telefono);
            persona.setTipoUsuario(tipoUsuario);
            persona.setNombreUsuario(nombreUsuario);

            tjc.create(persona);
            mensaje = "Se ha guardado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al insertar nueva persona: " + e.getMessage());
            mensaje = "No se ha guardado correctamente";
        }
        return mensaje;
    }

    public String EditarUsuario(int id, String nombres, String apellidos, String correo, String telefono, String tipoUsuario, String nombreUsuario) {

        try {
            persona.setIdUsuario(id);
            persona.setNombre(nombres);
            persona.setApellidos(apellidos);
            persona.setCorreo(correo);
            persona.setTelefono(telefono);
            persona.setTipoUsuario(tipoUsuario);
            persona.setNombreUsuario(nombreUsuario);
            tjc.edit(persona);
            mensaje = "Se ha editado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al editar persona: " + e.getMessage());
            mensaje = "No se ha editado correctamente";
        }
        return mensaje;
    }

    public String EliminarUsuario(int id) {

        try {
            tjc.destroy(id);
            mensaje = "Se ha eliminado corrrectamente";
        } catch (Exception e) {
            System.out.println("Error al eliminar persona: " + e.getMessage());
            mensaje = "No se ha eliminado correctamente";
        }
        return mensaje;
    }

    public List<Usuario> ListarUsuarios() {

        List<Usuario> usuarios = tjc.findUsuarioEntities();
        return usuarios;
    }

}
