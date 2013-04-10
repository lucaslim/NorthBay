<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Gift.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Gift Shop
        </div>
        <div id="main_body">
            <table>
                <tr>
                    <td style="width: 70%">
                        <asp:GridView runat="server" ID="gridView" AutoGenerateColumns="False" Width="100%"
                            PageSize="5" AllowPaging="True" OnRowCommand="GridView_RowCommand" OnPageIndexChanging="GridView_PageIndexChanging"
                            OnRowDataBound="GridView_RowDataBound" CssClass="gridview_control" GridLines="None"
                            ShowHeader="False">
                            <Columns>
                                <asp:TemplateField ItemStyle-VerticalAlign="Top">
                                    <ItemTemplate>
                                        <div class="input_control">
                                            <asp:Image runat="server" ID="img_product" ImageUrl='<%#Eval("Image") %>' />
                                        </div>
                                        <div class="input_label bold">
                                            <asp:Label runat="server" ID="lbl_title" Text='<%# Eval("Title") %>' />
                                            <asp:HiddenField runat="server" ID="hf_id" Value='<%# Eval("ProductId") %>' />
                                        </div>
                                        <div class="input_label bold">
                                            Price:
                                        </div>
                                        <div class="input_control">
                                            $<asp:Label runat="server" ID="lbl_price" Text='<%# Eval("Price") %>' />
                                        </div>
                                        <div class="input_label bold">
                                            Description:
                                        </div>
                                        <div class="input_control">
                                            <%# Eval("Description") %>
                                        </div>
                                        <asp:Button runat="server" ID="btnAdd" Text="Add to cart" CommandName="add" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td style="width: 70%; padding-left: 20px; vertical-align: top">
                        <div id="shopping_cart">
                            <div id="shopping_cart_header">
                                Shopping Cart
                            </div>
                            <div>
                                <asp:Literal runat="server" ID="lit_output"></asp:Literal>
                            </div>
                            <div runat="server" id="div_subtotal" class="input_control">
                                <span class="bold">Sub-Total:</span>
                                <asp:Literal runat="server" ID="lit_subtotal"></asp:Literal>
                            </div>
                            <div runat="server" id="div_tax" class="input_control">
                                <span class="bold">Tax:</span>
                                <asp:Literal runat="server" ID="lit_tax"></asp:Literal>
                            </div>
                            <div runat="server" id="div_total" class="input_control">
                                <span class="bold">Total:</span>
                                <asp:Literal runat="server" ID="lit_total"></asp:Literal>
                            </div>
                            <div>
                                <asp:Button runat="server" ID="btn_view" Text="View Cart" PostBackUrl="View.aspx" />
                                &nbsp;
                                <asp:Button runat="server" ID="btn_clear" Text="Clear Cart" OnClick="Button_Click" />
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
