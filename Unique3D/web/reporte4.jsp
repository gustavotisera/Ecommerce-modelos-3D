
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>.::Reporte4::.</title>
        <style>
            .form-control{
                width: 100px;

            }
            .bg-info {
                background-color: #23384e!important;
            }
            .d-flex{
                margin-left: 300px;
                margin-top: 50px;
                margin-bottom: 50px;
            }
            .table{
                width: 80%;
                margin-left: 120px;
            }
        </style>
    </head>
    <%

        String id = "";
        String user = "";
        String email = "";
        String rol = "";
        HttpSession objSesion = request.getSession();
        String usuario;
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("rol") == "Administrador") {
            usuario = objSesion.getAttribute("usuario").toString();
            id = objSesion.getAttribute("idUsuario").toString();
            email = objSesion.getAttribute("email").toString();
            rol = objSesion.getAttribute("rol").toString();
            user = "<label>" + usuario + "</label>";
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("rol") == "Cliente") {
            out.print("<script>location.replace('/Unique3D/menuCliente.jsp');</script>");
        } else {
            out.print("<script>location.replace('/Unique3D/index.jsp');</script>");
        }

    %>
    <body>
        <%@include file="navAdmin.jsp"%> 
    <center><h1>Total Ventas , maximo y minimo vendido por mes en un periodo especificado</h1></center>


    <form class="d-flex" action="/Unique3D/reporte4Servlet">

        <input class="form-control me-2" type="text"   name="txtAño" id="txtAño" placeholder="2021">        

        <input type="submit" value="buscar" class="btn btn-outline-info">

    </form>
    <table class="table" border="1">
        <thead class="table-dark">
            <tr>
                <th scope="col">Mes</th>
                <th scope="col">Total</th>
                <th scope="col">MaxVenta</th>
                <th scope="col">MinVenta</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${lista}" var="r4" >
                <tr>
                    <td>${r4.Mes}</td>
                    <td>${r4.Total}</td>
                    <td>${r4.maximo}</td>
                    <td>${r4.minimo}</td>
                </tr> 
            </c:forEach>
        </tbody>
    </table>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>