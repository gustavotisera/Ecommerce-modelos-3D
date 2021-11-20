/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import gestor.GestorDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.usuario;
import modelo.usuarioDTO;

/**
 *
 * @author usuario
 */
@WebServlet(name = "modificarUsuarioServlet", urlPatterns = {"/modificarUsuarioServlet"})
public class modificarUsuarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


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
        
         GestorDB g = new GestorDB();

        String idModificar = (String) request.getParameter("idU");
        int id = Integer.parseInt(idModificar);

        usuarioDTO ud = new usuarioDTO();
        
        ud.u = g.obtenerUsuarioPorID(id);

        request.setAttribute("usuariodto", ud);
//
//        String nombreUpdate = request.getParameter("nom");
//        
//        usuario um = new usuario();
//        
//        um = g.obtenerUsuarioPorNombre(nombreUpdate);
//        
//        request.setAttribute("um", um);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/modificarUsuario.jsp");
        rd.forward(request, response);
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
        
        int id = Integer.parseInt((String) request.getParameter("txtId"));
        String nombre = request.getParameter("txtNombre");
        String password= request.getParameter("txtPassword");
        String email = request.getParameter("txtEmail");
//        int rol = Integer.parseInt(request.getParameter("txtIdRol"));
        
        GestorDB g = new GestorDB();

        g.modificarUsuario(new usuario(id,nombre,password,email));
        

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/cuentaUsuario.jsp");
        rd.forward(request, response);
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
