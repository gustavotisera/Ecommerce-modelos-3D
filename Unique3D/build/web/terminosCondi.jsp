<%-- 
    Document   : terminosCondi
    Created on : 28 jun. 2021, 11:11:10
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>
        <title>.::TerminosYCondiciones::.</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
            h1{
                margin-top: 50px;
                align-self: flex-start;
            }
            .contenedor{text-align: left ;
                        margin: 100px;
            }

            nav{
                width: 100%;
                align-self: flex-start;
            }
            footer{                
                width: 100%;
                align-self: flex-end;
            }
        </style>
    </head>
    <body>
        <%@include file="navCliente.jsp"%>
        <h1>Terminos y Condiciones</h1>
        <div class="contenedor">
            <p>
                Bienvenido a <b>Unique3D</b> proporcionado por <b>tiseraCompany</b> (en adelante, la <br>
                «Empresa»). Nos complace ofrecerle acceso al Servicio, sujeto a estos términos y condiciones (los
                "Términos de Servicio") y a la Política de Privacidad correspondiente de tiseraCompany. Al
                acceder y utilizar el Servicio, usted expresa su consentimiento, acuerdo y entendimiento de los
                Términos de Servicio y la Política de Privacidad. Si no está de acuerdo con los Términos de Servicio
                o la Política de Privacidad, no utilice el Servicio.

                Si utiliza el servicio está aceptando las modalidades operativas en vigencia descriptas más
                adelante, las declara conocer y aceptar, las que se habiliten en el futuro y en los términos y
                condiciones que a continuación se detallan:<br>
                <b><h5>Operaciones habilitadas.</h5></b> <br>
                Las operaciones habilitadas son aquellas que estarán disponibles para los clientes, quienes
                deberán cumplir los requisitos que se encuentren vigentes en su momento para operar el Servicio.
                Las mismas podrán ser ampliadas o restringidas por el proveedor, comunicándolo previamente
                con una antelación no menor a 60 días, y comprenden entre otras, sin que pueda entenderse
                taxativamente las que se indican a continuación:<br>
                <b> <h5>Registros:</h5></b> <br>El cliente puede realizar un alta de Usuario(administrador y cliente), modelos ,agregar modelos a carro de compra
                donde a su vez puede realizar respectivamente su/s modificaciones y eliminación del   mismo.   <br>    
                <b><h5>Transacciones:</h5></b><br> El cliente puede registrar tanto una compra de uno o mas modelos que esten registrados
                A su vez, puede ver el detalle de la compra permitiendo ahi mismo descargar el modelo<br>
                <b><h5>Consulta:</h5></b><br> El cliente va a ser poder capaz de realizar un pedido de modelo personalizado, con caracteristcas ,fecha y precio estimado<br>
                .<b><h5>Informes:</h5></b><br> Una información muy valiosa para el cliente, capaz de detallar datos como Cantidad de Ventas de modelos y su total, 
                Usuarios Que no compraron durante periodo especifico,Modelos con mas cantidad de Me gusta, Ventas total Por mes en un año especificado.
                En ningún caso debe entenderse que la solicitud de un producto o servicio implica obligación
                alguna para el Acceso y uso del Servicio.<br>

                Para operar el Servicio se requerirá siempre que se trate de clientes de Unique3D,
                quienes podrán acceder mediante la aplicacion web. <br>El cliente deberá
                registrarse como usuario administrador , que será provisto por la
                aplicación <br>como requisito previo a la primera operación, en la forma que le sea requerida. La clave
                personal y todo o cualquier otro mecanismo adicional de autenticación personal<br> provisto por el
                Banco tiene el carácter de secreto e intransferible, y por lo tanto asumo las consecuencias de su
                divulgación a terceros, liberando a tiseraCompany de toda responsabilidad que de ello se
                derive. <br>En ningún caso tiseraCompany requerirá que le suministre la totalidad de los datos, ni
                enviará mail requiriendo información personal alguna.
                Costo del servicio.<br>
                La Empresa, tiseraCompany podrá cobrar comisiones por el mantenimiento y/o uso de este
                Servicio o los que en el futuro implemente, entendiéndose facultado expresamente <br>para efectuar
                los correspondientes débitos en mis cuentas, aún en descubierto, por lo que presto para ello mi
                expresa conformidad. En caso de cualquier modificación a la presente previsión, lo comunicará
                con al menos 60 días de antelación.
                Vigencia.<br>
                El Usuario podrá dejar sin efecto la relación que surja de la presente, en forma inmediata, sin otra
                responsabilidad que la derivada de los gastos originados hasta ese momento.<br> Si el cliente
                incumpliera cualquiera de las obligaciones asumidas en su relación contractual con Empresa,
                tiseraCompany, o de los presentes Términos y Condiciones, el Banco podrá decretar la
                caducidad del presente Servicio en forma inmediata, sin que ello genere derecho a indemnización
                o compensación alguna. <br>Empresa, tiseraCompany podrá dejar sin efecto la relación que surja
                de la presente, con un preaviso mínimo de 60 días, sin otra responsabilidad.<br>
                Validez de operaciones y notificaciones.
                Los registros emitidos por la appWeb serán prueba suficiente de las operaciones cursadas por dicho
                canal. Renuncio expresamente a cuestionar la idoneidad o habilidad de ese medio de prueba. <br>A los
                efectos del cumplimiento de disposiciones legales o contractuales, se otorga a las notificaciones
                por este medio el mismo alcance de las notificaciones mediante documento escrito.
                Propiedad intelectual.<br>
                El software en Argentina está protegido por la ley 11.723, que regula la propiedad intelectual y los
                derechos de autor de todos aquellos creadores de obras artísticas, literarias y científicas.
                Privacidad de la información.<br>
                Para utilizar los Servicios ofrecidos por tiseraCompany, los Usuarios deberán facilitar
                determinados datos de carácter personal.<br> Su información personal se procesa y almacena en
                servidores o medios magnéticos que mantienen altos estándares de seguridad y protección tanto
                física como tecnológica.<br> Para mayor información sobre la privacidad de los Datos Personales y
                casos en los que será revelada la información personal, se pueden consultar nuestras políticas de
                privacidad.
            </p>
        </div>   



        <%@include file="foot.jsp"%>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
