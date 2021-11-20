<%-- 
    Document   : modificarModelo
    Created on : 27 abr. 2021, 15:20:54
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>.::User::.</title>
        <style>
            body{background-color: #15202B;
                 font-family: 'Open Sans', sans-serif;
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
        <%@include file="navAdmin.jsp"%>
        <%-- <%@include file="navAdmin.jsp"%>    ESto produce error = enctype="multipart/form-data"--%>
        <h1>Modificar Modelo</h1>
        <form method="POST" action="/Unique3D/modificarModeloServlet"> 
            <div class="contenedor">
                <div class="contenedor-item">   
                    <div class="form-group">
                        <label for="txtId" class="form-control__label" >id</label>
                        <input type="number" name="txtId"  class="form-control" value="${modelodto.m.idModelo}"/>
                    </div> 

                    <div class="form-group">
                        <label for="txtNombre" class="form-control__label" >Nombre</label>
                        <input type="text" name="txtNombre" class="form-control" value="${modelodto.m.nombre}"/>
                    </div> 
                    <div class="form-group">
                        <label for="txtDescripcion" class="form-control__label" >Descripcion</label>
                        <input type="text" name="txtDescripcion" class="form-control" id="txtDescripcion" value="${modelodto.m.descripcion}"/>
                    </div> 
                    <div class="form-group">
                        <label for="txtParametros" class="form-control__label" >Parametros</label>
                        <input type="text" name="txtParametros" class="form-control" value="${modelodto.m.parametros}"/>
                    </div>
                    <div class="form-group">
                        <label for="txtFecha" class="form-control__label" >Fecha</label>
                        <input type="text" name="txtFecha" class="form-control" value="${modelodto.m.fecha}"/>
                    </div>
                    <div class="form-group">
                        <label for="txtPrecio" class="form-control__label" >Precio</label>
                        <input type="number" name="txtPrecio" class="form-control" value="${modelodto.m.precio}"/>
                    </div>
                </div> 
                <div class="contenedor-item"> 
                    
                    <div class="form-group">
                        <label for="txtValoracion" class="form-control__label" >Valoracion</label>
                        <input type="number" name="txtValoracion" class="form-control" value="${modelodto.m.valoracion}"/>
                    </div>
                    <div class="form-group">
                        <label for="txtDescargas" class="form-control__label" >Cantidad Descargas</label>
                        <input type="number" name="txtDescarga" class="form-control" value="${modelodto.m.descargas}"/>
                    </div>

                    <div class="form-group">
                        <label for="txtImagen" class="form-control__label" >Imagen</label>
                        <input type="file" name="file" class="form-control" id="txtImagen"> <br>
                         <label class="form-control__label">Ingrese direccion de imagen </label>
                         <input type="text" name="txtImagen" class="form-control" id="txtnomA" value="${modelodto.m.imagen}" placeholder="auto.jpg">
                      <%--  <input type="file" name="txtImagen" id="txtImagen" onblur="document.getElementById('txtnomA').value=this.value"><input type="text" name="txtnomA" id="txtnomA">--%>
                    </div>   
                    <div class="form-group">
                        <label for="txtArc" class="form-control__label" >Archivo</label>
                        <input type="file" name=file2" class="form-control" id="txtArc"> <br>
                        <label class="form-control__label">Ingrese direccion de Archivo </label>
                        <input type="text" name="txtArchivo" class="form-control" id="txtArchivo" value="${modelodto.m.archivo}" placeholder="auto.STL">
                   <%--      <input type="file" name="txtImagen" id="txtImagen" onblur="document.getElementById('txtnomA').value=this.value"><input type="text" name="txtnomA" id="txtnomA">--%>
                    </div> 

                    <center><input type="submit" value="Modificar" class="btn btn-outline-info mt-1"/></center>
                    
                </div> 
            </div>

        </form>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>  
    </body>
</html>
