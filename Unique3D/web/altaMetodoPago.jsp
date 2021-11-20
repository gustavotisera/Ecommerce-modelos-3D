
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <%
        String user = "";
        HttpSession objSesion = request.getSession();
        String usuario;
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("rol") == "Administrador") {
            usuario = objSesion.getAttribute("usuario").toString();
            user = "<label>" + usuario + "</label>";
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("rol") == "Cliente") {
            out.print("<script>location.replace('/Unique3D/menuCliente.jsp');</script>");
        } else {
            out.print("<script>location.replace('/Unique3D/index.jsp');</script>");
        }

    %>
    <body>
        <%@include file="navAdmin.jsp"%>
        <form method="POST" action="/Unique3D/confirmacionAltaMP.jsp">

            <div class="container mt-4">
                <div class="card border-success mb-3" style="max-width: 18rem;">
                    <div class="card-header">Agregar Metodo Pago</div>
                    <div class="card-body text-success">
                        <div class="form-group">
                            <label for="nombre" >Metodo Pago</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Nombre de Usuario">
                        </div>
                    </div>
                    <div class="card-footer">
                        <input type="submit" class="btn btn-outline-success" value="Registrar">
                    </div>
                </div>
            </div>          

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="js/bootstrap.min.js"></script>  
        </form>
    </body>


</html>
