
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
        <title>.::AcercaDe::.</title>
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
            h1{
                align-self: flex-start;
            }
            div{align-self: flex-start;}
            p{padding: 5px;}

            nav{
                width: 100%;
                align-self: flex-start;
            }
            footer{                
                width: 100%;
                align-self: flex-end;
            }
        </style>
    </head>
    <body>
        <%@include file="navCliente.jsp"%>

        <div>
            <center>
                <h1>Sobre nosotros</h1><br>
                <p>Unique3D es un mercado para que compradores que deseen imprimir modelos 3D.<br>

                    Unique3D está dirigido a todos los propietarios de impresoras 3D que deseen tener acceso a creaciones unicas y originales para hacer uso propio.<br>

                    Porque no todo el mundo tiene alma de artista o conocimientos software para crear modelos 3D, Unique3D muestra el trabajo de todos estos diseñadores que harán que mañana <br>la impresión 3D sea accesible para todos.
                </p></center>

        </div>

        <%@include file="foot.jsp"%>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>  
</html>
