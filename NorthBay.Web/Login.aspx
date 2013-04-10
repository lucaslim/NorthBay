<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NorthBay.Web.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Login
        </div>
        <div id="main_body">
            <custom:ValidationGroupPanel ID="ValidationGroupPanel1" runat="server" ValidationGroup="Login" DefaultButton="btn_login">
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
                <asp:Button runat="server" ID="btn_login" Text="Login" OnClick="ButtonClick" />
            </custom:ValidationGroupPanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cph3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph4" runat="server">
</asp:Content>
