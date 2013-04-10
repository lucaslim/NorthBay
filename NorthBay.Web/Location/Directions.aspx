<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" AutoEventWireup="true" Inherits="NorthBay.Web.Location.Location_Directions" Codebehind="Directions.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--Display direction for selected location--%>
    <h3>Get Directions</h3>
<center>
    <asp:Literal ID="lit_maptolocations" runat="server"></asp:Literal>
</center>  
</asp:Content>

