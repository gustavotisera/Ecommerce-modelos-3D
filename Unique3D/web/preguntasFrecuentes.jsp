<%-- 
    Document   : preguntasFrecuentes
    Created on : 18 jun. 2021, 15:30:39
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>.::PreguntasFrecuentes::.</title>
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

            nav{
                width: 100%;
                align-self: flex-start;
            }
            footer{                
                width: 100%;
                align-self: flex-end;
            }
            
            p{color: #ffffff;}
            .contenedor{
                text-align: left ;
                margin: 100px;
            }

        </style>
    </head>
    <body>
        <%@include file="navCliente.jsp"%>
        <h1>Preguntas mas Frecuentes</h1> 
        <div class="contenedor">
            <h4>LA IMPRESIÓN 3D, QUÉ ES LA IMPRESIÓN 3D?</h4>
            <p>Es un proceso de impresión en 3 dimensiones que permite crear un objeto real a partir de un fichero digital 3D. Existen varios métodos para realizar un objeto, todos estos métodos se basan en la presentación y en la solidificación de material capa por capa.</p>
            <h4>¿CÓMO IMPRIMIR EN 3D?</h4>
            <p>Imprimir en 3D es muy sencillo. Simplemente descargue un modelo 3D imprimible (en Unique3D por ejemplo). En general, el formato del archivo 3D está en .STL u .OBJ. Cuando haya recuperado el archivo en su ordenador, debe importarlo a su software de impresora 3D llamado slicer. Usted hace todos los ajustes necesarios en su cortadora para preparar su impresión (tamaño, temperatura, relleno, etc.). Cuando su modelo 3D esté listo, sólo tiene que convertirlo a gCode desde su cortadora. A continuación, coloque el gCode en una tarjeta SD o una memoria USB para conectarlo a su impresora 3D e iniciar la impresión en 3D.</p>
            <h4>¿QUÉ ES UN ARCHIVO STL?</h4>
            <p>archivo STL es el formato de archivo más común para la impresión en 3D. Significa estereolitografía y fue inventada en los años 80 por uno de los fundadores del sistema 3D. Un archivo STL para impresora 3D le permite crear un mosaico de triángulos. Estos triángulos tienen bordes comunes, lo que significa que la máquina es capaz de conocer su ubicación y orientación. Este formato no incluye información sobre el color, la textura u otros parámetros habituales de un modelo CAD. También puede utilizar el formato OBJ para imprimir en 3D</p>
            
            <h4></h4>
            <p></p>
            
            <h4>¿CÓMO CREO UNA CUENTA DE USUARIO?</h4>
            
            <p>Debes dirigirte a la parte superior de la pagina y hacer click en iniciar sesion , apretar la opcion registrarse. Una vez en el modulo de registrar usuario , deberas completar los campos y hacer click en el boton registar.
                Luego para ingresar debes redirigirte de nuevo a la parte superior y hacer click en inciar sesion, logear tu usuario y clave .</p>

            <h4>¿CÓMO REALIZAR UNA COMPRA?</h4>


            <p> Debes agregar al carrito un modelo , haciendo click en agregar carrito  o en ver modelo > comprar .
                Luego te diriges a la seccion carrito y seleccionas el boton pagar , completas los datos de pago y se realizara la transaccion.</p>

            <h4>    ¿COMO DESCARGO EL MODELO QUE HE COMPRADO?</h4>

            <p> Una vez hayas realizado el pago se te redirigira a la seccion de mis compras ,seleccionas la opcion de detalle de compra , aparecera el detalle de la compra y la opcion de descarga de modelo</p>
            <h4>PUEDO SOLICITAR UN MODELO PERSONALIZADO?</h4>
            <p>En la parte del navegacion esta la opcion Diseño a pedido en la que deberas completar los campos requeridos para tu modelo personalizado.</p>
        </div>

        <%@include file="foot.jsp"%>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script> 
    </body>
</html>
