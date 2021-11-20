<%--
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table" border="1">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">Nombre</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${gestor.obtenerMP}" var="a" >
                    <tr>
                        <th scope="row">${a.id}</th> 
                        <th >${a.nombre}</th>                        

                    </tr>
                </c:forEach>

            </tbody>

        </table>
    </body>
</html>
