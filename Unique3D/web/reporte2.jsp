
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
        <title>.::Reporte2::.</title>
        <style>
            .form-control{
                width: 300px;

            }
            body{
                background-color: #15202B; color: white;
                justify-content: center;
                font-family: 'Open Sans', sans-serif;
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
            .bg-info {
                background-color: #23384e!important;
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
                    <h2 class="text-center p-1">Clientes que no realizaron una compra durante periodo especifico</h2>
                </div>
                <div class="col-6" style="float:none;margin:auto;">
                    <form  class="d-flex text-center p-1" action="/Unique3D/reporte2Servlet">
                        <label for="cboModelo" class="me-2">Fechas</label>
                        <input class="form-control me-2" type="date"  name="txtFec1" id="fec1" placeholder="2021/05/16">
                        <input class="form-control" type="date"  name="txtFec2" id="fec2" placeholder="2021/06/25">
                        <input type="submit" value="buscar" class="btn btn-outline-info m-1">
                    </form>
                </div>
                <div class="col-12 text-center pt-2 mt-2">
                    <button class="btn btn-outline-info me-md-2" onclick="createPDF()" type="button">Exportar PDF</button>
                    <button class="btn btn-outline-info" type="button" onclick="javascript:window.print()">Imprimir</button>
                </div>

            </div>

            <div class="col-6" style="float:none;margin:auto;">
                <div class="card mt-5" id="content">
                    <div class="card-header">
                        <h2 class="card-title">Informe clientes que no realizaron una compra entre un rango de fecha</h2>                       
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table" id="content" border="1">
                            <thead class="table-dark">
                                <tr class="text-center">
                                    <th scope="col">ID</th>
                                    <th scope="col">Nombre</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="r2" >
                                    <tr class="text-center">
                                        <th scope="col">${r2.id}</th>
                                        <th scope="col">${r2.nombre}</th>

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