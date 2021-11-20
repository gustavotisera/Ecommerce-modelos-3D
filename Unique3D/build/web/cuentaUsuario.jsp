

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
        <title>.::Cuenta::.</title>
        <style>
            body{
                margin:0;
                padding: 0;
                display:flex;
                min-height: 100vh;
                flex-wrap: wrap;
                color: #f8f9fa;
                background-color: #1f1f28;
                font-family: 'Open Sans', sans-serif;

            }

            nav{
                width: 100%;             
                padding: 1em;
                align-self: flex-start;
            }
            .foot{            
                width: 100%;
                align-self: flex-end;
                text-align: center;

            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #990073;
                background-clip: border-box;
                border: 1px solid #bc75aa;
                border-radius: .25rem;
            }


            .outline-info {
                color: #e9ecef;
                border-color: #990073;

            }
            .outline-info:hover{
                background-color: #990073;
            }
            a{
                color: #990073;              
            }
            b,p{
                display: inline;
                
                padding: 5px;
            }

            i{
                color: #990073;
            }
            .border-primary {
                border-color: #bc75aa !important;
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
        <div class="container">
            <div class="col-md-6 col-lg-4" style="float:none;margin:auto;">
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">${usuario}</h3>
                    </div>
                </div>
                <div class="card-body border border-primary">
                    <div class="text-center border-bottom">
                        <img class="img-fluid rounded-top"  width="200" height="160" src="img/usuario.png" alt=""/>
                    </div>
                    <div class="pt-2">

                        <b>ID:</b><p>${idUsuario}</p><br>
                        <b>Nombre:</b><p>${usuario}</p><br>
                        <b>Email:</b><p>${email}</p><br>
                        <b>Rol:</b><p>${rol}</p>    
                    </div>

                </div>
                <div class="card-footer text-center border border-primary">
                    <a class="btn outline-info" href="/Unique3D/modificarUsuarioServlet?idU=${idUsuario}">Modificar cuenta</a>
                    <a class="btn outline-info" href="carritoServlet?acc=MisCompras">MisCompras</a>
                </div>


            </div>   



        </div>


        <div class="foot">
            <%@include file="foot.jsp"%>  
        </div>























        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script> 
    </body>

</html>
