<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProcessingModal.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        /*css process modal -  processing-modal*/
        .modal-static { 
            position: fixed;
            top: 50% !important; 
            left: 50% !important; 
            margin-top: -100px;  
            margin-left: -150px; 
            overflow: visible !important;
        }
        .modal-static,
        .modal-static .modal-dialog,
        .modal-static .modal-content {
            width: 300px; 
            height: 90px; 
        }
        .modal-static .modal-dialog,
        .modal-static .modal-content {
            padding: 0 !important; 
            margin: 0 !important;
        }
        .modal-static .modal-content .icon {
        }
        .modal-text{
            text-align:center;
            font-family:Cambria;
            font-weight:bold;
            font-size:medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <hr />
    <div class="container">
        <input id="btnGrabar" value="Grabar Datos" class="btn btn-primary" />
    </div>

        <div class="modal modal-static fade" id="processing-modal" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="text-center">
                            <img src="../images/loading.gif" class="icon" />
                            <h5><span class="modal-text">Procesando, Espere por favor... </span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <script src="Scripts/jquery.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        $("#btnGrabar").click("click", function () {
            var md = $("#processing-modal");
            md.modal('show');

            $.ajax({
                type: "POST",
                url: "Default.aspx/auxi",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    md.modal('hide');
                    alert(msg.d);
                },
                error: function (msg) {
                    md.modal('hide');
                    alert(msg.d);
                }
            });

        });
    </script>
</body>
</html>
