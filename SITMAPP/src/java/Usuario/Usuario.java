package Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jdbcsitmapp.db.JdbcConnect;

public class Usuario {
    // bd order by 
    //nombre-apellidos-nomusuario-contraseña-correo-telefono-tipousuario-id

    private String Nombre;
    private String Apellidos;
    private String NombreUsuario;
    private String Contraseña;
    private String Email;
    private long Numero_telefono;
    private String tipo_usuario;
    private int id_usuario;

    public Usuario() {
    }

    public Usuario(String Nombre, String Apellidos, String NombreUsuario, String Contraseña, String Email, long Numero_telefono, String tipo_usuario) {
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.NombreUsuario = NombreUsuario;
        this.Contraseña = Contraseña;
        this.Email = Email;
        this.Numero_telefono = Numero_telefono;
        this.tipo_usuario = tipo_usuario;
        
    }
 
    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

    public long getNumero_telefono() {
        return Numero_telefono;
    }

    public void setNumero_telefono(long Numero_telefono) {
        this.Numero_telefono = Numero_telefono;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    /**
     * @return the id_usuario
     */
    public int getId_usuario() {
        return id_usuario;
    }

    /**
     * @param id_usuario the id_usuario to set
     */
    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    /**
     * @return the tipo_usuario
     */
    public String getTipo_usuario() {
        return tipo_usuario;
    }

    /**
     * @param tipo_usuario the tipo_usuario to set
     */
    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

}
