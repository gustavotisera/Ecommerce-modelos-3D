
<nav class="navbar navbar-expand-lg navbar-dark bg-info">
    <div class="container">
        <a class="navbar-brand" href="/Unique3D/menuAdmin.jsp">Menu Admin</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="carritoServlet?acc=home">Modelos Vista Cliente</a>
                </li>                

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/Unique3D/MenuReportes.jsp">Menu Reportes</a>
                </li> 
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Configuracion de cuenta
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/Unique3D/cuentaUsuario.jsp">Cuenta</a></li>

                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/Unique3D/cerrarSesion.jsp">Cerrar Sesion</a></li>
                    </ul>
                </li>
            </ul>
            <div class="col-sm-2">
                <ul class="navbar-nav">                
                    <h6 class="navbar-nav" href="#" style="color: #0dcaf0" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <% out.print(user);%>
                    </h6>                           
                </ul>

            </div>


        </div>
    </div>
</nav>
