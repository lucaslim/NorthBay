<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" AutoEventWireup="True"
    CodeBehind="Login.aspx.cs" Inherits="NorthBay.Web.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Login
        </div>
        <div id="main_body">
            <custom:ValidationGroupPanel runat="server" ValidationGroup="Login">
                <div>
                    <asp:Literal runat="server" ID="lit_error"></asp:Literal>
                </div>
                <div class="input_label bold">
                    Username:
                </div>
                <div class="input_control">
                    <custom:TextBox runat="server" ID="txt_user" Required="True" />
                </div>
                <div class="input_label bold">
                    Password:
                </div>
                <div class="input_control">
                    <custom:TextBox runat="server" ID="txt_password" TextMode="Password" Required="True" />
                </div>
                <asp:Button runat="server" ID="btn_login" Text="Login" />
            </custom:ValidationGroupPanel>
        </div>
    </div>
</asp:Content>
