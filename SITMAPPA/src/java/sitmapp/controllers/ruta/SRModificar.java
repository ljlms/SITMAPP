/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.ruta;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sitmapp.models.Ruta;

/**
 *
 * @author Jhon Baron
 */
@WebServlet(name = "SRModificar", urlPatterns = {"/SRModificar"})
public class SRModificar extends HttpServlet {

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

            int id_ruta = Integer.parseInt(request.getParameter("id_ruta"));

            String nombre = request.getParameter("nombre_ruta");
            String tipo = request.getParameter("tipo_ruta");

            String HorarioLunesViernes = request.getParameter("lunes_inicio") + "-" + request.getParameter("lunes_final");
            String HorarioSabado = request.getParameter("sabado_inicio") + "-" + request.getParameter("sabado_final");
            String HorarioDomingosFestivos = request.getParameter("domingo_festivo_inicio") + "-" + request.getParameter("domingo_festivo_final");

            if (HorarioLunesViernes.equalsIgnoreCase("-")) {
                HorarioLunesViernes = "No Opera";
            }
            if (HorarioSabado.equalsIgnoreCase("-")) {
                HorarioSabado = "No Opera";
            }
            if (HorarioDomingosFestivos.equalsIgnoreCase("-")) {
                HorarioDomingosFestivos = "No Opera";
            }

            String id_paradas[] = request.getParameterValues("id_paradas[]");
            try {

                Ruta ruta = new Ruta(nombre, tipo, HorarioLunesViernes, HorarioSabado, HorarioDomingosFestivos);

                RutaControllers.updateRuta(id_ruta, ruta);//Actualiza Ruta
                //convertir idparadas a int
                int size = id_paradas.length;
                int IDPARADAS[] = new int[size];
                for (int i = 0; i < size; i++) {
                    IDPARADAS[i] = Integer.parseInt(id_paradas[i]);
                }
                //convertir idparadas a int
                if (size != 0) {
                    RutaControllers.saveParaderosRuta(id_ruta, IDPARADAS); //Añade paraderos
                }
            } catch (Exception e) {
                System.out.println("No se guardaron paradas pero se actualizó la ruta");

            }

            HttpSession session = request.getSession();

            RequestDispatcher rd = request.getRequestDispatcher("Administrar_Rutas.jsp");
            rd.forward(request, response);

            //convertir idparadas a int
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
