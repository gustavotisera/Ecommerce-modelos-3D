/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import gestor.GestorDB;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.rol;
import modelo.usuario;

/**
 *
 * @author usuario
 */
@WebServlet(name = "altaUsuarioServlet", urlPatterns = {"/altaUsuarioServlet"})
public class altaUsuarioServlet extends HttpServlet {

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
        ArrayList<rol> lista = g.ObtenerRoles();

        request.setAttribute("listaRoles", lista);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/altaUsuario.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GestorDB g = new GestorDB();
        usuario usu = new usuario();
        String nombre = request.getParameter("txtNombre");
        String password = request.getParameter("txtPassword");;
        String email = request.getParameter("txtEmail");;
        

        if (g.obtenerUsuarioPorNombre(nombre) == false) {
            if (g.existeRolAdmin() ==false) {
                int idRol = Integer.parseInt(request.getParameter("cboRol"));
                g.altaUsuario(new usuario(nombre, password, email, idRol));
                response.sendRedirect("/Unique3D/index.jsp");
            }else{
                g.altaUsuario(new usuario(nombre, password, email, 2));
                response.sendRedirect("/Unique3D/index.jsp");
            }
            
        } else {
            request.setAttribute("msjj", "Este nombre de usuario ya esta registrado por favor ingrese uno diferente!");
            ArrayList<rol> lista = g.ObtenerRoles();

            request.setAttribute("listaRoles", lista);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/altaUsuario.jsp");
            rd.forward(request, response);
        }

//        RequestDispatcher rd = getServletContext().getRequestDispatcher("/altaUsuario.jsp");
//        rd.forward(request, response);
//        int rolA = g.IdRol();
//      
//        if (rolA == 1) {
//            g.altaUsuario(new usuario(nombre,password,email,2));
//        }
//        else{
//            g.altaUsuario(new usuario(nombre,password,email,idRol));
//        }
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
