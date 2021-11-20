

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.pedido"%>
<%@page import="modelo.modelo"%>
<%@page import="modelo.reporteGrafico"%>
<%@page import="modelo.repGrafTopClientes"%>
<%@page session="true"%>
<jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/03322bb5a6.js" crossorigin="anonymous"></script>


        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
        </script>




        <title>.::MenuAdmin::.</title>
        <style>
            body{
                background-color: #15202B; color: white;
                justify-content: center;
                font-family: 'Open Sans', sans-serif;
            }
            nav{
                width: 100%;
                align-self: flex-start;
            }
            .bg-info {
                background-color: #23384e!important;
            }
            .container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
                width: 100%;
                padding-right: 7.5px;
                padding-left: 7.5px;
                margin-right: auto;
                margin-left: auto;
            }
            .row {
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
                -webkit-flex-wrap: wrap;
                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                margin-right: -7.5px;
                margin-left: -7.5px;
            }
            .small-box:hover {
                text-decoration: none;
            }
            .bg-info, .bg-info>a {
                color: #fff!important;
            }         
            .small-box {
                text-align: center;
            }
            .small-box {
                border-radius: .25rem;
                box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);
                display: block;
                margin-bottom: 20px;
                position: relative;
            }

            *, ::after, ::before {
                box-sizing: border-box;
            }
            .small-box h3, .small-box p {
                z-index: 5;
            }
            .small-box h3 {
                font-size: 2.2rem;
                font-weight: 700;
                margin: 0 0 10px;
                padding: 0;
                white-space: nowrap;
            }
            .small-box p {
                font-size: 12px;
            }
            p {
                margin-top: 0;
                margin-bottom: 1rem;
            }
            p {
                display: block;
                margin-block-start: 1em;
                margin-block-end: 1em;
                margin-inline-start: 0px;
                margin-inline-end: 0px;
            }
            .small-box>.small-box-footer {
                background-color: rgba(0,0,0,.1);
                color: rgba(255,255,255,.8);
                display: block;
                padding: 3px 0;
                position: relative;
                text-align: center;
                text-decoration: none;
                z-index: 10;
            }

            footer{ 
                display: flex;
                width: 100%;
                align-self: flex-end;
            }
            h1, h5{
                color: #ffffff;
            }
            .card-header{
               background-color:  #162d4e;
            }
            .card-body {

                background-color: #fdfdfd;
            }
            input{
                width: 0.50%;
            }
            h2{
                text-align: center;
            }
            .card{
                margin-top: 50px;
                background-color: #0d6efd;
            }




        </style>
    </head>

    <%

        String id = "";
        String user = "";
        String email = "";
        String rol = "";
        HttpSession objSesion = request.getSession();
        String usuario;
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("rol") == "Administrador") {
            usuario = objSesion.getAttribute("usuario").toString();
            id = objSesion.getAttribute("idUsuario").toString();
            email = objSesion.getAttribute("email").toString();
            rol = objSesion.getAttribute("rol").toString();
            user = "<label>" + usuario + "</label>";
        } else if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("rol") == "Cliente") {
            out.print("<script>location.replace('/Unique3D/menuCliente.jsp');</script>");
        } else {
            out.print("<script>location.replace('/Unique3D/index.jsp');</script>");
        }

    %>
    <body>
        <%@include file="navAdmin.jsp"%>
        <div class="container-fluid mt-3">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>${gestor.listaModelo.size()}</h3>

                            <p>Modelos Registrados</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-bag"></i>
                        </div>
                        <a href="/Unique3D/listadoModelosServlet" class="small-box-footer">ABM Modelos <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-success">
                        <div class="inner">
                            <h3>${gestor.obtenerPedido.size()}</h3>

                            <p>Pedidos</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
                        <a href="/Unique3D/listaPedidos.jsp" class="small-box-footer">Ver <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-warning">
                        <div class="inner">
                            <h3>4</h3>

                            <p>Reportes</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-person-add"></i>
                        </div>
                        <a  href="/Unique3D/MenuReportes.jsp" class="small-box-footer">Ver <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-6">
                    <!-- small box -->
                    <div class="small-box bg-danger">
                        <div class="inner">
                            <h3>${gestor.obtenerUsuarios.size()}</h3>

                            <p>Usuarios Registrados</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                        </div>
                        <a href="/Unique3D/listaUsuario.jsp" class="small-box-footer">Ver <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                <!-- ./col -->
                <h2>Graficos estadisticos</h2>
                <div class="col-md-6">

                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Ventas 2020/2021</h3>

                        </div>
                        <div class="card-body">
                            <canvas id="myChart" style="width:100%;max-width:600px"></canvas>


                        </div>
                        <!-- /.card-body -->
                    </div>


                </div>
                <div class="col-md-6">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">5 Clientes que mas compran</h3>

                        </div>
                        <div class="card-body">
                            <canvas id="myChart1" style="width:100%;max-width:600px"></canvas>
                        </div>
                    </div>


                </div>

            </div>
            <!-- /.row -->


        </div>
        <div hidden="">
            <c:forEach items="${gestor.reporteG}" var="a" >
                <c:choose>                        
                    <c:when test="${a.mes == 1}">
                        <input type="number" id="ENE"  value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 2}">
                        <input type="number" id="FEB"  value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 3}">
                        <input type="number" id="MAR"   value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 4}">
                        <input type="number" id="ABR"  value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 5}">
                        <input type="number" id="MAY"  value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 6}">
                        <input type="number" id="JUN"   value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 7}">
                        <input type="number" id="JUL"   value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 8}">
                        <input type="number" id="AGO"   value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 9}">
                        <input type="number" id="SEP"  value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 10}">
                        <input type="number" id="OCT"  value="${a.cantidad}">
                    </c:when>
                    <c:when test="${a.mes == 11}">
                        <input type="number" id="NOV"   value="${a.cantidad}">
                    </c:when>
                    <c:otherwise>
                        <input type="number" id="DIC"   value="${a.cantidad}">
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <div hidden="">
            <input type="number" id="ENE"   value="0">
            <input type="number" id="FEB"   value="0">
            <input type="number" id="MAR"  value="0">
            <input type="number" id="ABR"  value="0">
            <input type="number" id="MAY"   value="0">
            <input type="number" id="JUN" value="0">
            <input type="number" id="JUL"   value="0">
            <input type="number" id="AGO"  value="0">
            <input type="number" id="SEP"  value="0">
            <input type="number" id="OCT"   value="0">
            <input type="number" id="NOV"   value="0">
            <input type="number" id="DIC"   value="0">
        </div>

        <div hidden="">

            <c:forEach items="${gestor.reporteG2}" var="g2" varStatus="b">
                <c:choose>
                    <c:when test="${b.index == 0}">
                        <input type="number" value="${g2.cant}" id="cant">  
                        <input type="text" value="${g2.nom}" id="nom">  
                    </c:when>
                    <c:when test="${b.index == 1}">
                        <input type="number" value="${g2.cant}" id="cant1">  
                        <input type="text" value="${g2.nom}" id="nom1">  
                    </c:when>
                    <c:when test="${b.index == 2}">
                        <input type="number" value="${g2.cant}" id="cant2">  
                        <input type="text" value="${g2.nom}" id="nom2">  
                    </c:when>
                    <c:when test="${b.index == 3}">
                        <input type="number" value="${g2.cant}" id="cant3">  
                        <input type="text" value="${g2.nom}" id="nom3">  
                    </c:when>
                    <c:when test="${b.index == 4}">
                        <input type="number" value="${g2.cant}" id="cant4">  
                        <input type="text" value="${g2.nom}" id="nom4">  
                    </c:when>

                </c:choose>

            </c:forEach>
        </div>





        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="js/bootstrap.min.js"></script>  
    </body>
    <script>
                var ctx = document.getElementById("myChart").getContext("2d");
                var ene = document.getElementById("ENE").value;
                var feb = document.getElementById("FEB").value;
                var mar = document.getElementById("MAR").value;
                var abr = document.getElementById("ABR").value;
                var may = document.getElementById("MAY").value;
                var jun = document.getElementById("JUN").value;
                var jul = document.getElementById("JUL").value;
                var ago = document.getElementById("AGO").value;
                var sep = document.getElementById("SEP").value;
                var oct = document.getElementById("OCT").value;
                var nov = document.getElementById("NOV").value;
                var dic = document.getElementById("DIC").value;


                var myChart = new Chart(ctx, {
                    type: "line",
                    data: {
                        labels: [
                            "ENE",
                            "FEB",
                            "MAR",
                            "ABR",
                            "MAY",
                            "JUN",
                            "JUL",
                            "AGO",
                            "SEP",
                            "OCT",
                            "NOV",
                            "DIC",
                        ],
                        datasets: [
                            {
                                label: "2020",
                                data: [2, 9, 3, 17, 6, 3, 7],
                                backgroundColor: "rgba(41, 93, 90, 0.32)",
                            },
                            {
                                label: "2021",
                                data: [ene, feb, mar, abr, may, jun, jul, ago, sep, oct, nov, dic],
                                backgroundColor: "rgba(39, 93, 245, 0.49)",
                            },
                        ],
                    },
                });

                var nom = document.getElementById("nom").value;
                var nom1 = document.getElementById("nom1").value;
                var nom2 = document.getElementById("nom2").value;
                var nom3 = document.getElementById("nom3").value;
                var nom4 = document.getElementById("nom4").value;

                var cant = document.getElementById("cant").value;
                var cant1 = document.getElementById("cant1").value;
                var cant2 = document.getElementById("cant2").value;
                var cant3 = document.getElementById("cant3").value;
                var cant4 = document.getElementById("cant4").value;


                var xValues = [nom, nom1, nom2, nom3, nom4];
                var yValues = [cant, cant1, cant2, cant3, cant4];

                var barColors = [
                    "#b91d47",
                    "#00aba9",
                    "#2b5797",
                    "#e8c3b9",
                    "#1e7145"
                ];

                new Chart("myChart1", {
                    type: "doughnut",
                    data: {
                        labels: xValues,
                        datasets: [{
                                backgroundColor: barColors,
                                data: yValues
                            }]
                    },
                    options: {
                        title: {
                            display: true,
                            text: "Clientes"
                        }
                    }
                });

    </script>
</html>

