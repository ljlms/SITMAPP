/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario.fun;

import Usuario.Usuario;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String correo = request.getParameter("correo_usuario");
            String contraseña  = request.getParameter("contra_usuario");
//            List<Usuario> listado = Usuario_Metodos.list();
            
            System.out.println("Correo: " + correo);
            System.out.println("Contraseña: " + contraseña);
            Usuario iniciar_sesion = Usuario_Metodos.Iniciar_Sesion(correo, contraseña);
            HttpSession session=request.getSession();
          
            session.setAttribute("usuario", iniciar_sesion);
                   
            //kill session  session.invalidate(); 
            RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
             rd.forward(request, response);

//                    RequestDispatcher rd2 = request.getRequestDispatcher("Home.jsp");
//                    rd.forward(request, response);
//                    RequestDispatcher rd3 = request.getRequestDispatcher("Home.jsp");
//                    rd.forward(request, response);
                    
//            for (Usuario u : listado) {
//                String correo_lista = u.getEmail();
//                String contraseña_lista = u.getContraseña();
//                
//                System.out.println("Correo lista: "+ correo_lista);
//                System.out.println("Contraseña lista: "+contraseña_lista);
//                
//                if (correo.equals(correo_lista) && contraseña.equals(contraseña_lista)) {
//                    //String Nombre, String Apellidos, String NombreUsuario,
//                    //String Contraseña, String Email, long Numero_telefono, 
//                    //String tipo_usuario, int id_usuario
//                    Usuario usuario = new Usuario(u.getNombre(),u.getApellidos(),u.getNombreUsuario(),u.getContraseña(),u.getEmail(), u.getNumero_telefono(),u.getTipo_usuario(),u.getId_usuario());
//                    request.setAttribute("usuario", usuario);
//                    RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
//                    rd.forward(request, response);
//                }else{
//                    System.out.println("Error");
//                }
//            }

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
