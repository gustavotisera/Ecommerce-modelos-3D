<%-- 
    Document   : index2
    Created on : 19 oct. 2021, 13:41:05
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/> 
        <style>
            .card-box {
                color:#e600ac;
                border: 2px solid #990073;
                background-color: #1f1f28;
                padding: 20px;
                box-shadow: 0px 0px 10px 0px #e600ac;
                margin-bottom: 30px;
                float: left;
                border-radius: 10px;
            }
            .card-box .card-thumbnail {
                max-height: 200px;
                overflow: hidden;
                border-radius: 10px;
                transition: 1s;
            }
            .card-box .card-thumbnail:hover {
                transform: scale(1.2);
            }
            .card-box h3 a {
                font-size: 20px;
                text-decoration: none;
            }
            div{
                background-color: #1f1f28;
            }
            .outline-info {
                color: #e9ecef;
                border-color: #990073;

            }
            .outline-info:hover{
                background-color: #990073;
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="mt-4 mb-4">Bootstrap 5 Cards</h2>
                </div>
                <div class="col-md-6 col-lg-4">
                    <!-- Bootstrap 5 card box -->
                    <div class="card-box">
                        <div class="card-header">
                            <h4>Aro</h4>                                    
                        </div>
                        <div class="card-thumbnail">
                            <img src="img/casti.jpg" class="img-fluid" alt="">
                        </div>
                        <h3><a href="#" class="mt-2 text-danger">What is Lorem Ipsum?</a></h3>
                        <p class="text-secondary">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour</p>
                        <div class="card-footer text-center">
                            <label>Precio: <b>${m.precio}</b></label>
                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b></div>
                        <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info">Agregar a Carrito</a>
                        <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info">Ver Modelo</a>

                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <!-- Bootstrap 5 card box -->
                    <div class="card-box">
                        <div class="card-header">
                            <h4>Aro</h4>                                    
                        </div>
                        <div class="card-thumbnail">
                            <img src="img/casti.jpg" class="img-fluid" alt="">
                        </div>
                        <h3><a href="#" class="mt-2 text-danger">What is Lorem Ipsum?</a></h3>
                        <p class="text-secondary">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour</p>
                        <div class="card-footer text-center">
                            <label>Precio: <b>${m.precio}</b></label>
                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b></div>
                        <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info">Agregar a Carrito</a>
                        <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info">Ver Modelo</a>

                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <!-- Bootstrap 5 card box -->
                    <div class="card-box">
                        <div class="card-header">
                            <h4>Aro</h4>                                    
                        </div>
                        <div class="card-thumbnail">
                            <img src="img/casti.jpg" class="img-fluid" alt="">
                        </div>
                        <h3><a href="#" class="mt-2 text-danger">What is Lorem Ipsum?</a></h3>
                        <p class="text-secondary">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour</p>
                        <div class="card-footer text-center">
                            <label>Precio: <b>${m.precio}</b></label>
                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b></div>
                        <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info">Agregar a Carrito</a>
                        <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info">Ver Modelo</a>

                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <!-- Bootstrap 5 card box -->
                    <div class="card-box">
                        <div class="card-header">
                            <h4>Aro</h4>                                    
                        </div>
                        <div class="card-thumbnail">
                            <img src="img/casti.jpg" class="img-fluid" alt="">
                        </div>
                        <h3><a href="#" class="mt-2 text-danger">What is Lorem Ipsum?</a></h3>
                        <p class="text-secondary">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour</p>
                        <div class="card-footer text-center">
                            <label>Precio: <b>${m.precio}</b></label>
                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b></div>
                        <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info">Agregar a Carrito</a>
                        <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info">Ver Modelo</a>

                    </div>
                </div>
                        <div class="col-md-6 col-lg-4">
                    <!-- Bootstrap 5 card box -->
                    <div class="card-box">
                        <div class="card-header">
                            <h4>Aro</h4>                                    
                        </div>
                        <div class="card-thumbnail">
                            <img src="img/casti.jpg" class="img-fluid" alt="">
                        </div>
                        <h3><a href="#" class="mt-2 text-danger">What is Lorem Ipsum?</a></h3>
                        <p class="text-secondary">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour</p>
                        <div class="card-footer text-center">
                            <label>Precio: <b>${m.precio}</b></label>
                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b></div>
                        <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info">Agregar a Carrito</a>
                        <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info">Ver Modelo</a>

                    </div>
                </div>
                        <div class="col-md-6 col-lg-4">
                    <!-- Bootstrap 5 card box -->
                    <div class="card-box">
                        <div class="card-header">
                            <h4>Aro</h4>                                    
                        </div>
                        <div class="card-thumbnail">
                            <img src="img/casti.jpg" class="img-fluid" alt="">
                        </div>
                        <h3><a href="#" class="mt-2 text-danger">What is Lorem Ipsum?</a></h3>
                        <p class="text-secondary">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour</p>
                        <div class="card-footer text-center">
                            <label>Precio: <b>${m.precio}</b></label>
                            <i class="far fa-heart" style="padding: 10px;" title="Me gusta"></i><b>${m.valoracion}</b>  
                            <i class="fas fa-download" style="padding: 10px;" title="Descargas"></i><b>${m.descargas}</b></div>
                        <a href="carritoServlet?acc=AgregarCarrito&id=${m.idModelo}" class="btn outline-info">Agregar a Carrito</a>
                        <a href="carritoServlet?acc=Vista&id=${m.idModelo}" class="btn outline-info">Ver Modelo</a>

                    </div>
                </div>




            </div>
        </div>                   



















<%@include file="foot.jsp"%>







        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
