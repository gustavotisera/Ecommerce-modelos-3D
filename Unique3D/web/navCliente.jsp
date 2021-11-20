                 
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <c:choose>
                    <c:when test="${rol.equals('Administrador')}">
                        <a class="navbar-brand" href="/Unique3D/menuAdmin.jsp">Menu Admin</a>
                    </c:when>
                    <c:otherwise>
                        <a class="navbar-brand" href="/Unique3D/index.jsp">Unique3d Store</a>

                    </c:otherwise>
                </c:choose>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="carritoServlet?acc=home">Ver Modelos</a>
                        </li>
                        <c:if test="${footer != 0}">
                            <li class="nav-item">
                                <a class="nav-link" href="carritoServlet?acc=Carrito"><i class="fas fa-cart-plus">(${contador})</i></a>
                            </li> 
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link active" href="/Unique3D/pedido.jsp">Diseño a pedido</a>
                        </li>
                    </ul>
                    <form action="/Unique3D/carritoServlet" class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Buscar" name="txtBuscar" aria-label="Search">
                        <input class="btn outline-info" name="acc" value="Buscar" type="submit">
                    </form>

                    <ul class="navbar-nav">
                        <li class="nav-item dropdown drop-left">
                            <a class="nav-link  dropdown-toggle" href=""  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <c:choose>
                                    <c:when test="${ not empty usuario}">${usuario}</c:when>
                                    <c:otherwise>Iniciar Sesion</c:otherwise>
                                </c:choose>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <c:choose>
                                        <c:when test="${ not empty usuario}"><a class="dropdown-item" href="/Unique3D/cuentaUsuario.jsp">Cuenta</a></c:when>
                                        <c:otherwise><a class="dropdown-item" href="/Unique3D/login.jsp">Ingresar</a></c:otherwise>
                                    </c:choose>
                                </li>
                                <li> <c:choose>
                                        <c:when test="${ not empty usuario}"><a class="dropdown-item" href="/Unique3D/cerrarSesion.jsp">Cerrar Sesion</a></c:when>
                                        <c:otherwise><a class="dropdown-item" href="/Unique3D/altaUsuarioServlet">Registrarse</a></c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>  
                            
                        </li>
                    </ul>
                </div>
            </div>
        </nav>