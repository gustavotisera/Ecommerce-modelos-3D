<%-- 
    Document   : contacto
    Created on : 18 jun. 2021, 15:29:06
    Author     : usuario
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
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>
        <title>.::Contacto::.</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            body{background-color: #15202B;
                 color: white;
                 display: flex;
                 flex-wrap: wrap;
                 min-height: 100vh;
                 justify-content: center;
                 align-items: center;
                 font-family: 'Open Sans', sans-serif;

            }
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
            td{color:white;}
            nav{
                width: 100%;
                align-self: flex-start;
            }
            footer{                
                width: 100%;
                align-self: flex-end;
            }

            .form-control{
                width: 400px;
            }
            h1{margin-right: 100px;}
            .table{

                border-bottom-width: 1px ;
                border-bottom-color: #15202B;
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
        <div>
            <h1>Contacto</h1>

            <form action="/Unique3D/contactoServlet" method="POST">
                <table class="table">
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" required="" placeholder="Nombre" name="txtNombre" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" required="" placeholder="Email" name="txtEmail" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Asunto</td>
                        <td><input type="text" required="" placeholder="Asunto" name="txtAsunto" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Mensaje</td>
                        <td><textarea name="txtMensaje" required="" rows="5" cols="100" class="form-control" placeholder="tu Mensaje"></textarea></td>
                    </tr>
                    <tr>
                        <td><input type="submit" id="submit" class="btn outline-info" value="enviar"></td>
                    </tr>
                </table>
            </form>

        </div>

        <%@include file="foot.jsp"%>
    </body>
</html>
