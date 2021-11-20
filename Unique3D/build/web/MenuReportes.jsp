<%-- 
    Document   : MenuReportes
    Created on : 27 jun. 2021, 19:00:06
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
        <title>.::MenuReportes::.</title>
        <style>
            body{
                background-color: #15202B; color:  #15202B;               

                font-family: 'Open Sans', sans-serif;
            }
            .bg-info {
                background-color: #23384e!important;
            }
            .card{
                margin:50px;
                padding: 20px;
                border: 1px solid  #055160;

            }
            .card-header {
                padding: .5rem 1rem;
                margin-bottom: 0;
                background-color: #05516026;
                border-bottom: 1px solid #055160;
            }
            h1{
                color:  floralwhite;
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
        <h1><center>Menu Reportes</center></h1>
        <div class="row">
            <div class="col-sm-6">
                <div class="card text-center text-white bg-dark mb-3">
                    <div class="card-header">
                        <h5 class="card-title">Reporte de Ventas con filtros</h5>
                    </div>
                    <div class="card-body">
                        <p class="card-text">Este reporte informa sobre las ventas con la opcion de filtrar por cliente , modelo y fecha                           </p>
                        <a href="reporteVentas.jsp" class="btn btn-outline-info">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card text-center text-white bg-dark mb-3">
                    <div class="card-header">
                        <h5 class="card-title">Cantidad y monto total  vendidos por modelos  en Rango de fechas</h5>
                    </div>
                    <div class="card-body">             
                        <p class="card-text">Este reporte informa sobre la cantidad de ventas que obtuvo un modelo y su total en un periodo de fechas especificado.</p>
                        <a href="reporte.jsp" class="btn btn-outline-info">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">

                <div class="card text-center text-white bg-dark mb-3">
                    <div class="card-header">
                        <h5 class="card-title">Usuarios que no compraron entre un rango de fechas</h5>
                    </div>
                    <div class="card-body">

                        <p class="card-text">Este reporte informa sobre los usuarios que no han realizado una compra durante un periodo especificado</p>
                        <a href="reporte2.jsp" class="btn btn-outline-info">Ver</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card text-center text-white bg-dark mb-3">
                    <div class="card-header">
                        <h5 class="card-title">Modelo con mas valoracion  en rango de fechas</h5>
                    </div>
                    <div class="card-body">                        
                        <p class="card-text">Este reporte informa sobre los modelos que mas valoracion obtuvieron en un periodo especificado</p>
                        <a href="reporte3.jsp" class="btn btn-outline-info">Ver</a>
                    </div>
                </div>
            </div>
            
        </div>








        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script> 



    </body>
</html>
