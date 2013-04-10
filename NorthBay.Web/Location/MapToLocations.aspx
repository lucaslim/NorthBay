<%@ Page Language="C#" AutoEventWireup="true" Inherits="NorthBay.Web.Location.Location_MapToLocations" Codebehind="MapToLocations.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%--Get direction to the selected location from the given location using goole API--%>
<head runat="server">
    <title>Map to locations</title>
    <script language="javascript" type="text/javascript" src="Scripts/jquery-1.8.2.min.js"></script>
    <script language="javascript" type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
    <script language="javascript" type="text/javascript">

        $(document).ready(function () {

            try {
                var FromAutoComplete = new google.maps.places.Autocomplete($("#txtFrom")[0], {});
                var ToAutoComplete = new google.maps.places.Autocomplete($("#txtTo")[0], {});

                google.maps.event.addListener(FromAutoComplete, 'place_changed', function () {
                    var place = FromAutoComplete.getPlace();
                });

                google.maps.event.addListener(ToAutoComplete, 'place_changed', function () {
                    var place = ToAutoComplete.getPlace();
                });
            }
            catch (E) {
                alert(E.message);
            }


        });

    </script>
    <script language="javascript" type="text/javascript">

        var DirectionsDisplay;
        var DirectionsService = new google.maps.DirectionsService();

        function InitializeGoogleMap() {

            try {
                DirectionsDisplay = new google.maps.DirectionsRenderer();
                var LatitudeLongitude = new google.maps.LatLng(56.13037, -106.34677);
                var GoogleMapOptions =
                    {
                        zoom: 4,
                        center: LatitudeLongitude,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                var map = new google.maps.Map($("#DivGoogleMapCanvas")[0], GoogleMapOptions);

                DirectionsDisplay.setMap(map);
                DirectionsDisplay.setPanel($("#DivDirectionRouteStatus")[0]);
            }
            catch (E) {
                alert(E.message);
            }



        }

        function GetDirectionRoute() {

            try {
                if ($("#txtFrom").val().length != 0 && $("#txtTo").val().length != 0) {

                    var From = $("#txtFrom").val();
                    var To = $("#txtTo").val();
                    var Request = {
                        origin: From,
                        destination: To,
                        travelMode: google.maps.DirectionsTravelMode.DRIVING
                    };
                    DirectionsService.route(Request, function (response, status) {
                        if (status == google.maps.DirectionsStatus.OK) {
                            DirectionsDisplay.setDirections(response);
                        }
                    });
                }
                else {
                    if ($("#txtFrom").val().length == 0) {
                        alert("Enter From Location");
                    }
                    else if ($("#txtTo").val().length == 0) {
                        alert("Enter To Location");
                    }
                }
            }
            catch (E) {
                alert(E.message);
            }

        }

    </script>
</head>
<body onload="InitializeGoogleMap(); return false">
    <form id="form1" runat="server">
    <div>
        <table border="0" cellspacing="5" cellpadding="5" align="center" width="100%">
            <tr>
                <td style="width: 20%" align="center" valign="middle">
                    From
                </td>
                <td style="width: 80%">
                    <asp:TextBox ID="txtFrom" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20%" align="center" valign="middle">
                    To
                </td>
                <td style="width: 80%">
                    <asp:TextBox ID="txtTo" runat="server" Width="400px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20%">
                </td>
                <td style="width: 80%">
                    <asp:Button ID="btnDirections" runat="server" Text="Direction" Width="200px" OnClientClick="GetDirectionRoute(); return false" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 100%">
                    <table border="0" cellspacing="2" cellpadding="2" align="center" width="100%">
                        <tr>
                            <td style="width: 40%">
                                <div id="DivDirectionRouteStatus" style="height: 480px; overflow: auto">
                                </div>
                            </td>
                            <td style="width: 60%">
                                <div id="DivGoogleMapCanvas" style="height: 480px;">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
