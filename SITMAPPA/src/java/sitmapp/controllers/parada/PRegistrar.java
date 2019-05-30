/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.parada;

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
import sitmapp.controllers.usuario.UsuarioController;
import sitmapp.models.Parada;
import sitmapp.models.Usuario;

/**
 *
 * @author Jhon Baron
 */
@WebServlet(name = "PRegistrar", urlPatterns = {"/PRegistrar"})
public class PRegistrar extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            RequestDispatcher rd = request.getRequestDispatcher("Administrar_Paradas.jsp");
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
            Logger.getLogger(PRegistrar.class.getName()).log(Level.SEVERE, null, ex);
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

            String nombre_parada = request.getParameter("nombre_parada");
            String tipo_parada = request.getParameter("tipo_parada");
            double latitude = Double.parseDouble(request.getParameter("latitud_parada"));
            double longitude = Double.parseDouble(request.getParameter("longitud_parada"));
            Parada parada = new Parada(nombre_parada, tipo_parada, latitude, longitude);
            String error = null;
            for (Parada object : ParaderoController.list()) {
                if (object.getNombre().equalsIgnoreCase(parada.getNombre())&&object.getTipo().equalsIgnoreCase(parada.getTipo())) {
                    response.sendRedirect("Administrar_Paradas.jsp");
                } else if (object.getNombre().equalsIgnoreCase(nombre_parada)) {
                    error = "\n Debe ingresar otro nombre";
                    System.out.println("Parada repetida");
                }
            }
            if (error != null) {
                request.setAttribute("error", error);
                RequestDispatcher rd = request.getRequestDispatcher("Añadir_Parada.jsp");
                rd.forward(request, response);
            }

            ParaderoController.save(parada);
            HttpSession session = request.getSession();
            RequestDispatcher rd = request.getRequestDispatcher("Administrar_Paradas.jsp");
            rd.forward(request, response);

            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PRegistrar.class.getName()).log(Level.SEVERE, null, ex);

        } catch (Exception e) {
            request.setAttribute("error", "Debe rellenar todos los campos");
            RequestDispatcher rd = request.getRequestDispatcher("Añadir_Parada.jsp");
            rd.forward(request, response);
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
