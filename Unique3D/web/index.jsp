<%@page import="java.util.ArrayList"%>
<%@page import="modelo.modelo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
            
            h1{
                color: white;
                text-align: center;
            }
            nav{
                width: 100%;             
                padding: 1em;
                align-self: flex-start;
            }
            .footer2{            
                width: 100%;
                align-self: flex-end;
                text-align: center;

            }
            .footer1 {            
                width: 100%;           
                position:relative;
                bottom:0;
                
            }
            body{
                margin:0;
                padding: 0;
                display:flex;
                min-height: 100vh;
                flex-wrap: wrap;
                background-color: #1f1f28;
                font-family: 'Open Sans', sans-serif;

            }
            div{
                background-color: #1f1f28;
            }

            .card{color:#e600ac; margin: 10px; border: 2px solid #990073;}
            .card-header{ background-color: #1f1f28;}
            .card-footer{background-color: #1f1f28;}

            h4 ,label{color: #dee2e6; }
            b{color: #e9ecef;}
            div.card{
                color: #e600ac;
            }
            .outline-info {
                color: #e9ecef;
                border-color: #990073;

            }
            .outline-info:hover{
                color: #e9ecef;
                background-color: #990073;
            }
            a{
                color: #990073;              
            }
            .card-body img{
                width:300px; 
                height:250px;
                border-radius: 5px;
                border: 1px solid #990073;
                object-fit: cover;            
            }
            i{
                color: #990073;
            }
            h2{
                color: #dee2e6;
                text-align: center;
            }
            .page-link{
                background-color: #1f1f28;
                color: #f9fafb;
                border: 1px solid #990073;
            }
            .page-link:hover{
                color: #e9ecef;
                background-color: #990073;
                border: 1px solid #990073;
            }
            .dropdown-menu{

                background-color: #1f1f28;
            }
            .dropdown-item{
                color: #f9fafb;
            }
            .page-item.active .page-link {
                z-index: 3;
                color: #fff;
                background-color: #990073;
                border-color: #990073;
            }
            .swal-text {
                font-size: 20px;
                color: #e9ecef;

            }
            .swal-modal {

                background-color: #1f1f28;

            }
            .swal-overlay--show-modal .swal-modal {
                border: 1px solid #990073;

            }



        </style>
        <title>.::Index::.</title>
    </head>   
    <%
        String id = "";
        String user = "";
        String email = "";
        String rol = "";
        HttpSession objSesion = request.getSession();
        String usuario;

        if (objSesion.getAttribute("usuario") != null) {
            usuario = objSesion.getAttribute("usuario").toString();
            id = objSesion.getAttribute("idUsuario").toString();
            email = objSesion.getAttribute("email").toString();
            rol = objSesion.getAttribute("rol").toString();
        }
    %>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <c:choose>
                    <c:when test="${rol.equals('Administrador')}">
                        <a class="navbar-brand" href="/Unique3D/menuAdmin.jsp">Menu Admin</a>
                    </c:when>
                    <c:otherwise>
                        <a class="navbar-brand" href="/Unique3D/index.jsp">Unique3d Store</a>

                    </c:otherwise>
                </c:choose>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="carritoServlet?acc=home">Ver Modelos</a>
                        </li>
                        <c:if test="${footer != 0}">
                            <li class="nav-item">
                                <a class="nav-link" href="carritoServlet?acc=Carrito"><i class="fas fa-cart-plus">(${contador})</i></a>
                            </li> 
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link active" href="/Unique3D/pedido.jsp">Diseño a pedido</a>
                        </li>
                    </ul>
                    <form action="/Unique3D/carritoServlet" class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Buscar" name="txtBuscar" aria-label="Search">
                        <input class="btn outline-info" name="acc" value="Buscar" type="submit">
                    </form>

                    <ul class="navbar-nav">
                        <li class="nav-item dropdown drop-left">
                            <a class="nav-link  dropdown-toggle" href=""  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <c:choose>
                                    <c:when test="${ not empty usuario}">${usuario}</c:when>
                                    <c:otherwise>Iniciar Sesion</c:otherwise>
                                </c:choose>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <c:choose>
                                        <c:when test="${ not empty usuario}"><a class="dropdown-item" href="/Unique3D/cuentaUsuario.jsp">Cuenta</a></c:when>
                                        <c:otherwise><a class="dropdown-item" href="/Unique3D/login.jsp">Ingresar</a></c:otherwise>
                                    </c:choose>
                                </li>
                                <li> <c:choose>
                                        <c:when test="${ not empty usuario}"><a class="dropdown-item" href="/Unique3D/cerrarSesion.jsp">Cerrar Sesion</a></c:when>
                                        <c:otherwise><a class="dropdown-item" href="/Unique3D/altaUsuarioServlet">Registrarse</a></c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>  

                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <c:if test="${not empty alerta}"> 
            ${alerta}
        </c:if>
        <div class="container" id="contenedor">
            <c:if test="${ footer == 1}">
                <div class="d-flex justify-content-start ms-4"><a class="btn outline-info m-1" href="carritoServlet?acc=nuevos">Ultimos modelos</a><a  class="btn outline-info m-1" href="carritoServlet?acc=Mvalor">Modelos con mejor valoracion</a></div>
            </c:if>  

            <c:if test="${ErrorCarrito != null && !ErrorCarrito.equals('')}">
                <small style="color:red;"> ${ErrorCarrito}</small>
            </c:if>
            <div class="row m-2">
                <c:choose>
                    <c:when test="${pag == 1}">

                        <c:forEach var="m" items="${modelo}" begin="6" end="11">
                            <div class="col-md-6 col-lg-6 col-xl-4">
                                <div class="form-group">
                                    <div class="card h-100 m-2">
                                        <div class="card-header text-left">
                                            <h4>${m.nombre}</h4>                                    
                                        </div>
                                        <div class="card-body text-center">
                                            <img class="img-fluid" src="${m.imagen}"><br>
                                        </div>
                                        <div class="card-footer text-center">
                                            <label>Precio: <b>${m.precio}</b></label>

                                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b>

                                            <div class="d-flex justify-content-center">
                                                <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info m-1">Agregar a Carrito</a>
                                                <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info m-1">Ver Modelo</a>
                                                <%--     <a href="carritoServlet?acc=Comprar&id=${m.idModelo}" class="btn btn-outline-danger">Comprar</a>--%>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                        </c:forEach>
                    </c:when>

                    <c:when test="${pag == 2}">
                        <c:forEach var="m" items="${modelo}" begin="12" end="17">
                            <div class="col-md-6 col-lg-6 col-xl-4">
                                <div class="form-group">
                                    <div class="card h-100 m-2">
                                        <div class="card-header text-left">
                                            <h4>${m.nombre}</h4>                                    
                                        </div>
                                        <div class="card-body text-center">
                                            <img class="img-fluid" src="${m.imagen}"><br>
                                        </div>
                                        <div class="card-footer text-center">
                                            <label>Precio: <b>${m.precio}</b></label>

                                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b>

                                            <div class="d-flex justify-content-center">
                                                <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info m-1">Agregar a Carrito</a>
                                                <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info m-1">Ver Modelo</a>
                                                <%--     <a href="carritoServlet?acc=Comprar&id=${m.idModelo}" class="btn btn-outline-danger">Comprar</a>--%>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                        </c:forEach>
                    </c:when>
                    <c:when test="${pag == 3}">
                        <c:forEach var="m" items="${modelo}" begin="18" end="23">
                            <div class="col-md-6 col-lg-6 col-xl-4">
                                <div class="form-group">
                                    <div class="card h-100 m-2">
                                        <div class="card-header text-left">
                                            <h4>${m.nombre}</h4>                                    
                                        </div>
                                        <div class="card-body text-center">
                                            <img class="img-fluid" src="${m.imagen}"><br>
                                        </div>
                                        <div class="card-footer text-center">
                                            <label>Precio: <b>${m.precio}</b></label>

                                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b>

                                            <div class="d-flex justify-content-center">
                                                <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info m-1">Agregar a Carrito</a>
                                                <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info m-1">Ver Modelo</a>
                                                <%--     <a href="carritoServlet?acc=Comprar&id=${m.idModelo}" class="btn btn-outline-danger">Comprar</a>--%>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                        </c:forEach>
                    </c:when>                    

                    <c:otherwise>
                        <c:forEach var="m" items="${modelo}" begin="0" end="5">
                            <div class="col-md-6 col-lg-6 col-xl-4">
                                <div class="form-group">
                                    <div class="card h-100 m-2">
                                        <div class="card-header text-left">
                                            <h4>${m.nombre}</h4>                                    
                                        </div>
                                        <div class="card-body text-center">
                                            <img class="img-fluid" src="${m.imagen}"><br>
                                        </div>
                                        <div class="card-footer text-center">
                                            <label>Precio: <b>${m.precio}</b></label>

                                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b>

                                            <div class="d-flex justify-content-center">
                                                <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info m-1">Agregar a Carrito</a>
                                                <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info m-1">Ver Modelo</a>
                                                <%--     <a href="carritoServlet?acc=Comprar&id=${m.idModelo}" class="btn btn-outline-danger">Comprar</a>--%>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>    
                        </c:forEach>
                    </c:otherwise>
                </c:choose>

                <c:if test="${ footer == 1}">
                    <div class="page" >
                        <nav aria-label="...">
                            <ul class="pagination justify-content-center">

                                <li class="page-item">
                                    <a class="page-link"  href="carritoServlet?acc=pag&pp=0" tabindex="-1">Anterior</a>
                                </li>
                                <li class="page-item ${active}">
                                    <a class="page-link" href="carritoServlet?acc=pag&pp=1">1</a>
                                </li>
                                <li class="page-item ${active2}">
                                    <a class="page-link" href="carritoServlet?acc=pag&pp=2">2<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="page-item ${active3}">
                                    <a class="page-link" href="carritoServlet?acc=pag&pp=3">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="carritoServlet?acc=pag&pp=5">Siguiente</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </c:if>


            </div>

        </div>
        <c:choose>
            <c:when test="${ footer != 1}">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12 col-md-12"><h2>Bienvenido a Unique3D</h2></div>
                    </div>
                    <div class="row">

                        <div class="col-12"><img class="img-fluid "  style="width: 1500px; height: 610px;" src="img/foto.jpg" alt=""></div>
                    </div>
                    <div class="row">
                        <div class="footer1"><%@include file="foot.jsp"%></div>
                    </div>

                </div>

            </c:when>
            <c:otherwise>
                <div class="footer1"><%@include file="foot.jsp"%></div>
            </c:otherwise>
        </c:choose>





        <script src="js/jquery-3.0.6.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>