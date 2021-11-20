function validacion() {
    nombre = document.getElementById("txtNombre").value;
    clave = document.getElementById("clave").value;

    if (nombre == null || nombre.length == 0 || /^\s+$/.test(nombre)) {
        alert('[ERROR] Debe introducir texto');
        return false;
    } else if (clave == null || clave.length == 0 || /^\s+$/.test(clave))
    {
        alert('[ERROR] Debe introducir texto');
        return false;
    }

}

function validacionAltaUsuario() {
    var nombre, clave, email, rol, expresion;
    nombre = document.getElementById("txtNombre").value;
    clave = document.getElementById("txtPassword").value;
    email = document.getElementById("txtEmail").value;
    rol = document.getElementById("cboRol").selectedIndex;

    if (nombre == null || nombre.length == 0 || /^\s+$/.test(nombre)) {
        alert('[ERROR] Debe introducir texto');
        return false;
    } else if (clave == null || clave.length == 0 || /^\s+$/.test(clave))
    {
        alert('[ERROR] Debe introducir texto');
        return false;
    } else if (email == null || email.length == 0 || /^\s+$/.test(email) && !(/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)/.test(email)))
    {
        alert('[ERROR] Debe introducir texto o el Formato de mail incorrecto');
        return false;
    } else if (nombre.length > 30 || clave.length > 30) {
        alert('[ERROR] El nombre de usuario o la clave solo deben tener 20 caracteres como máximo!');
        return false;
    } else if (email.length > 100) {
        alert('[ERROR] El correo es muy largo');
        return false;
    }
    

}


        function validacionAltaModelo()
        {
            var nombre, descripcion, parametros, fecha, precio, dirI, dirA;

            nombre = document.getElementById("txtNombre").value;
            descripcion = document.getElementById("txtDescripcion").value;
            parametros = document.getElementById("txtParametros").value;
            fecha = document.getElementById("txtFecha").value;
            precio = document.getElementById("txtPrecio").value;
            dirI = document.getElementById("txtnomA").value;
            dirA = document.getElementById("txtArchivo").value;

            if (nombre === "" || descripcion === "" || parametros === "" || fecha === "" || precio === "" || dirI === "" || dirA === "") {
                alert('[ERROR] Todos los campos son obligatorios');
                return false;
            } else if (nombre.length > 45) {
                alert('[ERROR] El nombre del modelo solo debe tener 45 caracteres como máximo!');
                return false;
            } else if (descripcion.length > 140) {
                alert('[ERROR] La descripcion del modelo solo debe tener 140 caracteres como máximo!');
                return false;
            } else if (dirI.length > 250) {
                alert('[ERROR] La direccion de la imagen del modelo solo debe tener 250 caracteres como máximo!');
                return false;
            } else if (dirA.length > 250) {
                alert('[ERROR]  La direccion del archivo del modelo  solo debe tener 250 caracteres como máximo!');
                return false;
            } else if (parametros.length > 140) {
                alert('[ERROR]  Los parametros del modelo solo debe tener 140 caracteres como máximo!');
                return false;
            } else if (isNaN(precio)) {
                alert('[ERROR]  El precio ingresado no es un numero!');
                return false;
            }

        }

function validarPago()
{

}

