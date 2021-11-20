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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Carrito;
import modelo.Orden;
import modelo.detalleOrden;
import modelo.metodoPago;
import modelo.modelo;
import modelo.modeloDTO;
import modelo.usuario;

/**
 *
 * @author usuario
 */
public class carritoServlet1 extends HttpServlet {

    GestorDB g = new GestorDB();
    modelo mm = new modelo();
    usuario u = new usuario();
    ArrayList<modelo> modelo = g.ObtenerModelo();
    ArrayList<modelo> ultimosModelo = g.ultimos6Modelos();
    ArrayList<modelo> modeloMvalor = g.modelosMvalor();

    List<Carrito> listaCarrito = new ArrayList<>();
    int item;
    double totalPagar = 0.0;
    int cantidad = 1;
    int ordenV = 0;
    int idOrden;
    int idpago;
    double montopagar;

    int idModelo;
    Carrito car;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acc = request.getParameter("acc");
        switch (acc) {
            case "Vista":
                String idModificar = (String) request.getParameter("id");
                int id = Integer.parseInt(idModificar);

                modeloDTO md = new modeloDTO();
                md.m = g.obtenerModeloPorId(id);
                request.setAttribute("modelod", md);
                request.getRequestDispatcher("vistaModelo.jsp").forward(request, response);
                break;
            case "Megusta":
//////                String idMegusta = (String) request.getParameter("idLike");
//////                int idLike = Integer.parseInt(idMegusta);

                if (request.getParameter("idLike") != null && !request.getParameter("idLike").equals("")) {
                    g.incrementarValoracion(Integer.parseInt(request.getParameter("idLike")));
//                    g.incrementarDescarga(Integer.parseInt(request.getParameter("id")));
                    request.setAttribute("msj", "Te ha gustado este modelo !");
                   
                }
                 modeloDTO mda = new modeloDTO();
                    mda.m = g.obtenerModeloPorId(Integer.parseInt(request.getParameter("idLike")));
                request.setAttribute("modelod", mda);
                request.getRequestDispatcher("vistaModelo.jsp").forward(request, response);
                
//                modeloDTO md = new modeloDTO();
//                md.m = g.obtenerModeloPorId(id);
//////                g.incrementarValoracion(idLike);
//                g.incrementarDescarga(Integer.parseInt(request.getParameter("id")));
//                request.setAttribute("modelodto", md);
//                RequestDispatcher rd = getServletContext().getRequestDispatcher("/vistaModelo.jsp");
//                rd.forward(request, response);
                break;
            case "Buscar":
                String nombre = request.getParameter("txtbuscar");
                modelo = g.buscarM(nombre);

                request.setAttribute("contador", listaCarrito.size());
                request.setAttribute("modelo", modelo);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                break;
//                
//            case "VistaModelo":
//                int idM = Integer.parseInt((String) request.getParameter("txtId"));
//                request.getParameter("txtNombre");
//                request.getParameter("txtDescripcion");
//                request.getParameter("txtParametros");
//                request.getParameter("txtFecha");
//                Double.parseDouble(request.getParameter("txtPrecio"));
//                Integer.parseInt(request.getParameter("txtValoracion"));
//                Integer.parseInt(request.getParameter("txtDescarga"));
//                request.getParameter("txtImagen");
//
//                g.obtenerModeloPorId(idM);
////                g.modificarModelo(new modelo(idM, nombre, descripcion, parametros, fecha, precio, valoracion, descargas, imagen));
//
//                
//                break;
            case "Comprar":
                totalPagar = 0.0;
                int idModelo = Integer.parseInt(request.getParameter("id"));
                mm = g.obtenerModeloPorId(idModelo);
                if (item == 0) {
                    item = item + 1;
                }
                Carrito car = new Carrito();
                car.setItem(item);
                car.setIdModelo(mm.getIdModelo());
                car.setNombre(mm.getNombre());
                car.setDescripcion(mm.getDescripcion());
                car.setPrecioCompra(mm.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad * mm.getPrecio());
                listaCarrito.add(car);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("totalPagar", totalPagar);
                request.setAttribute("carrito", listaCarrito);
                request.setAttribute("contador", listaCarrito.size());

                request.getRequestDispatcher("carrito.jsp").forward(request, response);

                break;

            case "AgregarCarrito":
                idModelo = Integer.parseInt(request.getParameter("id"));
                mm = g.obtenerModeloPorId(idModelo);
                item = item + 1;

                car = new Carrito();
                car.setItem(item);
                car.setIdModelo(mm.getIdModelo());
                car.setNombre(mm.getNombre());
                car.setDescripcion(mm.getDescripcion());
                car.setPrecioCompra(mm.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad * mm.getPrecio());
                listaCarrito.add(car);
                request.setAttribute("contador", listaCarrito.size());
                request.getRequestDispatcher("carritoServlet?acc=home").forward(request, response);

                break;
            case "Delete":
                int idMod = Integer.parseInt(request.getParameter("id"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getIdModelo() == idMod) {
                        listaCarrito.remove(i);
                    }
                }
                request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
                break;
            case "Carrito":
                totalPagar = 0.0;
                request.setAttribute("carrito", listaCarrito);
                for (int i = 0; i < listaCarrito.size(); i++) {
                    totalPagar = totalPagar + listaCarrito.get(i).getSubTotal();
                }
                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);
                break;
            case "RealizarPago":
                String usr = (String) request.getSession().getAttribute("usuario");

//                for (int i = 0; i < listaCarrito.size(); i++) {
//                    montopagar = montopagar + listaCarrito.get(i).getPrecioCompra();
//                }
                montopagar = totalPagar;
                if (listaCarrito.size() > 0 && montopagar > 0 && usr != null && !usr.equals("")) {
                    if (montopagar > 0) {
                        g.Pagar(montopagar);

                        request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
                    } else {
                        montopagar = 0;
                        request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("/msj/error.jsp").forward(request, response);
                }
                break;
            case "GenerarOrden":
                idpago = g.IdPago();
//                    String usr = (String) request.getSession().getAttribute("usuario");
//                if (usr != null && !usr.equals(""))
                if (listaCarrito.size() != 0 && montopagar > 0) {
                    if (totalPagar > 0.0) {

                        Orden o = new Orden();
//                        metodoPago mp = new metodoPago();
                        int idUser = (int) request.getSession().getAttribute("idUsuario");

//                         int idUser = ul.getId();
//                        
                        o.setIdUsuario(idUser);
                        o.setIdMetodoPago(1);
                        o.setIdPago(idpago);
                        o.setTotal(totalPagar);

                        g.guardarOrden(o);
                        montopagar = 0;

                        idOrden = g.idOrden();
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            detalleOrden dt = new detalleOrden();
                            dt.setIdOrden(idOrden);
                            dt.setIdModelo(listaCarrito.get(i).getIdModelo());
                            dt.setPrecioCompra(listaCarrito.get(i).getPrecioCompra());
                            g.guardarDetalleOrden(dt);

                        }
                        listaCarrito = new ArrayList<>();
                        List Orden = g.misOrdenes(idUser);

                        request.setAttribute("myCompras", Orden);
                        request.getRequestDispatcher("compras.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("carritoServlet?acc=home").forward(request, response);
                    }
                } else {
                    request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
                }
                break;
            case "MisCompras":
                int idUser = (int) request.getSession().getAttribute("idUsuario");

                if (idUser != 0) {
                    List Orden = g.misOrdenes(idUser);
//                    List compra = cdao.misCompras(cl.getId());
                    request.setAttribute("myCompras", Orden);
//                    request.setAttribute("myCompras", compra);
                    request.getRequestDispatcher("compras.jsp").forward(request, response);
                } else if (listaCarrito.size() > 0) {
                    request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
                } else {
                    request.getRequestDispatcher("carritoServlet?acc=home").forward(request, response);
                }
                break;
            case "verDetalle":
                totalPagar = 0.0;
                int idorden = Integer.parseInt(request.getParameter("idorden"));
                List<detalleOrden> detalle = g.Detalle(idorden);
//                List<detalleOrden> detalle = cdao.Detalle(idcompras);
                request.setAttribute("myDetalle", detalle);
                for (int i = 0; i < detalle.size(); i++) {
                    totalPagar = totalPagar + detalle.get(i).getPrecioCompra();
                }
                request.setAttribute("montoPagar", totalPagar);
                request.getRequestDispatcher("detalle.jsp").forward(request, response);
                break;
//            case "GenerarOrden":
//                String usr = (String) request.getSession().getAttribute("usuario");
//                if (usr != null && !usr.equals("")) {
//                    usuario user = new usuario();
////                    user.setId(2003);
//
////                metodoPago mp = new metodoPago();
//                    Orden o = new Orden(3002, 1, totalPagar, 1);
//                    int res = g.guardarOrden(o);
////                    int res = g.GenerarOrden(o);
//                    if (res != 0 && totalPagar > 0) {
//                        request.getRequestDispatcher("msj/mensaje.jsp").forward(request, response);
//                    } else {
//                        request.getRequestDispatcher("msj/errorOrden.jsp").forward(request, response);
//                    }
//                    break;
//                } else {
//                    request.getRequestDispatcher("msj/errorCompra.jsp").forward(request, response);
//                }
            case "nuevos":
                request.setAttribute("modelo", ultimosModelo);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "Mvalor":
                request.setAttribute("modelo", modeloMvalor);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("modelo", modelo);

                request.getRequestDispatcher("index.jsp").forward(request, response);
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
