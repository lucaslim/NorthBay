<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Gift.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .productItem
        {
            width: 140px;
            float: left;
            padding: 5px;
            margin: 5px;
            text-align: center;
        }
        .groupSeparator
        {
            border-top: 1px dotted Gray;
            height: 1px;
            clear: both;
        }
        .itemSeparator
        {
            height: 180px;
            width: 1px;
            border-left: 1px dotted Gray;
            margin-top: 5px;
            margin-bottom: 5px;
            float: left;
        }
    </style>
    <asp:GridView runat="server" ID="gridView" AutoGenerateColumns="False" Width="100%" OnRowCommand="GridView_RowCommand"
        ShowHeader="False">
        <Columns>
            <asp:TemplateField ItemStyle-Width="10%">
                <ItemTemplate>
                    <div>
                        <img runat="server" id="img_item" src='<%#Eval("Image") %>' height="120" width="120" alt=""/>
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
    <div>
        <asp:Literal runat="server" ID="lit_output"></asp:Literal>
    </div>
</asp:Content>
