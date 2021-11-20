<%-- --%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
        <style>
            #contenedor{
                min-height: calc(100vh - 110px - 224px);
            }

            nav{
                width: 100%;                 
                padding: 1em;
                align-self: flex-start;
            }
            body{
                background-color:#1f1f28;
                color: white;
                font-family: 'Open Sans', sans-serif;
            }
            .outline-info {
                color: #f8f9fa;
                border-color: #990073;

            }
            .outline-info:hover{
                background-color: #990073;
            }
            i{
                color: #990073;
            }
            form {
                display: block;
                margin-top: 0em;
            }
            .label{
                color: #1f1f28;
            }
            .card {
                position: relative;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-flex-direction: column;
                -ms-flex-direction: column;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #2b3137;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: .25rem;
            }
            .card {
                box-shadow: 0 0 1px rgba(0,0,0,.125),0 1px 3px rgba(0,0,0,.2);
                margin-top: 100px;

                margin-bottom: 1rem;
                border: 1px solid #990073;


            }
            footer {            
                width: 100%;                
                align-self: flex-end;
                text-align: center;

            }
            .card-primary:not(.card-outline)>.card-header {
                background-color: #990073;
            }
            .card-body {
                -webkit-flex: 1 1 auto;
                -ms-flex: 1 1 auto;
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1.25rem;
            }
            .form-group {
                margin-bottom: 1rem;
            }
            label:not(.form-check-label):not(.custom-file-label) {
                font-weight: 700;
            }
            label {
                display: inline-block;
                margin-bottom: .5rem;
            }
            .form-control {
                display: block;
                width: 100%;
                height: calc(2.25rem + 2px);
                padding: .375rem .75rem;
                font-size: 1rem;
                font-weight: 400;
                line-height: 1.5;
                color: #495057;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #ced4da;
                border-radius: .25rem;
                box-shadow: inset 0 0 0 transparent;
                transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            }
            .card-footer {
                padding: .9rem 1rem;
                background-color: rgba(0,0,0,.03);
                border-top: 1px solid rgba(0,0,0,.125);
            }

        </style>
        <title>.::AltaUsuario::.</title>
    </head>
    <body>

        <%@include file="navCliente.jsp"%>



        <div class="container" id="contenedor">

            <div class="col-md-6 col-lg-4" style="float:none;margin:auto;">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Iniciar Sesion</h3>
                    </div>
                    <form id="formulario" action="loginServlet2" method="POST" onsubmit="return validacion()">
                        <div class="card-body">
                            <div class="col-auto form-group">
                                <label for="txtNombre" >Nombre de usuario</label>
                                <input type="text" class="form-control" name="nombreUsuario" id="txtNombre" required="" placeholder="Nombre de Usuario" >

                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Contraseña</label>
                                <input type="password" name="clave" class="form-control" id="clave" placeholder="Contraseña">
                            </div>                       

                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer text-center">
                            <button type="submit" class="btn outline-info" name="btnAcceder">Iniciar Sesion</button>
                            <a class="btn outline-info" href="/Unique3D/altaUsuario.jsp">Registrarse</a>
                        </div>

                    </form>

                </div>
                <c:if test="${msjUserIncorrecto != null && !msjUserIncorrecto.equals('')}">
                    <div class="${config}"> ${ msjUserIncorrecto } </div>
                </c:if>
            </div>

        </div>
        <%@include file="foot.jsp"%>


        <script src="js/jquery-3.0.6.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>  



    </body>

    <script src="javaS/login.js" type="text/javascript"></script>
</html>

