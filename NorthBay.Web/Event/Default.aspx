<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" AutoEventWireup="true" Inherits="NorthBay.Web.Event.Event_Default" Codebehind="Default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Display an event Calendar with hopital special events--> 
  <div>
        <strong><font face="verdana">Event Calendar</font></strong>:<br />
        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="400px"
            NextPrevFormat="ShortMonth" Width="100%" BorderStyle="Solid" CellSpacing="1" OnDayRender="Calendar1_DayRender">
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TodayDayStyle BackColor="#999999" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
            <TitleStyle BackColor="#333399" Font-Bold="True"
                Font-Size="12pt" ForeColor="White" BorderStyle="Solid" Height="12pt" />
            <DayStyle BackColor="#CCCCCC" />
        </asp:Calendar>
        &nbsp;
    </div>
</asp:Content>

