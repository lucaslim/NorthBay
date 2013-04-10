<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Admin.Room.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Room Availability
        </div>
        <div id="main_body">
            <asp:GridView runat="server" ID="gridView" AllowPaging="True" OnSorting="GridView_Sorting"
                OnPageIndexChanging="GridView_PageIndexChanging" OnRowDataBound="GridView_RowCreated"
                AllowSorting="True" AutoGenerateColumns="False" CssClass="gridview_control">
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Width="1%">
                        <HeaderTemplate>
                            <input type="checkbox" id="cb_selectall" name="cb_selectall" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="cb_select" /><asp:HiddenField runat="server" ID="hf_id"
                                Value='<%# Eval("RoomId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Building" SortExpression="Building" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%#Eval("Building") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Number" SortExpression="Number" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%#Eval("Number") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Level" SortExpression="Level" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%#Eval("Level")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price ($)" SortExpression="Price" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%#Eval("Price") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Room Status" SortExpression="RoomStatusId" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Literal runat="server" ID="lit_status"></asp:Literal>
                            <%--<%#Eval("RoomStatus.Description")%>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action(s)" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="1%"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" Text="Edit" CommandName="assign" OnClick="Button_Click"
                                CommandArgument='<%# Eval("RoomId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button runat="server" ID="btn_delete" Text="Delete" OnClick="Button_Click" OnClientClick="return confirm('Are you sure you want to delete?');" />
        </div>
    </div>
</asp:Content>
