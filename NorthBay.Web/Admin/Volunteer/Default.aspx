<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Admin.Volunteer.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView runat="server" ID="gridView" OnRowCreated="GridView_RowDataBound" OnRowDeleting="GridView_RowDeleting"
        OnRowUpdating="GridView_RowUpdating" OnRowEditing="GridView_RowEditing" OnRowCancelingEdit="GridView_RowCancelingEdit"
        OnSorting="GridView_Sorting" OnPageIndexChanging="GridView_PageIndexChanging"
        AllowSorting="True" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="No.">
                <ItemTemplate>
                    <%#                                        Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <ItemTemplate>
                    <%#Eval("Title") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category" SortExpression="VolunteerCategoryName">
                <ItemTemplate>
                    <%#Eval("VolunteerCategoryName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <ItemTemplate>
                    <%#Eval("Description")%>
                </ItemTemplate>
                <EditItemTemplate>
                    <custom:TextBox runat="server" ID="txt_description" TextMode="MultiLine" Height="100px"
                        Width="100px" Text='<%#Bind("Description") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Post Date" SortExpression="PostDate">
                <ItemTemplate>
                    <%#                FormatDate(Eval("PostDate")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date" SortExpression="EndDate">
                <ItemTemplate>
                    <%#                FormatDate(Eval("EndDate")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" ID="btn_edit" Text="Edit" CommandName="Edit" />
                    &nbsp;
                    <asp:Button runat="server" ID="btn_delete" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to remove this entry?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
