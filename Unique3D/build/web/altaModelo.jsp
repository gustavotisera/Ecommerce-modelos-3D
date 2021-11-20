<%--     --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>.::AltaModelo::.</title>
        <style>
            body{background-color: #15202B;
                 font-family: 'Open Sans', sans-serif;
            }
            .bg-info {
                background-color: #23384e!important;
            }
            label, h1{
                color: white;
            }
            h1{text-align: center;}
            .form-group{
                padding: 10px;
            }
            .form-control{                
                width: 400px;
            }            
            .contenedor{
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                height: 90vh;
                align-items: center;
            }
            .contenedor-item{
                border: 1px solid white;
                padding: 50px;
                margin: 15px;
                height: 600px;
                width: 600px;
            }
            .btn{ width: 100px; padding:auto; align-self: center;}

        </style>
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
        <h1 class="mt-2">Alta de modelo</h1>


        <form method="POST" action="/Unique3D/altaModeloServlet" enctype="multipart/form-data" onsubmit="return validacionAltaModelo()">
            <div class="contenedor">
                <div class="contenedor-item">             
                    <div class="form-group">
                        <label for="txtNombre" class="form-control__label" >Nombre</label>
                        <input type="text" class="form-control" name="txtNombre" id="txtNombre" placeholder="Muñeco Yoda">
                    </div>
                    <div class="form-group">
                        <label for="txtDescripcion" class="form-control__label">Descripcion</label>
                        <textarea type="text" class="form-control"  name="txtDescripcion" id="txtDescripcion" placeholder=""></textarea>
                    </div>
                    <div class="form-group" >
                        <label for="txtParametros"  class="form-control__label">Parametros de Impresion</label>
                        <textarea  type="text" class="form-control" name="txtParametros" id="txtParametros" placeholder="Parametros"></textarea>
                    </div>               
                    <div class="form-group">
                        <label for="txtFecha" class="form-control__label" >Fecha de publicacion</label>
                        <input type="text" class="form-control" name="txtFecha" id="txtFecha" required="" placeholder="Fecha de publicacion">
                    </div>
                    <div class="form-group">
                        <label for="txtPrecio" class="form-control__label">Precio</label>
                        <input type="number" class="form-control" name="txtPrecio" id="txtPrecio" placeholder="precio">
                    </div>
                </div>
                <div class="contenedor-item"> 
                    <div class="mt-5">
                        <div class="form-group">
                            <label for="txtImagen" class="form-control__label">Imagen</label>
                            <input type="file" name="file" class="form-control" id="txtImagen" required=""> <br>
                            <%--    <label class="form-control__label">Ingrese direccion de imagen </label><input type="text" name="txtnomA" class="form-control" id="txtnomA" placeholder="auto.jpg">
                               <input type="file" name="txtImagen" id="txtImagen" onblur="document.getElementById('txtnomA').value=this.value"><input type="text" name="txtnomA" id="txtnomA">--%>
                        </div>   
                        <div class="form-group">
                            <label for="txtArc" class="form-control__label">Archivo</label>
                            <input type="file" name="file2" class="form-control" id="txtArc" required=""> <br>
                            <%--  <label class="form-control__label">Ingrese direccion de Archivo </label><input type="text" name="txtArchivo" class="form-control" id="txtArchivo" placeholder="auto.STL">
                             <input type="file" name="txtImagen" id="txtImagen" onblur="document.getElementById('txtnomA').value=this.value"><input type="text" name="txtnomA" id="txtnomA">--%>
                        </div> 
                    </div>



                    <center><input type="submit" value="Registrar" class="btn btn-outline-info mt-3"/></center>
                </div>
            </div>
        </form>


        <script src="javaS/login.js" type="text/javascript"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>  



    </body>
</html>
