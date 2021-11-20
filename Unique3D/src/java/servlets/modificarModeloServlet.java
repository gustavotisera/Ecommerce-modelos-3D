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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.modelo;
import modelo.modeloDTO;

/**
 *
 * @author usuario
 */
@WebServlet(name = "modificarModeloServlet", urlPatterns = {"/modificarModeloServlet"})
public class modificarModeloServlet extends HttpServlet {

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

        String idModificar = (String) request.getParameter("id");
        int id = Integer.parseInt(idModificar);

        modeloDTO md = new modeloDTO();
        md.m = g.obtenerModeloPorId(id);

        request.setAttribute("modelodto", md);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/modificarModelo.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt((String) request.getParameter("txtId"));
        String nombre = request.getParameter("txtNombre");
        String descripcion = request.getParameter("txtDescripcion");
        String parametros = request.getParameter("txtParametros");
        String fecha = request.getParameter("txtFecha");       
        double precio = Double.parseDouble(request.getParameter("txtPrecio"));
        int valoracion = Integer.parseInt(request.getParameter("txtValoracion"));
        int descargas = Integer.parseInt(request.getParameter("txtDescarga"));
        
        String imagen = request.getParameter("txtImagen");
        String arc = request.getParameter("txtArchivo");
        
//        Part part = request.getPart("file");
//        Part part2 = request.getPart("file2");
//        String fileName = getFileName(part);
//        String fileName2 = getFileName(part2);
//        
//        String savePath = File.separator +fileName;
//        String savePath2= File.separator +fileName2;
//        
//        File fileSaveDir = new File(savePath);
//         File fileSaveDir2 = new File(savePath2);
//        part.write(savePath + File.separator);
//        part.write(savePath2 + File.separator);
        
        
        GestorDB g = new GestorDB();

        modelo modA = new modelo(id, nombre, descripcion, parametros, fecha, precio,valoracion,descargas, imagen,arc);
        g.modificarModelo(modA);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoModelosServlet");
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
