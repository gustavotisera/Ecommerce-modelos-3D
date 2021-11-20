$(document).ready(function () {
    $("#btnDelete").click(function () {

        var idp = $(this).parent().find("#idp").val();
        swal({
        
        title: "Are you sure?",
                text: "Once deleted, you will not be able to recover this imaginary file!",
                icon: "warning",
                buttons: true,
                dangerMode: true, 
    })
            .then((willDelete) => {
                if (willDelete) {
                    eliminar(idp);
                    swal("Poof! Your imaginary file has been deleted!", {
                        icon: "success",
                    }).then((willDelete) => {
                        if (willDelete) {
                            parent.location.href = "listaPedidos.jsp"
                        }
                    });
                } else {
                    swal("Your imaginary file is safe!");
                }
            });
});
function eliminar(idp) {
    var url = "eliminarPedido?";
    $.ajax({
    type: 'POST',
            url: url,
            data: "idPed=" + idp,
            success: function (data, textStatus, jqXHR) {

            }
    })
    }
}
);
