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
import modelo.Fecha;
import modelo.modelo;

/**
 *
 * @author usuario
 */
@WebServlet(name = "altaModeloServlet", urlPatterns = {"/altaModeloServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 20,
        location = "E:\\VentaVehiculos\\Unique3D\\web\\img"
        
)

public class altaModeloServlet extends HttpServlet {

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
//        GestorDB g = new GestorDB();
//        String modo = request.getParameter("modo");
//        if (modo == null || modo.isEmpty()) {
//            request.setAttribute("modelo", g.getObtenerModelo());
//            
//            RequestDispatcher rd = request.getRequestDispatcher("/listaModelos.jsp");
//            rd.forward(request, response);           
//        }
//        else if (modo.equals("alta")) 
//        {
//            request.setAttribute("accion", "Alta");
//            RequestDispatcher rd = request.getRequestDispatcher("/altaModelo.jsp");
//            rd.forward(request, response); 
//        }
//        else if (modo.equals("editar")) 
//        {
//             request.setAttribute("accion", "Edicion");
//            int idModelo = Integer.parseInt(request.getParameter("id"));
//            modelo m = g.obtenerModeloPorId(idModelo);
//            
//            request.setAttribute("modelo", m);
//            RequestDispatcher rd = request.getRequestDispatcher("/modificarModelo.jsp");
//            rd.forward(request, response); 
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Fecha fechaSistem = new Fecha();

        String nombre = request.getParameter("txtNombre");
        String descripcion = request.getParameter("txtDescripcion");
        String parametros = request.getParameter("txtParametros");
        String fecha = fechaSistem.FechaBD();
        double precio = Double.parseDouble(request.getParameter("txtPrecio"));
        String nomA = request.getParameter("txtnomA");
        String arc = request.getParameter("txtArchivo");

//        
        Part part = request.getPart("file");
        Part part2 = request.getPart("file2");
        String fileName = getFileName(part);
        String fileName2 = getFileName(part2);
        part.write(fileName);
        part.write(fileName2);
        
//        String savePath = File.separator +fileName;
//        String savePath2= File.separator +fileName2;
//        
//        File fileSaveDir = new File(savePath);
//         File fileSaveDir2 = new File(savePath2);
//        part.write(savePath + File.separator);
//        part.write(savePath2 + File.separator);
         
//        for (Part part : request.getParts()) {
//            String fileName = getFileName(part);
//            if (!fileName.isEmpty()) {
//                part.write(fileName);
//            }
//        }
        
        

        GestorDB g = new GestorDB();

        g.altaModelo(new modelo(nombre, descripcion, parametros, fecha, precio, "img/" + fileName, "img/"+fileName2));

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoModelosServlet");
        rd.forward(request, response);

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
