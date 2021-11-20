/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import gestor.GestorDB;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Carrito;
import modelo.CarritoBD;
import modelo.Fecha;
import modelo.Orden;
import modelo.carritoDTO;
import modelo.detalleOrden;
import modelo.metodoPago;
import modelo.modelo;
import modelo.modeloDTO;
import modelo.usuario;

/**
 *
 * @author usuario
 */
public class carritoServlet extends HttpServlet {

    GestorDB g = new GestorDB();
    modelo mm = new modelo();
    usuario u = new usuario();
    ArrayList<modelo> modelo = g.ObtenerModelo();
    ArrayList<modelo> ultimosModelo = g.ultimos6Modelos();
    ArrayList<modelo> modeloMvalor = g.modelosMvalor();
    ArrayList<modelo> modeloBuscados;

    List<carritoDTO> listaCarrito = new ArrayList<>();
    int item;
    double totalPagar = 0.0;
    int cantidad = 1;
    int ordenV = 0;
    int idOrden;
    int idpago;
    double montopagar;
    int idModD;

    int page;
    int idModelo;
    CarritoBD car;

    Fecha fechaSistem = new Fecha();

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
                String nombre = request.getParameter("txtBuscar");
                if (nombre != null) {
                    modeloBuscados = g.buscarM(nombre);

                    request.setAttribute("footer", 1);
                    request.setAttribute("modelo", modeloBuscados);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    System.err.print("Error");
                }
//                request.setAttribute("contador", listaCarrito.size());               
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
                String usrrr = (String) request.getSession().getAttribute("usuario");
                idModelo = Integer.parseInt(request.getParameter("id"));

                if (usrrr != null && !usrrr.equals("")) {
                    int idUsuario = (int) request.getSession().getAttribute("idUsuario");
                    mm = g.obtenerModeloPorId(idModelo);
//                    int existe = g.ifExiste(idModelo);
//                    if (existe != 0) {
//                        request.getRequestDispatcher("/msj/errorCompra.jsp").forward(request, response);
//                    } else {
                    if (g.existeCarrito(idUsuario, idModelo) == false) {
                        CarritoBD carr = new CarritoBD();

                        carr.setIdUsuario(idUsuario);
                        carr.setIdModelo(idModelo);
                        carr.setSubTotal(mm.getPrecio());
                        g.guardarCarrito(carr);
//               
                        listaCarrito = g.listaCarritoUsuario(idUsuario);

                        request.setAttribute("contador", listaCarrito.size());
                        request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
                    } else {
                        request.setAttribute("ErrorCarrito", "Modelo ya esta en carrito");
                        request.getRequestDispatcher("carritoServlet?acc=Vista").forward(request, response);
                    }

                } else {
                    request.getRequestDispatcher("/msj/errorCompra.jsp").forward(request, response);
                }
                break;

            case "AgregarCarrito":
                String usrr = (String) request.getSession().getAttribute("usuario");
                idModelo = Integer.parseInt(request.getParameter("id"));

                if (usrr != null && !usrr.equals("")) {
                    int idUsuario = (int) request.getSession().getAttribute("idUsuario");
                    mm = g.obtenerModeloPorId(idModelo);

                    if (g.existeCarrito(idUsuario, idModelo) == false) {
                        CarritoBD carr = new CarritoBD();

                        carr.setIdUsuario(idUsuario);
                        carr.setIdModelo(idModelo);
                        carr.setSubTotal(mm.getPrecio());
                        g.guardarCarrito(carr);
//               
                        listaCarrito = g.listaCarritoUsuario(idUsuario);
                        request.setAttribute("alerta", "<script>swal('El modelo se agrego correctamente');</script>");
                        request.setAttribute("contador", listaCarrito.size());
                        
                        request.getRequestDispatcher("carritoServlet?acc=home").forward(request, response);
                    } else {
                        request.setAttribute("ErrorCarrito", "Modelo ya esta en carrito");
                        request.getRequestDispatcher("carritoServlet?acc=home").forward(request, response);
                    }

                } else {
                    request.getRequestDispatcher("/msj/errorCompra.jsp").forward(request, response);
                }
//                listaCarrito.add(carr);
//                car.setItem(item);
//                car.setIdModelo(mm.getIdModelo());
//                car.setNombre(mm.getNombre());
//                car.setDescripcion(mm.getDescripcion());
//                car.setPrecioCompra(mm.getPrecio());
//                car.setCantidad(cantidad);
//                car.setSubTotal(cantidad * mm.getPrecio());
//                listaCarrito.add(car);
//                  ArrayList<usuario> lista = g.ObtenerUsuarios();
//                request.setAttribute("lista", lista);
//
//                RequestDispatcher rd = getServletContext().getRequestDispatcher("/listaUsuario.jsp");
//                rd.forward(request, response);

                break;
            case "Delete":
//                int idMod = Integer.parseInt(request.getParameter("id"));

//                request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
                int idC = Integer.parseInt(request.getParameter("id"));
                for (int i = 0; i < listaCarrito.size(); i++) {
                    if (listaCarrito.get(i).getItem() == idC) {
    //                        request.setAttribute("alertDcar", "<script>swal('El modelo se elimino correctamente!');</script>");
                        request.setAttribute("alertDcar", "a");
                        g.eliminaCarrito(idC);
                        
                    }
                }

                request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
                break;
            case "Carrito":
                String us = (String) request.getSession().getAttribute("usuario");
                if (us != null && !us.equals("")) {
                    double descuento = 0.0;
                    double subTotal = 0.0;
                    totalPagar = 0.0;
                    int idUsua = (int) request.getSession().getAttribute("idUsuario");
                    listaCarrito = g.listaCarritoUsuario(idUsua);
                    request.setAttribute("carrito", listaCarrito);
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        if(listaCarrito.size()>= 3){
                            descuento = 0.1;
                            
                        }
                        subTotal = subTotal + listaCarrito.get(i).getPrecio();
                        totalPagar = subTotal - (subTotal *descuento);
//                        totalPagar = totalPagar - ( totalPagar*descuento);
                    }

                    if (descuento != 0) {
                        descuento += 10;
                    }
                    request.setAttribute("subT", subTotal);
                    request.setAttribute("desc", descuento);
                    request.setAttribute("totalPagar", totalPagar);
                    request.getRequestDispatcher("carrito.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("/msj/errorCompra.jsp").forward(request, response);
                }
                break;
//            case "RealizarPago":
//                String usr = (String) request.getSession().getAttribute("usuario");
//
////                for (int i = 0; i < listaCarrito.size(); i++) {
////                    montopagar = montopagar + listaCarrito.get(i).getPrecioCompra();
////                }
//                montopagar = totalPagar;
//                if (listaCarrito.size() > 0 && montopagar > 0 && usr != null && !usr.equals("")) {
//                    if (montopagar > 0) {
//                        g.Pagar(montopagar);
//
//                        request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
//                    } else {
//                        montopagar = 0;
//                        request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
//                    }
//                } else {
//                    request.getRequestDispatcher("/msj/error.jsp").forward(request, response);
//                }
//                break;
//            case "GenerarOrden":
//                
//                idpago = g.IdPago();
////                    String usr = (String) request.getSession().getAttribute("usuario");
////                if (usr != null && !usr.equals(""))
//                if (listaCarrito.size() != 0 && montopagar > 0) {
//                    if (totalPagar > 0.0) {
//
//                        Orden o = new Orden();
////                        metodoPago mp = new metodoPago();
//                        int idUser = (int) request.getSession().getAttribute("idUsuario");
//
////                         int idUser = ul.getId();
////                        
//                        o.setIdUsuario(idUser);
//                        o.setIdMetodoPago(1);
//                        o.setIdPago(idpago);
//                        o.setTotal(totalPagar);
//
//                        g.guardarOrden(o);
//                        montopagar = 0;
//
//                        idOrden = g.idOrden();
//                        for (int i = 0; i < listaCarrito.size(); i++) {
//                            detalleOrden dt = new detalleOrden();
//                            dt.setIdOrden(idOrden);                            
////                            dt.setIdModelo(listaCarrito.get(i).getIdModelo());                             
//                            dt.setPrecioCompra(listaCarrito.get(i).getPrecio());
//                            g.guardarDetalleOrden(dt);
//
//                        }
//                        listaCarrito = new ArrayList<>();
//                        List Orden = g.misOrdenes(idUser);
//
//                        
//                        request.setAttribute("myCompras", Orden);
//                        request.getRequestDispatcher("compras.jsp").forward(request, response);
//                    } else {
//                        request.getRequestDispatcher("carritoServlet?acc=home").forward(request, response);
//                    }
//                } else {
//                    request.getRequestDispatcher("carritoServlet?acc=Carrito").forward(request, response);
//                }
//                break;
            case "RealizarCompra":
//                           
                String usr = (String) request.getSession().getAttribute("usuario");

                montopagar = totalPagar;
                if (listaCarrito.size() > 0 && montopagar > 0 && usr != null && !usr.equals("")) {
                    g.Pagar(montopagar);

                    idpago = g.IdPago();

                    Orden o = new Orden();

                    int idUser = (int) request.getSession().getAttribute("idUsuario");

                    o.setIdUsuario(idUser);
                    o.setIdMetodoPago(1);
                    o.setIdPago(idpago);
                    o.setTotal(totalPagar);
                    o.setFecha(fechaSistem.FechaBD());

                    g.guardarOrden(o);

                    montopagar = 0;

                    idOrden = g.idOrden();
                    request.setAttribute("codCompra", idOrden);
                    for (int i = 0; i < listaCarrito.size(); i++) {
                        detalleOrden dt = new detalleOrden();
                        dt.setIdOrden(idOrden);
//                        dt.setIdModelo(idModelo);
                        dt.setIdModelo(listaCarrito.get(i).getIdModelo());
                        dt.setPrecioCompra(listaCarrito.get(i).getPrecio());
                        g.guardarDetalleOrden(dt);
                    }
                    listaCarrito = new ArrayList<>();

                    g.LimpiarCarrito(idUser);

                    List Orden = g.misOrdenes(idUser);

                    request.setAttribute("myCompras", Orden);

//                    response.sendRedirect ("SendMail");
//                    request.getRequestDispatcher("SendMail").forward(request, response);
                    request.getRequestDispatcher("compras.jsp").forward(request, response);

                } else {
                    request.getRequestDispatcher("/msj/error.jsp").forward(request, response);
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
                    idModD = detalle.get(i).getIdModelo();
                    totalPagar = totalPagar + detalle.get(i).getPrecioCompra();
                }

                request.setAttribute("idModD", idModD);
                request.setAttribute("montoPagar", totalPagar);
                request.getRequestDispatcher("detalle.jsp").forward(request, response);
                break;
            case "descarga":

                g.incrementarDescarga(request.getParameter("idDes"));
//                    
                request.setAttribute("mensa", "descargado!");

                try (PrintWriter out = response.getWriter()) {

//                   
                    String name = request.getParameter("filename");
                    String path = getServletContext().getRealPath("/" + File.separator + name);
//            out.println(path);

                    response.setContentType("APPLICATION/OCTET-STREAM");

                    response.setHeader("Content-Disposition", "attachment; filename=\"" + path + "\"");

                    FileInputStream ins = new FileInputStream(path);

                    int i;

                    while ((i = ins.read()) != -1) {
                        out.write(i);
                    }
                    ins.close();
                    out.close();

                }

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
                request.setAttribute("footer", 1);
                request.setAttribute("modelo", ultimosModelo);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "Mvalor":
                request.setAttribute("footer", 1);
                request.setAttribute("modelo", modeloMvalor);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "pag":
                int maxp = 6;
                int minp = 0;
                boolean active = false;
                request.setAttribute("footer", 1);
//                page = 0;
                int pp = Integer.parseInt(request.getParameter("pp")); // pp= parametro de paginacion

                switch (pp) {
                    case 1:

                        page = 1;
                        request.setAttribute("pag", page);
                        request.setAttribute("modelo", modelo);
                        request.setAttribute("active", "active");

                        break;
                    case 2:
                        page = 2;
                        request.setAttribute("pag", page);
                        request.setAttribute("modelo", modelo);
                        request.setAttribute("active2", "active");
                        break;
                    case 3:
                        page = 3;
                        request.setAttribute("pag", page);
                        request.setAttribute("modelo", modelo);
                        request.setAttribute("active3", "active");
                        break;
                    case 0:

                        page = page - 1;
                        request.setAttribute("pag", page);
                        request.setAttribute("modelo", modelo);
                        break;
                    case 5:
                        page = page + 1;
                        request.setAttribute("pag", page);
                        request.setAttribute("modelo", modelo);
                        break;

                    default:

                }
//                if (pp == 1) {
//                    page = 1;
//                    request.setAttribute("pag", page);
//                    request.setAttribute("modelo", modelo);
//                } else if (pp == 2) {
//                    page = 2;
//                    request.setAttribute("pag", page);
//                    request.setAttribute("modelo", modelo);
//                }

                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("footer", 1);
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
