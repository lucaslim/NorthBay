<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Admin.Volunteer.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Volunteering
        </div>
        <div id="main_body">
            <asp:GridView runat="server" ID="gridView" AllowPaging="True" OnSorting="GridView_Sorting"
                OnPageIndexChanging="GridView_PageIndexChanging" AllowSorting="True" AutoGenerateColumns="False"
                CssClass="gridview_control">
                <Columns>
                    <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate>
                            <input type="checkbox" id="cb_selectall" name="cb_selectall" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox runat="server" ID="cb_select" /><asp:HiddenField runat="server" ID="hf_id"
                                Value='<%# Eval("VolunteerId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Title" SortExpression="Title" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <a href="Edit.aspx?id=<%# Eval("VolunteerId") %>">
                                <%#Eval("Title") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category" SortExpression="VolunteerCategoryName" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%#Eval("VolunteerCategoryName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Post Date" SortExpression="PostDate" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%#                FormatDate(Eval("PostDate")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Date" SortExpression="EndDate" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <%#                FormatDate(Eval("EndDate")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button runat="server" ID="btn_delete" Text="Delete" OnClick="Button_Click" OnClientClick="return confirm('Are you sure you want to delete?');" />
            &nbsp;
            <asp:Button runat="server" ID="btn_add" Text="Add" PostBackUrl="Add.aspx" />
        </div>
    </div>
</asp:Content>
