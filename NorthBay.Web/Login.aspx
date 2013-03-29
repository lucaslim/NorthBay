<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" AutoEventWireup="True"
    CodeBehind="Login.aspx.cs" Inherits="NorthBay.Web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <custom:ValidationGroupPanel runat="server" ValidationGroup="Login">
        Username:
        <br />
        <custom:TextBox runat="server" ID="txt_user" Required="True" />
        <br />
        Password:<br />
        <custom:TextBox runat="server" ID="txt_password" Required="True" />
        <br />
        <asp:Button runat="server" ID="btn_login" Text="Login" OnClick="ButtonClick" />
    </custom:ValidationGroupPanel>
</asp:Content>
