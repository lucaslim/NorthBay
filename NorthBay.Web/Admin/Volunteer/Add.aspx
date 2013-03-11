<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="NorthBay.Web.Admin.Volunteer.Add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <%--ToolkitScriptManager Required for everypage. Place it in master page--%>
    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div>
        <custom:ValidationGroupPanel runat="server" ValidationGroup="AddVolunteer">
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>Title</asp:TableCell>
                    <asp:TableCell>
                        <custom:TextBox runat="server" ID="txt_title" Required="True" Title="Title">
                        </custom:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Category</asp:TableCell>
                    <asp:TableCell>
                        <%--<custom:TextBox runat="server" ID="txt_category" Required="True"></custom:TextBox>--%>
                        <custom:DropDownList runat="server" ID="ddl_category" Required="True" Title="Category">
                        </custom:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Description</asp:TableCell>
                    <asp:TableCell>
                        <custom:TextBox runat="server" ID="txt_description" Required="True" TextMode="MultiLine"
                            Height="100px" Width="100px" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Post Date</asp:TableCell>
                    <asp:TableCell>
                        <custom:DateBox runat="server" ID="txt_postdate" Required="True" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>End Date</asp:TableCell>
                    <asp:TableCell>
                        <custom:DateBox runat="server" ID="txt_enddate" Required="True" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>Active</asp:TableCell>
                    <asp:TableCell>
                        <custom:DropDownList runat="server" ID="ddl_active" Required="True">
                            <items>
                                <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                <asp:ListItem Text="No" Value="False"></asp:ListItem>
                            </items>
                        </custom:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell>
                        <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="ButtonClick" /></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </custom:ValidationGroupPanel>
    </div>
    </form>
</body>
</html>
