<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="NorthBay.Web.Admin.Volunteer.View" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <ajax:ToolkitScriptManager runat="server" />
    <div>
        <asp:GridView runat="server" ID="gridView" OnRowDeleting="GridView_RowDeleting" OnRowUpdating="GridView_RowUpdating"
            OnRowEditing="GridView_RowEditing" OnRowCancelingEdit="GridView_RowCancelingEdit"
            OnSorting="GridView_Sorting" OnPageIndexChanging="GridView_PageIndexChanging"
            AllowSorting="True" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="No.">
                    <ItemTemplate>
                        <%#                                        Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <%#                Container.DataItemIndex + 1 %>
                        <asp:HiddenField runat="server" ID="hf_id" Value='<%#Bind("VolunteeringId") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                    <ItemTemplate>
                        <%#Eval("Title") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <custom:TextBox runat="server" ID="txt_title" Text='<%#Bind("Title") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" SortExpression="Category">
                    <ItemTemplate>
                        <%#Eval("Category") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <custom:TextBox runat="server" ID="txt_category" Text='<%#Bind("Category") %>' />
                    </EditItemTemplate>
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
                    <EditItemTemplate>
                        <custom:DateBox runat="server" ID="txt_postdate" Text='<%#Bind("PostDate") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="End Date" SortExpression="EndDate">
                    <ItemTemplate>
                        <%#                FormatDate(Eval("EndDate")) %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <custom:DateBox runat="server" ID="txt_enddate" Text='<%#Bind("EndDate") %>' />
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
