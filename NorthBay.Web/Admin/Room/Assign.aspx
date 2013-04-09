<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Assign.aspx.cs" Inherits="NorthBay.Web.Admin.Room.Assign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>
                Room:
                <asp:Label runat="server" ID="lbl_room"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Building:
                <asp:Label runat="server" ID="lbl_building"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Level:
                <asp:Label runat="server" ID="lbl_level"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <h3>
                    Additional Equipments:</h3>
                <br />
                <asp:Repeater runat="server" ID="rpt_equipments">
                    <HeaderTemplate>
                        <table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# Eval("Description") %><asp:HiddenField runat="server" ID="hf_id" Value='<%# Eval("EquipmentId") %>' />
                            </td>
                            <td>
                                <custom:TextBox runat="server" ID="txt_quantity"></custom:TextBox>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Assign to:
                <custom:DropDownList runat="server" ID="ddl_patients" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button runat="server" ID="btn_update" Text="Update" CommandName="update" OnClick="Button_Click" />
                &nbsp;
                <asp:Button runat="server" ID="btn_checkout" Text="Check-Out" CommandName="checkout"
                    OnClick="Button_Click" Visible="False" />
                &nbsp;
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:UpdatePanel runat="server" ID="up_address" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel runat="server" ID="pnl_address" Visible="False">
                            <asp:DataList runat="server" ID="dl_address" RepeatDirection="Horizontal" RepeatColumns="3">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <%# Eval("FullName") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%# Eval("AddressLine1") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%# Eval("AddressLine2") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%# Eval("City") + ", " + Eval("State") + " " + Eval("PostalCode") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <%# Eval("CountryName") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button runat="server" ID="btn_ship" Text="Bill to this Address" CommandName="ExistingBill"
                                                    CommandArgument='<%# Eval("UserBillingAddressId") %>' OnClick="Button_Click"
                                                    CausesValidation="False" OnClientClick="return confirm('Are you sure you want to bill to this address?');" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <hr />
                                </FooterTemplate>
                            </asp:DataList>
                            <asp:Label runat="server" ID="lbl_output"></asp:Label>
                            <custom:ValidationGroupPanel runat="server" ID="vgp_address" ValidationGroup="billing">
                                <asp:Table ID="Table1" runat="server">
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            Full Name:<br />
                                            <custom:TextBox runat="server" ID="txt_fullname" Required="True"></custom:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            Address Line 1:<br />
                                            <custom:TextBox runat="server" ID="txt_address1" Required="True"></custom:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            Address Line 2:<br />
                                            <custom:TextBox runat="server" ID="txt_address2"></custom:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            City:<br />
                                            <custom:TextBox runat="server" ID="txt_city" Required="True"></custom:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            State:<br />
                                            <custom:TextBox runat="server" ID="txt_state" Required="True"></custom:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            Country:<br />
                                            <custom:DropDownList runat="server" ID="ddl_country" Required="True" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            Postal Code:<br />
                                            <custom:TextBox runat="server" ID="txt_postalcode" Required="True"></custom:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            Phone Number:<br />
                                            <custom:TextBox runat="server" ID="txt_phone" Required="True"></custom:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow>
                                        <asp:TableCell>
                                            <asp:Button runat="server" ID="btn_new_bill" Text="Bill to this address" CommandName="NewBill"
                                                OnClick="Button_Click" OnClientClick="return confirm('Are you sure you want to bill to the above address?');" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </custom:ValidationGroupPanel>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
