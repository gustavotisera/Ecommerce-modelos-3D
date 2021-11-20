<%-- 
    Document   : listaCarrito
    Created on : 3 jun. 2021, 14:28:23
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
        <title>JSP Page</title>
    </head>
    <%
        String id = "";
        //   HttpSession objSesion = request.getSession();
        //    String id = ""; 

        //    id = objSesion.getAttribute("idUsuario").toString(); 
        String user = "";
        String email = "";
        HttpSession objSesion = request.getSession();
        String usuario;

        if (objSesion.getAttribute("usuario") != null) {
            usuario = objSesion.getAttribute("usuario").toString();
            id = objSesion.getAttribute("idUsuario").toString();
            email = objSesion.getAttribute("email").toString();
        } else {
            out.print("<script>alert('debes iniciar Sesion');</script>");
        }

    %>
    <body>
        <%@include file="navCliente.jsp"%>
        <div class="container mt-4">
            <h3>Carrito</h3>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ITEM</th>
                                <th>NOMBRES</th>
                                <th>DESCRIPCION</th>
                                <th>PRECIO</th>
                                    <%--  <th>CANT</th>--%>
                                    <%--  <th>SUBTOTAL</th>--%>
                                <th>ACCION</th>
                            </tr>                        
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${carrito}">
                                <tr>
                                    <td>${car.imagen}</td>
                                    <td>${car.nombre}</td>
                                    <td>${car.descripcion}</td>
                                    <td>${car.precio}</td>
                                    <%--   <td>${car.cantidad}</td>--%>
                                    <%-- <td>${car.subTotal}</td>  --%> 
                                    <td>
                                        <%--   <input type="hidden" id="idModelo" value="${car.idModelo}">
                                         <a href="carritoServlet?acc=Delete&id=${car.idModelo}" id="btnDelete">Eliminar</a>--%> 

                                    </td>

                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>














            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="js/bootstrap.min.js"></script>
    </body>

</html>
