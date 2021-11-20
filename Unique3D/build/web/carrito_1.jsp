<%-- --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

        <title>.::Carrito::.</title>
        <style>
            body{background-color: #1f1f28;
                 display: flex;
                 flex-wrap: wrap;
                 min-height: 100vh;
                 font-family: 'Open Sans', sans-serif;
            }
            th, td{
                color: #ffffff;
            }
            h4 ,h3, label{color: #ffffff;}           
            i{
                color: #990073;
            }
            .outline-info {
                color: #e9ecef;
                border-color: #990073;

            }
            .outline-info:hover{
                color: #e9ecef;
                background-color: #990073;
            }
            .container{
                padding: 0px;
                margin-top: 0px;
            }
            nav{
                width: 100%;
                align-self: flex-start;
            }
            .footer{                
                width: 100%;
                align-self: flex-end;
            }
            table{}
            .card {
                background-color: #212529;
                border: 1px solid #990073;
            }

            .modal-content{background-color: #212529;}
            .card-header {
                padding: .5rem 1rem;
                margin-bottom: 0;
                background-color: #990073;
                border-bottom: 1px solid rgba(0,0,0,.125);
            }

        </style>
    </head>
    <%
        String id = "";
        //   HttpSession objSesion = request.getSession();
        //    String id = ""; 

        //    id = objSesion.getAttribute("idUsuario").toString(); 
        String user = "";
        String email = "";
        HttpSession objSesion = request.getSession();
        String usuario;

        if (objSesion.getAttribute("usuario") != null) {
            usuario = objSesion.getAttribute("usuario").toString();
            id = objSesion.getAttribute("idUsuario").toString();
            email = objSesion.getAttribute("email").toString();

        } else {
            out.print("<script>alert('debes iniciar Sesion');</script>");
        }
        // if (objSesion.getAttribute("codCompra") != null) {

        //   String codCompra = objSesion.getAttribute("codCompra").toString();
        //  }//

    %>
    <body>
        <!--   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
              <div class="container-fluid">
                  <a class="navbar-brand" href="/Unique3D/index.jsp">Unique3d Store</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                          <li class="nav-item">
                              <a class="nav-link active" aria-current="page" href="carritoServlet?acc=home">Home</a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link" href="#">Ofertas del dia</a>
                          </li> 
                          <li class="nav-item">
                              <a class="nav-link" href="carritoServlet?acc=home">Seguir comprando</a>
                          </li>
                      </ul>
                      <ul class="navbar-nav">
                          <li class="nav-item dropdown">
                              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                  Iniciar Sesion
                              </a>
                              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                  <li><a class="dropdown-item" href="#">Action</a></li>
                                  <li><a class="dropdown-item" href="#">Another action</a></li>
                                  <li><hr class="dropdown-divider"></li>
                                  <li><a class="dropdown-item" href="#">Something else here</a></li>
                              </ul>
                          </li>
                      </ul>
                  </div>
              </div>
          </nav>-->
        <%@include file="navCliente.jsp"%>

        <div class="container">
            <h4>Carrito</h4>
            <div class="row">
                <div class="col-md-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ITEM</th>
                                <th>imagen</th>
                                <th>NOMBRES</th>
                                <th>DESCRIPCION</th>
                                <th>PRECIO</th>
                                    <%--  <th>CANT</th>--%>
                                    <%--  <th>SUBTOTAL</th>--%>
                                <th>ACCION</th>
                            </tr>                        
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${carrito}">
                                <tr>
                                    <td>${car.item}</td>
                                    <td><img src="${car.imagen}" width="80" height="60"></td>
                                    <td>${car.nombre}</td>
                                    <td>${car.descripcion}</td>
                                    <td>${car.precio}</td>
                                    <%--   <td>${car.cantidad}</td>--%>
                                    <%-- <td>${car.subTotal}</td>  --%> 
                                    <td>
                                        <input type="hidden" id="idModelo" value="${car.item}">
                                        <a href="carritoServlet?acc=Delete&id=${car.item}" id="btnDelete"><i class="far fa-trash-alt ps-4" title="Eliminar"></i></a>

                                    </td>

                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="col-6 col-md-4 ">
                    <div class="card">
                        <div class="card-header">
                            <h3>Generar Compra</h3>
                        </div>
                        <div class="card-body">
                            <label>Subtotal:</label>
                            <input type="text" value="$.${totalPagar}0" readonly="" class="form-control">
                            <label>Descuento:</label>
                            <input type="text" value="$.0.00" readonly="" class="form-control"> 
                            <label>Total Pagar:</label>
                            <input type="text" value="$.${totalPagar}0" readonly="" class="form-control">                           
                        </div>
                        <div class="card-footer">
                            <%--       <a href="/Unique3D/carritoServlet?acc=RealizarPago" class="btn btn-danger btn-block">Realizar Compra</a>--%>
                            <a href="#" data-bs-toggle="modal" data-bs-target="#myModalPago" class="btn outline-info">Pagar</a>

                        </div>
                    </div>               
                </div>
            </div>

        </div>

        <!-- Modal de Pago -->
        <div class="modal fade" id="myModalPago" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">         
                <div class="modal-content">                   
                    <div class="modal-header text-center"> 
                        <label>Realizar Pago</label>
                        <button type="button" class="close" data-bs-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                        </button>  
                    </div>
                    <div class="modal-body"> 
                        <div class="tab-content" id="pills-tabContent">
                            <!-- Metodo Pago -->
                            <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                <form action="/Unique3D/carritoServlet">
                                    <div class="row">
                                        <div class="col-8">
                                            <div class="mb-3"> 
                                                <label>Numero de Tarjeta</label>
                                                <input type="tel" class="form-control w-75" pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}" placeholder="9999-9999-9999-9999" required="">
                                            </div> 
                                        </div>  
                                        <div class="col-sm-4">
                                            <div class="mb-3"> 
                                                <label>Cod Seguridad</label>
                                                <input type="number" class="form-control w-50"   placeholder="xxx" required="">
                                            </div> 
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="d-flex justify-content-start">
                                            <span style="color: #ffffff;">Fecha Venc.</span><span style="color: #ffffff; margin-left: 90px;">Monto</span>
                                        </div>
                                        

                                        <div class="col-2 ">
                                            <input type="text" class="form-control"  placeholder="MM" required="">
                                        </div>
                                        <div class="col-2 ">
                                            <input type="text" class="form-control"  placeholder="AA" required="">
                                        </div>

                                        <div class="col-8">

                                            <input type="text" name="txtmonto" value="$.${totalPagar}0" class="form-control w-50 h1">
                                        </div>  
                                    </div>                            
                                    <div class="d-flex justify-content-center">
                                        <button type="submit" name="acc" value="RealizarCompra" class="btn outline-info ">Pagar</button>
                                    </div>

                                </form>
                            </div>

                        </div> 
                    </div>
                </div>
            </div>
        </div>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <%--           <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
                  <script src="js/bootstrap.min.js"></script>    
        --%>
        <div class="footer"><%@include file="foot.jsp"%></div>
    </body>

</html>
