<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="ViewBill.aspx.cs" Inherits="NorthBay.Web.Admin.Room.ViewBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            View Billed Invoice
        </div>
        <div id="main_body">
            <div id="billing_container">
                <table id="billing_header" class="billing">
                    <tr>
                        <td id="name">
                            <div class="input_label bold">
                                Patient Name:
                            </div>
                            <div class="input_control">
                                <asp:Literal runat="server" ID="lit_name"></asp:Literal>
                            </div>
                        </td>
                        <td id="number">
                            <div class="input_label bold">
                                Patient Account Number:
                            </div>
                            <div class="input_control">
                                <asp:Literal runat="server" ID="lit_number"></asp:Literal>
                            </div>
                        </td>
                        <td id="date">
                            <div class="input_label bold">
                                Billing Date:
                            </div>
                            <div class="input_control">
                                <asp:Literal runat="server" ID="lit_billingdate"></asp:Literal>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div class="input_label bold">
                                Billing Address:
                            </div>
                            <div class="input_control">
                                <asp:Literal runat="server" ID="lit_address"></asp:Literal>
                            </div>
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
            <p>
                <a href="Default.aspx">Return to Listing</a>
            </p>
        </div>
    </div>
</asp:Content>
