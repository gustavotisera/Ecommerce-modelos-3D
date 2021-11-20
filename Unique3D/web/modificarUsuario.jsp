<%-- --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <title>.::ModificarCuenta::.</title>
        <style>
            body{
                background-color:#1f1f28;
                color: white;
                font-family: 'Open Sans', sans-serif;
            }
            nav{
                width: 100%;
                align-self: flex-start;
            }
            .bg-info {
                background-color: #23384e!important;
            }
            .outline-info {
                   color: #e9ecef;
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

        <%@include file="navAdmin.jsp"%>

        <div class="container-fluid">
            <div class="col-md-6">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">Modificar Cuenta</h3>
                    </div>



                    <form  method="POST" action="/Unique3D/modificarUsuarioServlet"> 

                        <div class="card-body">
                            <input type="hidden" name="txtId" value="${usuariodto.u.id}"/>
                            <div class="form-group">
                                <label for="txtNombre">Nombre</label>
                                <input type="text" class="form-control" name="txtNombre" value="${usuariodto.u.nombre}" />
                            </div> 
                            <div class="form-group">
                                <label for="txtPassword">Password</label>
                                <input type="password" class="form-control" name="txtPassword" id="txtDescripcion" value="${usuariodto.u.password}"/>
                            </div> 
                            <div class="form-group">
                                <label for="txtEmail">Email</label>
                                <input type="text" class="form-control" name="txtEmail" value="${usuariodto.u.email}"/>
                            </div>       
                            <div class="form-group">
                                <label for="txtIdRol">Rol</label>
                                <c:choose>
                                    <c:when test="${usuariodto.u.idRol==1}"><input type="text" name="txtIdRol" value="Administrador" readonly=""/></c:when>
                                    <c:otherwise><input type="text" class="form-control" name="txtIdRol" value="Cliente" readonly=""/></c:otherwise>
                                </c:choose>                

                            </div> 


                        </div>
                            <div class="card-footer text-center"> <input type="submit" value="Enviar" class="btn outline-info"/><a href="/Unique3D/eliminarUsuarioServlet?nom=${usuario}"  class="btn outline-info ms-2">Eliminar Cuenta</a></div>
                    </form>
                </div>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>  
    </body>
</html>
<%-- <input type="number" name="txtIdRol" value="${um.idRol}"/>--%>

