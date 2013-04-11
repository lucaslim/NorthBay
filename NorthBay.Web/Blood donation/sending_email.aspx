<%@ Page Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="sending_email.aspx.cs" Inherits="NorthBay.Web.Blood_donation.sending_email" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">--%>
    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table>
     <tr>  <td> To :</td><td><asp:Label ID="email_to" runat="server" Text=""/></td></tr>
     <tr> <td>  Your E-Mail :</td><td><asp:TextBox ID="email_from" runat="server" /></td>
     <td><asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="email_from" Text="* Required" ValidationGroup="vg_send" /></td>
     <td><asp:RegularExpressionValidator ID="rev_email" runat="server" ValidationGroup="vg_send" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ErrorMessage="Not a valid email" ControlToValidate="email_from" /></td></tr>
        <tr>
        <td>Message :</td><td><asp:TextBox ID="BodyTextBox" runat="server" TextMode="MultiLine"/></td>
        <td><asp:RequiredFieldValidator ID="rfv_message" runat="server" Text="* Required" ValidationGroup="vg_send" ControlToValidate="BodyTextBox" /></td></tr>
        <tr><td></td><td><asp:Button ID="send_email" runat="server" OnClick="SendButton_Click" ValidationGroup="vg_send" Text="Send" /></td></tr>
        
     </table>
     <asp:Label ID="success" runat="server" />
    </div>
    </asp:Content>
    <%--</form>
</body>
</html>--%>
