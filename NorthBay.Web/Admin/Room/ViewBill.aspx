<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="ViewBill.aspx.cs" Inherits="NorthBay.Web.Admin.Room.ViewBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="billing_container">
        <table id="billing_header" class="billing">
            <tr>
                <td id="name">
                    <label>
                        Patient Name:</label><br />
                    <asp:Literal runat="server" ID="lit_name"></asp:Literal>
                </td>
                <td id="number">
                    <label>
                        Patient Account Number:</label><br />
                    <asp:Literal runat="server" ID="lit_number"></asp:Literal>
                </td>
                <td id="date">
                    <label>
                        Billing Date:</label><br />
                    <asp:Literal runat="server" ID="lit_billingdate"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <label>
                        Billing Address:</label><br />
                    <asp:Literal runat="server" ID="lit_address"></asp:Literal>
                </td>
            </tr>
        </table>
        <br />
        <table id="billing_content" class="billing">
            <asp:Literal runat="server" ID="lit_content"></asp:Literal>
            <tr>
                <td id="subtotal" colspan="2">
                    Sub Total:
                </td>
                <td>
                    <asp:Literal runat="server" ID="lit_subtotal"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td id="tax" colspan="2">
                    Sub Total:
                </td>
                <td>
                    <asp:Literal runat="server" ID="lit_tax"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td id="total" colspan="2">
                    Total:
                </td>
                <td>
                    <asp:Literal runat="server" ID="lit_total"></asp:Literal>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
