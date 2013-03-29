<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Gift.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td style="width: 70%">
                <asp:GridView runat="server" ID="gridView" AutoGenerateColumns="False" Width="100%"
                    OnRowCommand="GridView_RowCommand" ShowHeader="False">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="10%">
                            <ItemTemplate>
                                <div>
                                    <img runat="server" id="img_item" src='<%#Eval("Image") %>' height="120" width="120"
                                        alt="" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <div>
                                    <b>
                                        <asp:Label runat="server" ID="lbl_title" Text='<%# Eval("Title") %>' />
                                        <asp:HiddenField runat="server" ID="hf_id" Value='<%# Eval("ProductId") %>' />
                                    </b>
                                </div>
                                <div>
                                    Price: $<asp:Label runat="server" ID="lbl_price" Text='<%# Eval("Price") %>' />
                                </div>
                                <div>
                                    <%# Eval("Description") %>
                                </div>
                                <div>
                                    <asp:Button runat="server" ID="btnAdd" Text="Add to cart" CommandName="add" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
            <td style="width: 70%; vertical-align: top">
                <h1>Shopping Cart</h1>
                <div>
                    <asp:Literal runat="server" ID="lit_output"></asp:Literal>
                </div>
                <div>
                    <asp:Button runat="server" ID="btn_view" Text="View Cart" PostBackUrl="View.aspx"/>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
