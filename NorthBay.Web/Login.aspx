<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NorthBay.Web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
    </div>
    </form>
</body>
</html>
