<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="apis.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
       <title>Google Maps picker</title>
    <!--Bostrap y jQuerry-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <!--Complemento del PLugin-->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key='></script>
    <script src="Js/locationpicker.jquery%20(1).js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
             <!--Botton-->
            <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default"> 
            <span class="glyphicon glyphicon-map-marker"></span><span id="ubicacion">Selecionar ubicacion</span>
            </button>
             <!--del js-->
            <style>
                .pac-container{


                    z-index: 99999;
                }


            </style>
             <!--creacion del modal-->
            <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog" >
                <div class="modal-dialog" role="document" >
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Ubicacion:</label>
                                    <div class="col-sm-9"></div>
                                    <asp:textbox ID="ModalMapaddress" CssClass="form-control" runat="server"></asp:textbox>
                                </div>
                                 <!--cerramos el modal-->
                                <div class="col-sm-1"> 
                                   <button type="button"  class="close" data-dismiss="modal" aria-label="cerrar"> 
                                     <span aria-hidden="true">&times;</span>
                                   </button>
                                </div>
                            </div>
                            <div id="ModalMapPreview" style="width:100%; height:400px;" ></div>
                            <div class="clearfix">&nbsp;</div>
                            <div class="m-t-small">
                                <label class="p-r-small col-sm-1 control-label"> latitud:</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="ModelMapLat" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <label class="p-r-small col-sm-1 control-label">Longitud:</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="ModalMapLong" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">Aceptar</button>
                                </div>
                                <div class="clearfix" ></div>
                            </div>
                            <script>
                                $('#ModalMapPreview').locationpicker ({

                                    radius: 0,
                                    location: {
                                        latitude: 27.368232944078507,
                                        longitude: -109.93098791787901

                                    },
                                    enableAutocomplete: true,
                                    inputBinding: {
                                        latitudeInput: $('#<%=ModelMapLat.ClientID%>'),
                                        longitudeInput: $('#<%=ModalMapLong.ClientID%>'),
                                        locationNameInput:$('#<%=ModalMapaddress.ClientID%>')


                                    },
                                    onchanged: function (currentLocation, radius, isMarkerDropped) {
                                        $('#ubicacion').html($('#<%=ModalMapaddress.ClientID%>').val());




                                    }

                                   
                                });
                                $('ModalMap').on('show.bs.modal', function () {
                                    $('#ModalMapPreview').locationpicker('autosize');
                                });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    
</body>
</html>
