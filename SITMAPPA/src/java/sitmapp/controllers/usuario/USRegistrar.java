/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.usuario;

import sitmapp.models.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author E201
 */
@WebServlet(name = "USRegistrar", urlPatterns = {"/USRegistrar"})
public class USRegistrar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @author Jhon Barón, Luigui Carabarllo, Manuel Pontón
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     *
     * Servlet para registrar un nuevo usuario
     *
     * @param request, El parámetro request recupera los elementos que vienen de
     * JSP y son capturados en variables para luego crear un objeto Usuario y
     * guardarlo en la base de datos
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            processRequest(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(USRegistrar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            response.setContentType("text/html;charset=UTF-8");
            String nombre = request.getParameter("nombre_usuario");
            String apellido = request.getParameter("apellidos_usuario");
            long telefono = Long.parseLong(request.getParameter("telefono_usuario"));
            String correo = request.getParameter("correo_usuario");
            String nombreusuario = request.getParameter("usuario");
            String contraseña = request.getParameter("pass_usuario");
            String tipousuario = request.getParameter("tipo_usuario");
            String error = null;
            for (Usuario object : UsuarioController.ValidarUsuario()) {
                if (object.getEmail().equalsIgnoreCase(correo)) {
                    error = "\n Debe ingresar otro correo electronico";
                    System.out.println("COREOOOOOOOOOOOO");
                }
                if (object.getNombreUsuario().equalsIgnoreCase(nombreusuario)) {
                    error = "\n Debe ingresar otro nombre de usuario";
                    System.out.println("USUARIOOOOOOOO");
                }
                if (object.getNumero_telefono() == telefono) {
                    error = "\n Debe ingresar otro numero de telefono";
                    System.out.println("Telefonooooooooooo");
                }
            }
            if (error != null) {
                request.setAttribute("error", error);
                RequestDispatcher rd = request.getRequestDispatcher("Registrar_Usuario.jsp");
                rd.forward(request, response);
            }

            Usuario user = new Usuario(nombre, apellido, nombreusuario, contraseña, correo, telefono, tipousuario);
            UsuarioController.save(user);
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

            rd.forward(request, response);
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(USRegistrar.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            String error = "Estamos teniendo problemas tecnicos, intenta nuevamente dentro de unos minutos";
            System.out.println(error);
            request.setAttribute("error", error);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            Logger.getLogger(USRegistrar.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
            response.sendRedirect("errorSesion?error=No se pudo registrar usuario");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
