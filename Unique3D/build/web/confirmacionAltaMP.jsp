<%-- 
    Document   : confirmacionAltaMP
    Created on : 11 may. 2021, 16:05:52
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="nuevoMP" scope="session" class="modelo.metodoPago" />
<jsp:setProperty name="nuevoMP" property="*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Confirmacion nuevo metodo de pago</h1>
        <p>Esta segurod e agregar un nuevo mp</p>
        
         ${nuevoMP.nombre} 
         
         <form method="POST" action="/Unique3D/altaMPServlet">
             <input type="submit" value="Agregar">
         </form>
    </body>
</html>
