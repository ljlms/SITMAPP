/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmapp.controllers.ruta;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
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
 * @author E201
 */
@WebServlet(name = "SRregistrar", urlPatterns = {"/SRregistrar"})
public class SRregistrar extends HttpServlet {

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

            System.out.println("Servlet Registrar Rutas");
            String nom_ruta = request.getParameter("nombre_ruta");
            String tip_ruta = request.getParameter("tipo_ruta");
            String HorarioLunesViernes = request.getParameter("hora_inicio_lunes_viernes") + "-" + request.getParameter("hora_final_lunes_viernes");
            String HorarioSabado = request.getParameter("hora_inicio_sabados") + "-" + request.getParameter("hora_final_sabados");
            String HorarioDomingosFestivos = request.getParameter("hora_inicio_domingos_festivos") + "-" + request.getParameter("hora_final_domingos_festivos");

            if (HorarioLunesViernes.equalsIgnoreCase("-")) {
                HorarioLunesViernes = "No Opera";
            }
            if (HorarioSabado.equalsIgnoreCase("-")) {
                HorarioSabado = "No Opera";
            }
            if (HorarioDomingosFestivos.equalsIgnoreCase("-")) {
                HorarioDomingosFestivos = "No Opera";
            }

            String id_paradas[] = request.getParameterValues("paradas[]");//id

            Ruta ruta = new Ruta(nom_ruta, tip_ruta, HorarioLunesViernes, HorarioSabado, HorarioDomingosFestivos);
            RutaControllers.saveRuta(ruta);//Guarda en tabla ruta
            try {
                //convertir idparadas a int
                int size = id_paradas.length;
                int IDPARADAS[] = new int[size];
                for (int i = 0; i < size; i++) {
                    IDPARADAS[i] = Integer.parseInt(id_paradas[i]);
                }
                //convertir idparadas a int
                RutaControllers.saveParaderosRuta(RutaControllers.IdRutaBack(nom_ruta), IDPARADAS);

            } catch (Exception e) {
                System.out.println("No se guardaron paradas pero se creó la ruta");

            }

            //prueba
            for (Ruta ruta1 : RutaControllers.list()) {
                System.out.println("Id ruta: " + ruta1.getId_ruta());
                System.out.println("Nombre ruta" + ruta.getId_ruta());
                System.out.println("Tipo ruta: " + ruta.getTipo_Ruta());
            }
            //prueba
            HttpSession session = request.getSession();
            RequestDispatcher rd = request.getRequestDispatcher("Administrar_Rutas.jsp");
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
