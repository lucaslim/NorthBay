<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="View.aspx.cs" Inherits="NorthBay.Web.Gift.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        Shopping Cart</h1>
    <asp:GridView runat="server" ID="gv_cart" AutoGenerateColumns="False" ShowFooter="True" OnRowDataBound="GvCart_RowDataBound" OnRowUpdating="GvCart_RowUpdating">
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
                        <asp:TextBox runat="server" ID="txt_quantity" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                    </div>
                    <div>
                        <asp:Button runat="server" ID="btn_update" Text="Update" CommandName="update" CommandArgument='<%# Eval("ProductId") %>'/>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <div>
        <asp:Button runat="server" Text="Check Out" PostBackUrl="CheckOut.aspx"/>
    </div>
    
</asp:Content>
