<%-- 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>
        <title>.::DetalleCompra::.</title>
        <style>
            body{background-color: #15202B;
                 display: flex;
                 flex-wrap: wrap;
                 min-height: 100vh;
                 font-family: 'Open Sans', sans-serif;
            }
            nav{
                width: 100%;
                align-self: flex-start;
            }
            .outline-info {

                color: #e9ecef;
                border-color: #990073;

            }
            .outline-info:hover{
                color: #e9ecef;
                background-color: #990073;
            }
            i{
                color: #990073;
            }
            footer{                
                width: 100%;
                align-self: flex-end;
            }
            h2, th, td, label{color: #ffffff;}
            .card{
                background-color: #15202B;
                border: 1px solid #0dcaf0;
            }
            .col-sm-4 {
                flex: 0 0 auto;
                width: 22.2222222222%;
            }
            a{ display: inline-block;}
            h6{color: #20c997;}

        </style>
    </head>
    <body>
        <%@include file="navCliente.jsp"%>

        <div class="container mt-4">                 
            <div class="card"> 
                <div class="card-header d-flex">
                    <h2>Detalle</h2>

                </div>   
                <div class="card-body">
                    <table class="table tab-pane">
                        <thead class="thead-light">
                            <tr class="text-center">
                                <th>CODIGO COMPRA</th>                               
                                <th>MODELO</th>                                
                                <th>Precio Compra</th>                                                   
                                <th>Archivo</th>                                                   
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${myDetalle}">
                                <tr class="text-center">
                                    <td>${p.idOrden}</td> 
                                    <td>                                        
                                        <label>${p.model.nombre}</label><br> 

                                        <img src="${p.model.imagen}" width="80" height="60">
                                    </td>                                                                                               
                                    <td>${p.precioCompra}</td>                                              
                                    <td><a href="carritoServlet?acc=descarga&filename=${p.model.archivo}&idDes=${p.model.nombre}">Descargar</a></td><c:if test="${mensa != null && !mensa.equals('')}"><h6> ${ mensa } </h6></c:if>                  
                                    <%--  <p>${modelod.m.valoracion}</p><a href="carritoServlet?acc=Megusta&idLike=${modelod.m.idModelo}">Me gusta</a><br>--%>    
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table> 
                </div>
                <div class="card-footer d-flex justify-content-center">
                    <label class="col-sm-4  mt-1">Monto Total de la Compra</label>
                    <input type="text" class="form-control text-center w-25" readonly="" value="$.${montoPagar}0">
                </div>
            </div>          
        </div> 
        <%@include file="foot.jsp"%>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    </body>
</html>
