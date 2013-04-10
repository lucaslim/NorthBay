<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="CheckOut.aspx.cs" Inherits="NorthBay.Web.Gift.CheckOut" %>

<%@ Import Namespace="NorthBay.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Wizard runat="server" ID="wiz_cart" BackColor="#E6E2D8" BorderColor="#999999"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
        DisplaySideBar="False" ActiveStepIndex="0" OnFinishButtonClick="WizCart_FinishButtonClick"
        OnActiveStepChanged="WizCart_ActiveStepChanged" OnPreviousButtonClick="WizCart_PreviousButtonClick" Width="100%">
        <HeaderStyle BackColor="#666666" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
            ForeColor="White" HorizontalAlign="Center" BorderColor="#E6E2D8" BorderWidth="2px" />
        <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
        <SideBarButtonStyle ForeColor="White" />
        <SideBarStyle BackColor="#1C5E55" Font-Size="0.9em" VerticalAlign="Top" />
        <StepStyle BorderWidth="2px" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" />
        <HeaderTemplate>
            <asp:DataList ID="dl_header" runat="server" RepeatDirection="Horizontal" CssClass="checkout_header">
                <ItemTemplate>
                    <%# DataBinder.Eval(Container.DataItem, "Title") + "  " %>
                </ItemTemplate>
            </asp:DataList>
        </HeaderTemplate>
        <WizardSteps>
            <asp:WizardStep runat="server" StepType="Start" Title="Address">
                <%--Address Book--%>
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
                                <tr id="Tr1" runat="server" visible='<%# !string.IsNullOrEmpty(TextHelper.ToString(Eval("AddressLine2"))) %>'>
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
                                        <asp:Button runat="server" ID="btn_ship" Text="Ship to this Address" CommandName="Ship"
                                            CommandArgument='<%# Eval("UserBillingAddressId") %>' OnClick="Button_Click"
                                            CausesValidation="False" OnClientClick="return confirm('Are you sure you want to bill to this address?');" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button runat="server" ID="btn_remove" Text="Remove" CommandName="Remove" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <hr class="line_long" />
                    </FooterTemplate>
                </asp:DataList>
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
                    <asp:Button runat="server" ID="btn_nextship" Text="Ship to this address" CommandName="NextShip"
                        OnClick="Button_Click" CausesValidation="True" ValidationGroup="billing" />
                </custom:ValidationGroupPanel>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Items">
                <h1>
                    Summary</h1>
                <asp:GridView runat="server" ID="gv_cart" AutoGenerateColumns="False" ShowFooter="True"
                    OnRowDataBound="GvCart_RowDataBound" CssClass="gridview_control">
                    <Columns>
                        <asp:TemplateField HeaderText="Items" ItemStyle-Width="10%" FooterStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <div>
                                    <img runat="server" id="img_item" src='<%#Eval("Image") %>' height="120" width="120"
                                        alt="" />
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                <div>
                                    <b>Sub Total: </b>
                                </div>
                                <div>
                                    <b>Tax: </b>
                                </div>
                                <div>
                                    <b>Total: </b>
                                </div>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <div>
                                    <b>
                                        <asp:Label runat="server" ID="lbl_title" Text='<%# Eval("Title") %>' />
                                        <asp:HiddenField runat="server" ID="hf_id" Value='<%# Bind("ProductId") %>' />
                                    </b>
                                </div>
                                <div>
                                    <%# Eval("Description") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <div>
                                    $<asp:Label runat="server" ID="lbl_price" Text='<%# Eval("Price") %>' />
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                $<asp:Label runat="server" ID="lbl_subtotal" /><br />
                                <asp:Label runat="server" ID="lbl_tax" /><br />
                                $<asp:Label runat="server" ID="lbl_total" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <div>
                                    <asp:Label runat="server" ID="lbl_quantity" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div>
                    <asp:Button runat="server" ID="txt_nextCheckOut" Text="Make Payment" CommandName="NextPayment"
                        OnClick="Button_Click" />
                </div>
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Finish" Title="Payment">
                <custom:ValidationGroupPanel runat="server" ValidationGroup="creditcard">
                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                Card Number:<br />
                                <custom:TextBox runat="server" ID="txt_cardNumber" Required="True" ValidType="Numbers" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Security Number:<br />
                                <custom:TextBox runat="server" ID="txt_securityNumber" Required="True" ValidType="Numbers" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Name on card:<br />
                                <custom:TextBox runat="server" ID="txt_nameOnCard" Required="True" ValidType="Name" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Expiration Number:<br />
                                <custom:DropDownList ID="ddl_month" runat="server" Required="True" />
                                &nbsp;
                                <custom:DropDownList ID="ddl_year" runat="server" Required="True" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </custom:ValidationGroupPanel>
                <asp:Button runat="server" ID="btn_payment" Text="Make Payment" OnClick="Button_Click"
                    CommandName="MakePayment" />
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Place Order" AllowReturn="False" StepType="Complete">
                Thank you for placing an order with us. Your order will be processed and delivered.
            </asp:WizardStep>
        </WizardSteps>
        <StartNavigationTemplate>
        </StartNavigationTemplate>
        <StepNavigationTemplate>
        </StepNavigationTemplate>
        <FinishNavigationTemplate>
        </FinishNavigationTemplate>
    </asp:Wizard>
</asp:Content>
