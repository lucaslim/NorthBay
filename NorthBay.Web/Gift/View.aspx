<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="View.aspx.cs" Inherits="NorthBay.Web.Gift.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Shopping Cart
        </div>
        <div id="main_body">
        </div>
    </div>
    <asp:GridView runat="server" ID="gv_cart" AutoGenerateColumns="False" ShowFooter="True"
        OnRowDataBound="GvCart_RowDataBound" OnRowUpdating="GvCart_RowUpdating" CssClass="gridview_control">
        <Columns>
            <asp:TemplateField HeaderText="Items" ItemStyle-Width="10%" FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <div>
                        <asp:Image runat="server" ID="img_product" ImageUrl='<%#Eval("Image") %>' />
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <div class="bold">
                        <b>Sub Total: </b>
                    </div>
                    <div class="bold">
                        <b>Tax: </b>
                    </div>
                    <div class="bold">
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
            <asp:TemplateField HeaderText="Price" ItemStyle-VerticalAlign="Top">
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
                        <asp:TextBox runat="server" ID="txt_quantity" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                    </div>
                    <div>
                        <asp:Button runat="server" ID="btn_update" Text="Update" CommandName="update" CommandArgument='<%# Eval("ProductId") %>' />
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            There are no items in the shopping cart
        </EmptyDataTemplate>
    </asp:GridView>
    <br />
    <div>
        <asp:Button runat="server" Text="Check Out" PostBackUrl="CheckOut.aspx" />
        <asp:Button runat="server" Text="Continue Shopping" PostBackUrl="Default.aspx"/>
    </div>
</asp:Content>
