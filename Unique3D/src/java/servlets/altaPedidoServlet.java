/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import gestor.GestorDB;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.pedido;

/**
 *
 * @author usuario
 */
@WebServlet(name = "altaPedidoServlet", urlPatterns = {"/altaPedidoServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5,
        location = "E:\\VentaVehiculos\\Unique3D\\web\\img"
        
)
public class altaPedidoServlet extends HttpServlet {



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
               
        String descripcion = request.getParameter("txtDescripcion");
        String presupuesto = request.getParameter("txtPresupuesto");
        String plazo = request.getParameter("txtPlazo");
        
        String nomApe = request.getParameter("txtNomApe");
        String email = request.getParameter("txtEmail");
        
        
        Part part = request.getPart("file");
        String fileName = getFileName(part);
        String savePath = File.separator +fileName;
        File fileSaveDir = new File(savePath);
        part.write(savePath + File.separator);
//        for (Part part : request.getParts()) {
//            String fileName = getFileName(part);
//            if (!fileName.isEmpty()) {
//                part.write(fileName);
//            }
//        }

       
        GestorDB g = new GestorDB();
        
        

        g.altaPedido(new pedido(descripcion,presupuesto,plazo,"img/" +fileName,nomApe,email));
        

        request.getRequestDispatcher("/msj/pedidoExito.jsp").forward(request, response);



    }
       private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "";
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
