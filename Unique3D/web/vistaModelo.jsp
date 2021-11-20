
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="g" scope="request" class="gestor.GestorDB"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>
        <title>.::Modelo::.</title>
        <style>
            body{
                color: #e9ecef  !important ; 
                background-color: #1f1f28 !important;
                font-family: 'Open Sans', sans-serif;
            }
            nav{
                width: 100%;             
                padding: 1em;
                align-self: flex-start;
            }
            .contenedor{
                margin-top: 50px;
                min-height: calc(79% - 4rem);
                display: flex;
                flex-wrap: wrap;

            }
            .contenedor-item{

                border: 1px solid white;
                padding: 50px;
                margin: 15px;
                height: 600px;
                width: 600px;
            }
            foot{
               width: 100%;           
                align-self: flex-end;
                text-align: center;


            }
            img{
                width:400px; 
                height:350px;
                border-radius: 5px;
                border: 1px solid #990073;
                object-fit: cover;            
            }

            b{
                color: #a30196;


            }
            h4{
                color:  #e9ecef;

            }
            .outline-info {
                color: #e9ecef !important;
                border-color: #990073 !important;

            }
            .outline-info:hover{
                background-color: #990073;
            }

            small{
                color: #e9ecef;
            }
            i{
                color: #990073;
            }
            .cont-info{
                align-items: center;
            }


        </style>
    </head>
    <body>
        <%@include file="navCliente.jsp"%>
        <%--        <form method="POST" action="/Unique3D/carritoServlet?acc=VistaModelo"> --%>
        <%--    <input type="hidden" name="txtId" value="${modelodto.m.idModelo}"/>--%>
        <c:if test="${ErrorCarrito != null && !ErrorCarrito.equals('')}">
            <small style="color:red;"> ${ ErrorCarrito}</small>
        </c:if>
        <div class="contenedor">
            <div class="contenedor-item text-center">
                <div class="cont-info">
                    <h4>${modelod.m.nombre}</h4>       

                    <img class="painting-image" alt="" data-action="" src="${modelod.m.imagen}" >
                    <br><br>
                    <a href="carritoServlet?acc=AgregarCarrito&id=${modelod.m.idModelo}" class="btn outline-info">Agregar a Carrito</a>
                    <a href="carritoServlet?acc=Comprar&id=${modelod.m.idModelo}" class="btn outline-info">Comprar</a>
                    <a href="carritoServlet?acc=home" class="btn outline-info">Volver</a>
                </div>


            </div>
            <div class="contenedor-item">

                <b>Descripcion: </b>
                <p>${modelod.m.descripcion} </p>
                <b>Parametros: </b><p>${modelod.m.parametros}</p>

                <b>Fecha: </b>
                <p>${modelod.m.fecha}</p>
                <b>Precio: </b><p>${modelod.m.precio}</p>



                <b>Valoracion: </b> <a href="carritoServlet?acc=Megusta&idLike=${modelod.m.idModelo}"><i class="far fa-thumbs-up" style="padding: 10px;" title="Me gusta"></i></a>
                    <c:if test="${msj != null && !msj.equals('')}">
                    <small> ${ msj } </small>
                </c:if>
                <p>${modelod.m.valoracion}</p><br>
                <b>Descargas: </b>
                <p>${modelod.m.descargas}</p><br>


            </div>
        </div>

        <div class="foot">
            <%@include file="foot.jsp"%>  
        </div>



        <%--    </form>--%>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script> 
    </body>
</html>