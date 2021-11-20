<%-- 
   
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <label>Informe de modelos mas vendidos</label>
        <input type="checkbox" name="check" id="check" value="Reporte1" onchange="javascript:showContent()"/>
        <label>Informe total ganancias por mes</label>
        <input type="checkbox" name="check2" id="check2" value="Reporte2" onchange="javascript:showContent()"/>
        <label>Informe de modelos con mayor valoracion</label> 
        <input type="checkbox" name="check3" id="check3" value="Reporte3" onchange="javascript:showContent()"/>
        <div id="r1" style="display: none;">
            <div class="container-fluid"> <p><h2>modelos mas vendidos</h2></p></div>
            <table class="table" border="1">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">COD Modelo</th>
                        <th scope="col">COD Detalle</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${gestor.getreporte1()}" var="r1" >

                        <tr>
                            <th scope="col">${r1.idModelo}</th>
                            <td>  ${r1.idDetalle} </td> 
                            <td>   ${r1.nombre}  </td>
                            <td>   ${r1.precio}</td>

                        </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="r2" style="display: none;">
            <div class="container-fluid"> <p><h2>total ganancias por mes</h2></p></div>
            <table class="table" border="1">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">id</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Parametros</th>
                        <th scope="col">Fecha de Publicacion</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Valoracion</th>
                        <th scope="col">Cant descargas</th>   
                        <th scope="col">imagen</th> 

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${gestor.getreporte2()}" var="a" >
                        <tr>
                            <th scope="row">${a.idModelo}</th> 
                            <th >${a.nombre}</th>                        
                            <td>  ${a.descripcion} </td> 
                            <td>   ${a.parametros}  </td>
                            <td>   ${a.fecha}  </td>
                            <td>  ${a.precio}  </td>  
                            <td>  ${a.valoracion}  </td> 
                            <td>  ${a.descargas}  </td>
                            <td>  ${a.imagen}  </td> 

                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </div>

        <div id="r3" style="display: none;">
          <div class="container-fluid"> <p><h2>modelos con mayor valoracion</h2></p></div>
            <table class="table" border="1">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Imagen</th>
                        <th scope="col">Fecha publicacion</th>
                        <th scope="col">Valoracion</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${gestor.getreporte3()}" var="r1" >

                        <tr>
                            <th scope="col">${r1.nombre}</th>
                            <td>  ${r1.imagen} </td> 
                            <td>   ${r1.fechapublicacion}  </td>
                            <td>   ${r1.valoracion}</td>

                        </c:forEach>
                </tbody>
            </table>
        </div>


    </body>


    <script>
        function showContent() {
            element = document.getElementById("r1");
            check = document.getElementById("check");
            if (check.checked) {
                element.style.display = 'block';
            } else {
                element.style.display = 'none';
            }
            
            element2 = document.getElementById("r2");
            check2 = document.getElementById("check2");
            if (check2.checked) {
                element2.style.display = 'block';
            } else {
                element2.style.display = 'none';
            }
            
            element3 = document.getElementById("r3");
            check3 = document.getElementById("check3");
            if (check3.checked) {
                element3.style.display = 'block';
            } else {
                element3.style.display = 'none';
            }
        }
    </script>
</html>
