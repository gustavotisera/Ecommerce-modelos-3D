<%-- 

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.reporteGrafico"%>
<%@page session="true"%>
<jsp:useBean id="gestor" scope="request" class="gestor.GestorDB"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <style>
            .container {
                width: 70%;
                margin: 15px auto;
            }
            body {
                text-align: center;
                color: green;
            }
            h2 {
                text-align: center;
                font-family: "Verdana", sans-serif;
                font-size: 30px;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h2>Reporte estadisticos</h2>
            <div>
                <canvas id="myChart"></canvas>

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

            <div class="col-md-6 m-3">
                    <div class="card card-danger">
                        <div class="card-header">
                            <h3 class="card-title">10 Clientes que mas compran</h3>
                            <div class="card-body">
                                <canvas id="myChart2"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

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
                        label: "work load",
                        data: [2, 9, 3, 17, 6, 3, 7],
                        backgroundColor: "rgba(153,205,1,0.6)",
                    },
                    {
                        label: "Meses",
                        data: [ene, feb, mar, abr, may, jun, jul, ago, sep, oct, nov, dic],
                        backgroundColor: "rgba(155,153,10,0.6)",
                    },
                ],
            },
        });
        
        
        
        
         var ctx2 = document.getElementById("myChart2").getContext("2d");
        var myChart2 = new Chart(ctx2, {
            type: "doughnut",
            data = {
                datasets: [{
                        data: [10, 20, 30]
                    }],
                // These labels appear in the legend and in the tooltips when hovering different arcs
                labels: [
                    'Red',
                    'Yellow',
                    'Blue'
                ]
            }

        });
        ;
    </script>
</html>
