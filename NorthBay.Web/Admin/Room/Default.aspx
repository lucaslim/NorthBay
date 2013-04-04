<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Admin.Room.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView runat="server" ID="gridView" AllowPaging="True" OnSorting="GridView_Sorting"
        OnPageIndexChanging="GridView_PageIndexChanging" OnRowDataBound="GridView_RowCreated" AllowSorting="True" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <input type="checkbox" id="cb_selectall" name="cb_selectall" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="cb_select" /><asp:HiddenField runat="server" ID="hf_id"
                        Value='<%# Eval("RoomId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Building" SortExpression="Building">
                <ItemTemplate>
                    <%#Eval("Building") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Level" SortExpression="Level">
                <ItemTemplate>
                    <%#Eval("Level")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Room Status" SortExpression="RoomStatusId">
                <ItemTemplate>
                    <asp:Literal runat="server" ID="lit_status"></asp:Literal>
                    <%--<%#Eval("RoomStatus.Description")%>--%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" Text="Edit" CommandName="assign" OnClick="Button_Click" CommandArgument='<%# Eval("RoomId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button runat="server" ID="btn_delete" Text="Delete" OnClick="Button_Click" OnClientClick="return confirm('Are you sure you want to delete?');" />
</asp:Content>
