<%-- 
    Document   : reporte3
    Created on : 20 jun. 2021, 14:46:39
    Author     : usuario
--%>

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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>



        <title>.::Reporte3::.</title>
        <style>
            .form-control{
                width: 300px;

            }
            body{
                background-color: #15202B; color: white;
                justify-content: center;
                font-family: 'Open Sans', sans-serif;
            }
            .bg-info {
                background-color: #23384e!important;
            }
            .d-flex{
                
                margin-top: 50px;
                margin-bottom: 50px;
            }
            
            .card-header {
                background-color: #dee2e6;
                border-bottom: 1px solid rgba(0,0,0,.125);
                padding: .75rem 1.25rem;
                position: relative;
                border-top-left-radius: .25rem;
                border-top-right-radius: .25rem;
            }
            .card-title {
                color: #15202B;
                float: left;
                font-size: 1.1rem;
                font-weight: 400;
                margin: 0;
            }
            label{margin:10px;}
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
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1>Modelos con mas cantidad de Me gusta en un periodo</h1>
                </div>
                <div class="col-6" style="float:none;margin:auto;">
                    <form  class="d-flex text-center" action="/Unique3D/reporte3Servlet">
                        <label>Fechas</label>
                        <input class="form-control me-2" type="date"  name="txtFec1" id="fec1" placeholder="2021/05/16">
                        <input class="form-control me-2" type="date"  name="txtFec2" id="fec2" placeholder="2021/06/25">

                        <input type="submit" value="buscar" class="btn btn-outline-info">
                    </form>
                </div>
                <div class="col-12 text-center pt-2 mt-2">
                    <button class="btn btn-outline-info me-md-2" onclick="createPDF()" type="button">Exportar PDF</button>
                    <button class="btn btn-outline-info" type="button" onclick="javascript:window.print()">Imprimir</button>
                </div>


            </div>
        </div>




        <div class="col-6" style="float:none;margin:auto;">
            <div class="card mt-5" id="content">
                <div class="card-header">
                    <h2 class="card-title">Cantidad de megusta por modelos entre rango de fecha</h2>

                </div>
                <div class="card-body table-responsive p-0">
                    <table class="table" border="1">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">descripcion</th>
                                <th scope="col">Fecha publicacion</th>
                                <th scope="col">Valoracion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="r3" >
                                <tr>
                                    <th scope="col">${r3.nombre}</th>
                                    <td>${r3.descripcion} </td> 
                                    <td>${r3.fechapublicacion}  </td>
                                    <td>${r3.valoracion}</td>
                                </tr> 
                            </c:forEach>
                        </tbody>
                    </table>

                </div>

            </div>
        </div>





        <script>
            function createPDF() {
                var pdf = document.getElementById("content");
                var opt = {
                    margin: 1,
                    filename: 'html2pdf-converted.pdf',
                    image: {type: 'jpeg', quality: 1},
                    html2canvas: {scale: 2},
                    jsPDF: {unit: 'in', format: 'a4', orientation: 'portrait'}
                };
                html2pdf().set(opt).from(pdf).save();
            }
        </script>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
