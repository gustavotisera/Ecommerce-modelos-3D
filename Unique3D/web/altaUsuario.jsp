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

     
        <jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
        <style>

            i{
                color: #990073;
            }
            body{
                background-color:#1f1f28;
                color: white;
                font-family: 'Open Sans', sans-serif;
            }
            .outline-info {
                    color: #dee2e6;
                border-color: #990073;

            }
            .outline-info:hover{
                background-color: #990073;
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
                margin-left: 100px;
                margin-bottom: 1rem;
                border: 1px solid #990073;


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
            .col-md-6{
                margin: 0 auto;
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
        </style>
        <title>.::AltaUsuario::.</title>
    </head>
    <body>
        <%@include file="navCliente.jsp"%>

        <script src="javaS/login.js" type="text/javascript"></script>
        <div class="container-fluid">
            <div class="col-md-6">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Registrarse</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form id="formulario" method="POST" action="/Unique3D/altaUsuarioServlet">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="txtNombre" >Nombre de usuario</label>
                                <input type="text" class="form-control" name="txtNombre"  id="txtNombre"  placeholder="Nombre de Usuario" ><c:if test="${msjj != null && !msjj.equals('')}">
                                    <h6 style="color:red;"> ${ msjj } </h6>
                                </c:if>
                            </div>
                            <div class="form-group">
                                <label for="txtEmail">Email</label>
                                <input type="email" name="txtEmail" class="form-control" id="txtEmail" placeholder="Ingrese email">
                            </div>
                            <div class="form-group">
                                <label for="txtPasword">Contraseña</label>
                                <input type="password" class="form-control"   name="txtPassword" id="txtPassword" placeholder="Contraseña">
                            </div>                       

                        </div>
                        <div class="form-group">
                            <c:if test="${gestor.existeRolAdmin() == false}">
                                <label for="cboRol">Rol</label>
                                <select class="form-select" aria-label="Default select example" id="cboRol" name="cboRol">
                                    <option value="0" >(Elija una opcion:)</option>
                                    <c:forEach var="r" items="${listaRoles}">
                                        <option value="${r.id}">${r.nombre}</option>
                                    </c:forEach>
                                </select>
                            </c:if>                        
                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer">
                            <button type="submit" class="btn outline-info"  onclick="return validar_nombre()" value="Registrar">Registrarse</button>
                        </div>
                    </form>
                </div>
            </div>


        </div>




        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>  
        <script src="css/alertify.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                        function validar_nombre() {
                            nom = document.formulario.txtNombre.value;
                            //  nom = document.formulario.txtNombre.value;
                            if (nom.length == 0) {
                                alertify.alert("Error", "Ingrese un Nombre").set('label', 'Ok');
                                return false;
                            } else {
                                alertify.succes("Usuario Ingresado");
                                return true;
                            }

                        }
                        function validarTexto() {
                            tecla = e.keyCode;
                            teclado = String.fromCharCode(tecla)
                            if ((teclado < 'A' || teclado > 'z') && teclado != " ") {
                                return false;
                            }
                        }

        </script>




    </body>


</html>
