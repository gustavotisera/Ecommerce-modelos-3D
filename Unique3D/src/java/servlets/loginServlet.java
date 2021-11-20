/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import gestor.GestorDB;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

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

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        int id= Integer.parseInt(request.getParameter("txtId"));
        String nombre = request.getParameter("txtNombre");
        String pass = request.getParameter("txtPassword");
//        int idRol = Integer.parseInt(request.getParameter("cboRol"));

        GestorDB g = new GestorDB();
        String correctPass = g.buscarPass(nombre);

//        int rol = g.buscarRol(id);
//        if (pass.equals(correctPass) && pass != null && id == rol) {
        if (pass.equals(correctPass) && pass != null) {

            request.getSession().setAttribute("nombre", nombre);
//            request.getSession().setAttribute("id",id );

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/menuAdmin.jsp");
            rd.forward(request, response);
//        } 
        } else {

            request.setAttribute("error", "Nombre de usuario o contraseña incorrecta");

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }
//        else if (pass.equals(correctPass) && pass != null && idRol == 2) {
//            request.getSession().setAttribute("nombre", nombre);
//
//            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
//            rd.forward(request, response);




    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
