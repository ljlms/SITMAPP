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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String nombre = request.getParameter("nombre_usuario");
            String apellido = request.getParameter("apellidos_usuario");
            long telefono = Long.parseLong(request.getParameter("telefono_usuario"));
            String correo = request.getParameter("correo_usuario");
            String nombreusuario = request.getParameter("usuario");
            String contraseña = request.getParameter("pass_usuario");
            String tipousuario = request.getParameter("tipo_usuario");

            //nombre-apellidos-nomusuario-contraseña-correo-telefono-tipousuario-id
            //Registrar  Usuario
            System.out.println("" + nombre);
            System.out.println("" + apellido);
            System.out.println("" + telefono);
            System.out.println("" + correo);
            System.out.println("" + nombreusuario);
            System.out.println("" + contraseña);
            System.out.println("" + tipousuario);

            Usuario user = new Usuario(nombre, apellido, nombreusuario, contraseña, correo, telefono, tipousuario);
            UsuarioController.save(user);
//            request.setAttribute("usuario", user);
//            RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp");
//            if(rd==null){
//            throw new ServletException("PAGINA HOME NO ENCONTRADA");
//            }
            System.out.println("------");
            System.out.println(user.getContraseña());
            System.out.println(user.getEmail());
            System.out.println(user.getId_usuario());
            System.out.println(user.getNombre());
            System.out.println(user.getNumero_telefono());
            System.out.println(user.getTipo_usuario());
            System.out.println("pasa por aqui");

            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);
            RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(USRegistrar.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
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
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(USRegistrar.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(USRegistrar.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
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
