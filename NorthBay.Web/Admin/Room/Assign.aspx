<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Assign.aspx.cs" Inherits="NorthBay.Web.Admin.Room.Assign" %>

<%@ Import Namespace="NorthBay.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Room Availability
        </div>
        <div id="main_body">
            <custom:ValidationGroupPanel runat="server" ValidationGroup="room">
                <div class="input_label bold">
                    Room:
                </div>
                <div class="input_control">
                    <asp:Label runat="server" ID="lbl_room"></asp:Label>
                </div>
                <div class="input_label bold">
                    Building:
                </div>
                <div class="input_control">
                    <asp:Label runat="server" ID="lbl_building"></asp:Label>
                </div>
                <div class="input_label bold">
                    Level:
                </div>
                <div class="input_control">
                    <asp:Label runat="server" ID="lbl_level"></asp:Label>
                </div>
                <div class="input_label bold">
                    Additional Equipments:
                </div>
                <div class="input_control">
                    <asp:Repeater runat="server" ID="rpt_equipments">
                        <HeaderTemplate>
                            <table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="padding-right: 10px;">
                                    <%# Eval("Description") %><asp:HiddenField runat="server" ID="hf_id" Value='<%# Eval("EquipmentId") %>' />
                                </td>
                                <td>
                                    :
                                    <custom:TextBox runat="server" ID="txt_quantity" Width="15px" ValidType="Numbers"
                                        ValidationGroup="room"></custom:TextBox>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="input_label bold">
                    Assign to:
                </div>
                <div class="input_control">
                    <custom:DropDownList runat="server" ID="ddl_patients" />
                </div>
                <asp:Button runat="server" ID="btn_update" Text="Update" CommandName="update" OnClick="Button_Click"
                    CausesValidation="True" ValidationGroup="room" />
                &nbsp;
                <asp:Button runat="server" ID="btn_checkout" Text="Check-Out" CommandName="checkout"
                    CausesValidation="True" ValidationGroup="room" OnClick="Button_Click" Visible="False" />
                &nbsp;
            </custom:ValidationGroupPanel>
        </div>
        <div class="main-content">
            <asp:Panel runat="server" ID="pnl_address" Visible="False">
                <asp:UpdatePanel runat="server" ID="up_address" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:DataList runat="server" ID="dl_address" RepeatDirection="Horizontal" RepeatColumns="3">
                            <HeaderTemplate>
                                <hr class="line_long" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="billing_address_container">
                                    <table class="billing_address">
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
                                        <tr runat="server" visible='<%# !string.IsNullOrEmpty(TextHelper.ToString(Eval("AddressLine2"))) %>'>
                                            <td>
                                                <%# Eval("AddressLine2")%>
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
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                <hr class="line_long" />
                            </FooterTemplate>
                        </asp:DataList>
                        <asp:Label runat="server" ID="lbl_output"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <custom:ValidationGroupPanel runat="server" ID="vgp_address" ValidationGroup="billing">
                    <div class="input_label bold">
                        Full Name:
                    </div>
                    <div class="input_control">
                        <custom:TextBox runat="server" ID="txt_fullname" Required="True" ValidationGroup="billing"></custom:TextBox>
                    </div>
                    <div class="input_label bold">
                        Address Line 1:
                    </div>
                    <div class="input_control">
                        <custom:TextBox runat="server" ID="txt_address1" Required="True" ValidationGroup="billing"></custom:TextBox>
                    </div>
                    <div class="input_label bold">
                        Address Line 2:
                    </div>
                    <div class="input_control">
                        <custom:TextBox runat="server" ID="txt_address2" ValidationGroup="billing"></custom:TextBox>
                    </div>
                    <div class="input_label bold">
                        City:
                    </div>
                    <div class="input_control">
                        <custom:TextBox runat="server" ID="txt_city" Required="True" ValidType="Characters"
                            ValidationGroup="billing"></custom:TextBox>
                    </div>
                    <div class="input_label bold">
                        State:
                    </div>
                    <div class="input_control">
                        <custom:TextBox runat="server" ID="txt_state" Required="True" ValidType="Characters"
                            ValidationGroup="billing"></custom:TextBox>
                    </div>
                    <div class="input_label bold">
                        Country:
                    </div>
                    <div class="input_control">
                        <custom:DropDownList runat="server" ID="ddl_country" Required="True" ValidationGroup="billing" />
                    </div>
                    <div class="input_label bold">
                        Postal Code:
                    </div>
                    <div class="input_control">
                        <custom:TextBox runat="server" ID="txt_postalcode" Required="True" ValidType="PostalCode"
                            ValidationGroup="billing"></custom:TextBox>
                    </div>
                    <div class="input_label bold">
                        Phone Number:
                    </div>
                    <div class="input_control">
                        <custom:TextBox runat="server" ID="txt_phone" Required="True" ValidType="Numbers"
                            ValidationGroup="billing"></custom:TextBox>
                    </div>
                    <asp:Button runat="server" ID="btn_new_bill" Text="Bill to this address" CommandName="NewBill"
                        OnClick="Button_Click" CausesValidation="True" ValidationGroup="billing" />
                    &nbsp;
                    <asp:Button runat="server" ID="btn_cancel" CommandName="Cancel" CausesValidation="False"
                        Text="Cancel" OnClick="Button_Click" />
                </custom:ValidationGroupPanel>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
