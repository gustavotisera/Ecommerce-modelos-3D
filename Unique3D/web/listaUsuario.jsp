<%-- 
    Document   : listaModelos
    Created on : 27 abr. 2021, 14:25:06
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.usuario"%>
<%@page session="true"%>
<jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>.::User::.</title>
        <style>
            body{
                background-color: #15202B; color: white;
            }
            .bg-info {
                background-color: #23384e!important;
            }
            h1{margin-top: 30px;}
            nav{
                width: 100%;
                align-self: flex-start;
            }
            .table{


                background: white;
                color: black;
                border: 2px solid;
            }
        </style>
    </head>

    <%
        String user = "";

        HttpSession objSesion = request.getSession();
        String usuario;
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("rol") == "Administrador") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "<label>" + usuario + "</label>";
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("rol") == "Cliente") {
            out.print("<script>location.replace('/Unique3D/menuCliente.jsp');</script>");
        } else {

            out.print("<script>location.replace('/Unique3D/index.jsp');</script>");
        }
    %>
    <body>
        <%@include file="navAdmin.jsp"%>
    <center><h1>Usuarios Registrados</h1></center>

    <div class="container-fluid"> 
        <div class="col-6" style="float:none;margin:auto;"> 
            <table class="table" border="1">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">id</th>
                        <th scope="col">Nombre</th>

                        <th scope="col">email</th>
                        <th scope="col">rol</th>
                        <th scope="col">Accion</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${gestor.obtenerUsuarios}" var="a">
                        <tr>
                            <th scope="row">${a.id}</th> 
                            <th >${a.nombre}</th>                        

                            <td>   ${a.email}  </td>
                            <c:choose>
                                <c:when test="${a.idRol == 1}">
                                    <td>Administrador </td>
                                </c:when>
                                <c:otherwise>
                                    <td>Cliente </td>

                                </c:otherwise>
                            </c:choose>

                            <td><a id="delete" href="/Unique3D/modificarUsuarioServlet?idU=${a.id}" onclick="myFunction()">Modificar</a></td>
                            <td> <a href="/Unique3D/eliminarUsuarioServlet?nom=${a.nombre}">eliminar</a></td>

                        </tr>
                    </c:forEach>

                </tbody>

            </table>
        </div> 
    </div> 



    <script>
        function myFunction() {
            var txt;
            var r = confirm("Press a button!");
            if (r == true) {
                txt = "You pressed OK!";
            } else {
                txt = "You pressed Cancel!";
                event.preventDefault()
            }
            document.getElementById("demo").innerHTML = txt;

    </script>



    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>  
</body>
</html>
