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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.reporteVentas;

/**
 *
 * @author usuario
 */
@WebServlet(name = "reporteVentasServlet", urlPatterns = {"/reporteVentasServlet"})
public class reporteVentasServlet extends HttpServlet {

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
        
        GestorDB g = new GestorDB();
        int cl = Integer.parseInt(request.getParameter("cboCliente"));
        int mod = Integer.parseInt(request.getParameter("cboModelo"));
        String fec1 = request.getParameter("txtfec1");
        String fec2 = request.getParameter("txtfec2");
        
//        if (fec1 != null && !fec1.equals("") && fec2 != null && !fec2.equals("")) {
//            fec1 = fec1;
//            fec2=fec2;
//        }else{
//            fec1= "";
//            fec2="";
//        }
//        request.setAttribute("cboC", cl);
//        request.setAttribute("cboM", mod);
//        request.setAttribute("f1", fec1);
//        request.setAttribute("f2", fec2);
        
        ArrayList<reporteVentas> lista = g.reporteVentas(cl, mod, fec1, fec2);
        
        request.setAttribute("lista", lista);
        request.getRequestDispatcher("reporteVentas.jsp").forward(request, response);
        
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
