<%-- 
    Document   : altaPago
    Created on : 23 may. 2021, 15:07:04
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <title>JSP Page</title>
        
    </head>
    <body>

    <body>
        <%@include file="navCliente.jsp"%>

        <form action="/Unique3D/carritoServlet">
                <div class="form-group">
                    <label>Numero de Tarjeta</label>
                    <input type="text" class="form-control" placeholder="9999-9999-9999-9999">
                </div>
                <div class="form-group">
                    <label>Codigo Seguridad</label>
                    <input type="text" class="form-control" placeholder="xxxx">
                </div>
                <div class="form-group">
                    <label>Monto</label>
                    <input type="text" name="txtmonto" value="$.${totalPagar}0" class="form-control h1">
                </div>     

                <button type="submit" name="acc" value="RealizarPago" class="btn btn-info btn-block">Pagar</button>
            </form>

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="js/bootstrap.min.js"></script>  
    </body>
</html>
