<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Room.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Room Availability
        </div>
        <div id="main_body">
            <p>
                Here at NorthBay Regional Healthcare Centre, we want to make sure that every patient
                here is well taken care of and every patient has a room should the need arise.
            </p>
            <p>
                The rooms over here at NorthBay Regional Healthcare Centre cost approximately
                <b><asp:Literal runat="server" ID="lit_average"></asp:Literal></b>
                a night. Below are the number of rooms available for each building in NorthBay Regional
                Healthcare Centre
            </p>
            <asp:Repeater runat="server" ID="rpt_rooms">
                <ItemTemplate>
                    <div class="input_label bold">
                        Building
                        <%# ((KeyValuePair<string, int>)Container.DataItem).Key%>:
                    </div>
                    <div class="input_control">
                        <%# ((KeyValuePair<string, int>)Container.DataItem).Value%>
                        Rooms Available
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
