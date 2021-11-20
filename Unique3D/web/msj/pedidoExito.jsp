
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>.::PedidoExito::.</title>
        <style>
            body{
                background-color: #1f1f28;

            }
            .alert-success {
                color: #faf8fa;
                background-color: #1f1f28;
                border-color: #e600ac;
            }
            .outline-info {
                color: #e9ecef;
                border-color: #990073;

            }
            .outline-info:hover{
                background-color: #990073;
            }
        </style>
    </head>

    <body class="m-0 vh-100 row justify-content-center align-items-center">
        <div class="col-auto p-5 text-center">            
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">Su pedido se realizo con exito!!</h4>
                <p>Se le respondera via mail</p>
                <hr>
                <a href="carritoServlet?acc=home" class="btn outline-info">Volver</a>
            </div>
        </div>



       
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>  
    </body>
</html>