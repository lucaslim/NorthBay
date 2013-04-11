<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Admin.Publication.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Delete Publication</h2>
    <asp:GridView runat="server" ID="gridView" AllowPaging="true" OnSorting="GridView_Sorting" OnPageIndexChanging="GridView_PageIndexChanging" AllowSorting="true" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <input type="checkbox" id="cb_selectall" name="cb_selectall" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="cb_select" />
                    <asp:HiddenField runat="server" ID="hf_id" Value='<%#Eval("PublicationId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <ItemTemplate>
                    <a href="EditPublication.aspx?id=<%#Eval("PublicationId") %>"><%#Eval("Title") %></a>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Category" SortExpression="CategoryName">
                <ItemTemplate>
                    <%#Eval("CategoryName") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText = "Publication Date" SortExpression="PublicationDate">
                <ItemTemplate><%#FormatDate(Eval("PublicationDate")) %></ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:Button ID="btn_delete" runat="server" Text="Delete" OnClick="Button_Click" OnClientClick="return confirm('Are you sure you want to delete?');" />
</asp:Content>
