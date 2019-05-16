/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.usuario;

import sitmapp.models.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jhon Baron
 */
@WebServlet(name = "USEditar", urlPatterns = {"/USEditar"})
public class USEditar extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //./USEditar?id_usuario=<%= e.getId_usuario()%>&nombre=<%= e.getNombreUsuario()%>
            //&apellidos =<%= e.getApellidos()%>&usuario=<%= e.getNombreUsuario()%>
            //&correo=<%=e.getEmail()%>&telefono=<%= e.getNumero_telefono()%>
            //&tipo=<%= e.getTipo_usuario()%>">&#xf044;
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String usuario = request.getParameter("usuario");
            String correo = request.getParameter("correo");
            long telefono = Long.parseLong(request.getParameter("telefono"));
            String tipo_usuario = request.getParameter("tipo");
            String contraseña = request.getParameter("contra");

            System.out.println("id: " + id);
            System.out.println("nombre: " + nombre);
            System.out.println("apellidos: " + apellidos);
            System.out.println("usuario: " + usuario);
            System.out.println("correo: " + correo);
            System.out.println("telefono: " + telefono);
            System.out.println("tipo: " + tipo_usuario);
            System.out.println("Contraseña: " + contraseña);
            //String Nombre, String Apellidos, String NombreUsuario, 
            //String Contraseña, String Email, long Numero_telefono, String tipo_usuario) 

            Usuario user = new Usuario(nombre, apellidos, usuario, contraseña, correo, telefono, tipo_usuario);
            UsuarioController.update(id, user);
            
            RequestDispatcher rd = request.getRequestDispatcher("Administrar_Usuarios.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
