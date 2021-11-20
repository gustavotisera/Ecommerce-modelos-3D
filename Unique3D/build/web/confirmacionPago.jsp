<%-- 
    Document   : confirmacionPago
    Created on : 23 may. 2021, 15:19:54
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="Pago" scope="session" class="modelo.Pago" />
<jsp:setProperty name="Pago" property="*" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Confirmacion  de pago</h1>
        <p>Esta segurod e agregar un nuevo mp</p>
        
         ${Pago.monto} 
         
         <form  action="/Unique3D/carritoServlet?acc=RealizarPago">
             <input type="submit" value="Agregar">
         </form>
    </body>
</html>
