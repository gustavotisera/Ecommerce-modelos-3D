<%-- 
    Document   : listaModelos
    Created on : 27 abr. 2021, 14:25:06
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.pedido"%>
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
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>
        <script src="js/jquery-3.0.6.min.js" type="text/javascript"></script>
         
        <link href="sweetAlert/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="sweetAlert/sweetalert.js" type="text/javascript"></script>
        


        <title>.::Pedidos::.</title>
        <style>

            i{
                width: 80px;
            }
            a{
                color: #084298;              
            }
            body{
                background-color: #15202B; color: white;
                font-family: 'Open Sans', sans-serif;
            }
            nav{
                width: 100%;
                align-self: flex-start;
            }
            .bg-info {
                background-color: #23384e!important;
            }
            .table{


                background: white;
                color: black;
                border: 2px solid;
            }
            .card{border: 1px solid #212529;}

            .card-title {
                float: left;


                margin: 0;
                color:  #15202B;
            }
            .card-header>.card-tools {
                float: right;
                margin-right: -.625rem;
            }
            .btn{
                color: #084298;
                border: 1px solid #084298;
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
    <center><h1>Pedidos</h1></center>

    <div class="container-fluid ">
        <div class="col-10" style="float:none;margin:auto;"> 
            <div class="card mt-5"> 
                <div class="card-header">
                    <h3 class="card-title">Pedidos Registrados</h3>
                    <div class="card-tools">
                        <div class="input-group input-group-sm" style="width: 300px;">
                            <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                            <div class="input-group-append">
                                <button type="submit" class="btn btn-default">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Presupuesto</th>
                                <th scope="col">Plazo</th>
                                <th scope="col">Nombre y Apellido</th>
                                <th scope="col">Email</th>  
                                <th scope="col">archivo</th>
                                <th scope="col">Accion</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${gestor.obtenerPedido}" var="a" >
                                <tr>
                                    <th scope="row">${a.id}</th> 
                            
                            <td>  ${a.descripcion} </td> 
                            <td>   ${a.presupuesto}  </td>
                            <td>   ${a.plazo}  </td>
                            <td>  ${a.nomApe}  </td> 
                            <td>  ${a.email}  </td>
                                <input hidden="" id="idp" value="${a.id}">
                            <td><a href="listaPedServlet?filename=${a.archivo}">Descargar Archivo</a></td>
                            <td><a href="#" id="btnDelete">Eliminar</a></td>

                            <%--   <a id="deleteUser" href="eliminarPedido?idPed=${a.id}">Eliminar</a> <td>  <img src="${a.archivo}" width="80" height="60"></td>  --%>

                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>

                </div>

            </div>


        </div>
    </div>


<script src="javaS/eliminarPedido.js" type="text/javascript"></script>
   
    
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>  
</body>
</html>