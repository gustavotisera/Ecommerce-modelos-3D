<%-- 
 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>
        <style>
            body{
                background-color:#1f1f28;
                color: white;
                font-family: 'Open Sans', sans-serif;
            }
            .twins{
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                height: 90vh;
                align-items: center;
            }
            .twin{
                border: 1px solid white;
                padding: 50px;
                margin: 15px;
                height: 600px;
                width: 600px;
            }
            .form-group{
                padding: 10px;
            }
            .form-control{                
                width: 400px;
            }
            h1{text-align: center;}
            p{  padding: 12px;
                font-size: 12px;}
            .outline-info {
                color:#f8f9fa;
                border-color: #990073;

            }

            i{
                color: #990073;
            }
            .outline-info:hover{
                color: #e9ecef;
                background-color: #990073;
            }
            .twin__foot{
                width: 100%;           
                position:relative;
                bottom:0;
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

        if (objSesion.getAttribute("usuario") != null) {
            usuario = objSesion.getAttribute("usuario").toString();
            id = objSesion.getAttribute("idUsuario").toString();
            email = objSesion.getAttribute("email").toString();
            rol = objSesion.getAttribute("rol").toString();
        }
    %>
    <body>
        <%@include file="navCliente.jsp"%>
        <h1>Pedido de modelo personalizado</h1>
        <form method="POST" action="/Unique3D/altaPedidoServlet" enctype="multipart/form-data">
            <div class="twins">
                <div class="twin">
                    <div class="form-group">
                        <label for="txtDescripcion">Describa su proyecto *</label>
                        <textarea  type="text" rows="5" cols="42" class="form-control" required="required" name="txtDescripcion" id="txtDescruocuib"></textarea>
                    </div>
                    <p class="help-block">¿Cuál es el uso de este diseño (privado o comercial)?<br> En qué tipo de impresora 3D desea imprimir este diseño? ¿En qué formato desea?</p>
                    <div class="form-group">
                        <label  for="txtPresupuesto">Presupuesto *
                        </label><input size="30" required="required" class="form-control" type="text" name="txtPresupuesto" id="txtPresupuesto">
                    </div>
                    <p class="help-block">Se puede dar un rango de presupuesto. P.ej: 150$ y 200$.</p>
                    <div class="form-group">
                        <label for="txtPlazo">En un plazo de :
                        </label><input  size="30" class="form-control" type="text" name="txtPlazo" id="txtPlazo">
                    </div>
                    <p class="help-block">Danos el período deseado para obtener el modelo 3D.</p>
                </div>
                <div class="twin" >
                    <div class="form-group">
                        <label  for="txtArchivo">Elementos disponibles (dibujos, fotografías, planos, archivos 3D...)
                        </label><input class="form-control"  value="Añadir o arrastre archivos JPG, PNG, STL ou ZIP..." type="file" name="file" id="txtAr"><br>
                        
                    </div>
                    <div data-uploads-container=""></div>
                    <div class="form-group">
                        <label for="txtNomApe">Nombre y Apellido *
                        </label><input  class="form-control" size="30" required="required" type="text" name="txtNomApe" id="txtNomApe">
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="txtEmail">Correo electrónico * (un email válido para que podamos enviar una respuesta)
                        </label><input size="30" required="required" type="email" class="form-control" name="txtEmail" id="txtEmail">
                    </div>
                    <div class="form-btns">
                        <p>
                            * Campos requeridos
                        </p>
                        <div class="text-center">
                            <input type="submit" name="commit"  value="Enviar mi pedido" class="btn outline-info " data-disable-with="Enviar mi pedido">
                        </div>
                        

                    </div>
                </div>
                <div class="twin__foot">
                    <%@include file="foot.jsp"%>
                </div>


            </div>
        </form>



        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>  


    </body>
</html>
