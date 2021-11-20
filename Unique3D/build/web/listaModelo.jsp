<%-- 
    Document   : listaModelos
    Created on : 27 abr. 2021, 14:25:06
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.modelo"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>
        <title>.::Modelos::.</title>
        <style>

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

            .btn{
                color: #084298;
                border: 1px solid #084298;
            }
            .outline-info {
                color: #e9ecef;
                border-color: #084298;

            }
            .outline-info:hover{
                color: #e9ecef;
                background-color: #084298;
            }
            a{
                color: #084298;              
            }
            i{
                width: 80px;
            }
            .card-title {
                float: left;
                font-size: 1.1rem;
                font-weight: 400;
                margin: 0;
                color:  #15202B;
            }
            .card-header>.card-tools {
                float: right;
                margin-right: -.625rem;
            }
            .modal-content {
                position: relative;
                display: flex;
                flex-direction: column;
                width: 100%;
                pointer-events: auto;
                background-color: #212529;
                background-clip: padding-box;
                border: 1px solid rgba(0,0,0,.2);
                border-radius: .3rem;
                outline: 0;
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
    <center><h1>Modelos Registrados</h1></center>
    <a href="/Unique3D/altaModelo.jsp" class="btn outline-info ms-3">Alta Modelo</a> <p id="demo"></p>

    <div class="container-fluid">

        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Modelos Registrados</h3>
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
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>

                                <th scope="col">id</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Fecha de Publicacion</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Valoracion</th>
                                <th scope="col">Cant descargas</th>   
                                <th scope="col">imagen</th> 
                                <th scope="col">archivo</th> 
                                <th scope="col">Info</th>
                                <th scope="col">Modificar</th>
                                <th scope="col">Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="a" varStatus="b">

                                <tr>
                                    <th scope="row">${a.idModelo}</th> 
                                    <th>${a.nombre}</th>                                                          
                                    <td>   ${a.fecha}  </td>
                                    <td>  ${a.precio}  </td>  
                                    <td>  ${a.valoracion}  </td> 
                                    <td>  ${a.descargas}  </td>
                                    <td>  ${a.imagen}  </td> 
                                    <td>  ${a.archivo}  </td> 

                                    <td><a href="${b.index}" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-info-circle"></i></i></a></td>
                                    <td><a href="/Unique3D/modificarModeloServlet?id=${a.idModelo}" ><i class="far fa-edit" title="Modificar"></i></a></td>

                                    <td><a href="/Unique3D/eliminarModeloServlet?id=${a.idModelo}"><i class="far fa-trash-alt" title="Eliminar"></a></td>   

                                </tr>


                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <c:choose>
                                            <c:when test="${b.index == 0}">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="${b.index}">${b.current.nombre}</h5>

                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">

                                                    <img src="${a.imagen}" width="80" height="60">
                                                    <p>${a.descripcion}</p>
                                                    <p>${a.parametros}</p>

                                                </div>
                                            </c:when>
                                        </c:choose>



                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>


                        </tbody>
                    </table>
                </div>


                <!-- Button trigger modal -->


                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>

    </div>








    <script>
        function myFunction() {
            var txt;
            var r = confirm("Estas Seguro de Eliminar este Modelo!");
            if (r == true) {
                txt = "El Modelo Se ha eliminado correctamente!";
            } else {
                txt = "";
            }
            document.getElementById("demo").innerHTML = txt;
        }
    </script>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
