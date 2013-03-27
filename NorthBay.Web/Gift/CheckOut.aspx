<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="CheckOut.aspx.cs" Inherits="NorthBay.Web.Gift.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Wizard runat="server" ID="wiz_cart" BackColor="#E6E2D8" BorderColor="#999999"
        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
        DisplaySideBar="False" ActiveStepIndex="0" OnFinishButtonClick="WizCart_FinishButtonClick"
        OnActiveStepChanged="WizCart_ActiveStepChanged" OnNextButtonClick="WizCart_NextButtonClick">
        <HeaderStyle BackColor="#666666" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em"
            ForeColor="White" HorizontalAlign="Center" BorderColor="#E6E2D8" BorderWidth="2px" />
        <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
        <SideBarButtonStyle ForeColor="White" />
        <SideBarStyle BackColor="#1C5E55" Font-Size="0.9em" VerticalAlign="Top" />
        <StepStyle BorderWidth="2px" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" />
        <HeaderTemplate>
            <asp:DataList ID="dl_header" runat="server" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <%# DataBinder.Eval(Container.DataItem, "Title") + "  " %>
                </ItemTemplate>
            </asp:DataList>
        </HeaderTemplate>
        <WizardSteps>
            <asp:WizardStep runat="server" StepType="Start" Title="Address">
                <%--Address Book--%>
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
                                    <asp:Button runat="server" ID="btn_ship" Text="Ship to this Address" CommandName="Ship"
                                        CommandArgument='<%# Eval("UserBillingAddressId") %>' OnClick="BtnShip_Click"
                                        CausesValidation="False" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button runat="server" ID="btn_remove" Text="Remove" CommandName="Remove" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <FooterTemplate>
                        <hr />
                    </FooterTemplate>
                </asp:DataList>
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
                                <custom:TextBox runat="server" ID="txt_postalcode" Required="True" ValidType="PostalCode"></custom:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Phone Number:<br />
                                <custom:TextBox runat="server" ID="txt_phone" Required="True"></custom:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </custom:ValidationGroupPanel>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Items">
                <asp:GridView runat="server" ID="gv_cart" AutoGenerateColumns="False" ShowFooter="True"
                    OnRowDataBound="GvCart_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="Items" ItemStyle-Width="10%" FooterStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <div>
                                    <img runat="server" id="img_item" src='<%#Eval("Image") %>' height="120" width="120"
                                        alt="" />
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                <b>Sub Total: </b>
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
                                $<asp:Label runat="server" ID="lbl_subtotal" Text='<%# Eval("Price") %>' />
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
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Finish" Title="Payment">
                <custom:ValidationGroupPanel runat="server" ValidationGroup="creditcard">
                    <asp:Table runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                Card Number:<br />
                                <custom:TextBox runat="server" ID="txt_cardNumber" Required="True" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Security Number:<br />
                                <custom:TextBox runat="server" ID="txt_securityNumber" Required="True" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Name on card:<br />
                                <custom:TextBox runat="server" ID="txt_nameOnCard" Required="True" />
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>
                                Expiration Number:<br />
                                <custom:DropDownList ID="ddl_month" runat="server" Required="True"/>
                                &nbsp;
                                <custom:DropDownList ID="ddl_year" runat="server" Required="True"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </custom:ValidationGroupPanel>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Place Order" AllowReturn="False" StepType="Complete">
                Thank you for placing an order with us. Your order will be processed and delivered.
            </asp:WizardStep>
        </WizardSteps>
        <StartNavigationTemplate>
            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Text="Ship to this address"
                CausesValidation="True" ValidationGroup="billing"></asp:Button>
        </StartNavigationTemplate>
        <StepNavigationTemplate>
            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Next">
            </asp:Button>
            <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
                Text="Previous"></asp:Button>
        </StepNavigationTemplate>
    </asp:Wizard>
</asp:Content>
