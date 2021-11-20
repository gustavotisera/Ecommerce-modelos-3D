<%-- 
    Document   : reporte
    Created on : 16 jun. 2021, 14:38:37
    Author     : usuario
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <style>
            body{
                background-color: #15202B; color: white;
                justify-content: center;
                font-family: 'Open Sans', sans-serif;
            }

            .bg-info {
                background-color: #23384e!important;
            }
            .form-control{
                width: 300px;

            }

            .container{
                align-content: center;

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
        <title>.::Reporte1::.</title>
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
                    <h2 class="text-center p-1">Cantidad de Ventas de modelos y su total en Rango de fechas</h2> 
                    
                    <form action="/Unique3D/reporteServlet" class="d-flex justify-content-lg-center p-1">

                        <label for="cboModelo">Fechas</label>
                        <input class="form-control me-2" type="date"  value="${f1}" name="fec1" required="" placeholder="2021/05/16">
                        <input class="form-control  me-2" type="date" value="${f2}"  name="fec2"  required="" placeholder="2021/06/25">

                        <input type="submit" value="buscar" class="btn btn-outline-info">
                    </form>

                </div>
                <div class="col-12 pt-1 text-center">
                    <button class="btn btn-outline-info me-md-2" onclick="createPDF()" type="button">Exportar PDF</button>
                    <button class="btn btn-outline-info" type="button" onclick="javascript:window.print()">Imprimir</button>
                </div>
            </div>



            <div class="row">
                <div class="card mt-5" id="content">
                    <div class="card-header">
                        <h2 class="card-title">Informe Cant. y total Ventas por modelo entre rango de fechas </h2>

                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover " >
                            <thead class="table-dark">
                                <tr class="text-center">
                                    <th>Modelo</th>  
                                    <th>Cantidad de Ventas</th>                                                                                                                                    
                                    <th>SubTotal</th>                                                                                                                               

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${lista}">
                                    <tr class="text-center">
                                        <td class="table-light">${p.nombreModelo}</td>
                                        <td class="table-light"> ${p.cantVtas}</td>                                                              
                                        <td class="table-light">${p.subTotal}</td>                                                                                                       

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>    
                    </div>

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
