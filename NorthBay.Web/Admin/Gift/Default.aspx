<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Admin.Gift.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Gift Shop
        </div>
        <div id="main_body">
            <div style="clear: both">
            </div>
            <asp:GridView runat="server" ID="gridView" AllowPaging="True" OnSorting="GridView_Sorting"
                PageSize="5" OnPageIndexChanging="GridView_PageIndexChanging" OnRowDataBound="GridView_RowDataBound"
                AllowSorting="True" CssClass="gridview_control" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="1%">
                        <HeaderTemplate>
                            <input type="checkbox" id="cb_selectall" name="cb_selectall" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="cb_select" /><asp:HiddenField runat="server" ID="hf_id"
                                Value='<%# Eval("ProductId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title" SortExpression="Title" HeaderStyle-HorizontalAlign="Left"
                        ItemStyle-Width="30%" ItemStyle-VerticalAlign="top">
                        <ItemTemplate>
                            <div class="input_control">
                                <asp:Image runat="server" ID="img_product" ImageUrl='<%# Eval("Image") %>' />
                            </div>
                            <a href="Edit.aspx?id=<%# Eval("ProductId") %>">
                                <%#Eval("Title") %>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description" SortExpression="Description" HeaderStyle-HorizontalAlign="Left"
                        ItemStyle-Width="50%" ItemStyle-VerticalAlign="top">
                        <ItemTemplate>
                            <%#                Eval("Description")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price ($)" SortExpression="Price" HeaderStyle-HorizontalAlign="Left"
                        ItemStyle-VerticalAlign="top">
                        <ItemTemplate>
                            <%#                Eval("Price")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button runat="server" ID="btn_delete" Text="Delete" OnClick="Button_Click" OnClientClick="return confirm('Are you sure you want to delete?');" />
            &nbsp;
            <asp:Button runat="server" ID="btn_add" Text="Add" PostBackUrl="Add.aspx"/>
        </div>
    </div>
</asp:Content>
