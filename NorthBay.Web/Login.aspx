<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" AutoEventWireup="True"
    CodeBehind="Login.aspx.cs" Inherits="NorthBay.Web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Login
        </div>
        <div id="main_body">
            <custom:ValidationGroupPanel runat="server" ValidationGroup="Login">
                <div class="login_inputs">
                    <div class="bold">
                        Username:
                    </div>
                    <custom:TextBox runat="server" ID="txt_user" Required="True" />
                </div>
                <div class="login_inputs">
                    <div class="bold">
                        Password:
                    </div>
                    <custom:TextBox runat="server" ID="txt_password" TextMode="Password" Required="True" />
                </div>
                <asp:Button runat="server" ID="btn_login" Text="Login" OnClick="ButtonClick" />
            </custom:ValidationGroupPanel>
        </div>
    </div>
</asp:Content>
