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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jhon Baron
 */
@WebServlet(name = "USIngresar", urlPatterns = {"/USIngresar"})
public class USIngresar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Usuario iniciar_sesion = null;
    String error = null;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

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
   
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
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
 response.setContentType("text/html;charset=UTF-8");
        String correo = request.getParameter("correo_usuario");
        String contraseña = request.getParameter("contra_usuario");

        try {
            iniciar_sesion = UsuarioController.Iniciar_Sesion(correo, contraseña);
            if (iniciar_sesion == null) {
                response.sendRedirect("errorSesion?error=El usuario o contrasena incorrecto, intenta nuevamente");
            } else {

                HttpSession session = request.getSession();
                session.setAttribute("usuario", iniciar_sesion);
                
                RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            error = "Estamos teniendo problemas tecnicos, intenta nuevamente dentro de unos minutos";
            System.out.println(error);
            request.setAttribute("error", error);
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
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
