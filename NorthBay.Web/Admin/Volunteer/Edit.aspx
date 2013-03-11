<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="NorthBay.Web.Admin.Volunteer.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <custom:ValidationGroupPanel ID="ValidationGroupPanel1" runat="server" ValidationGroup="AddVolunteer">
        <asp:Table ID="Table1" runat="server">
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
                        <Items>
                            <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                            <asp:ListItem Text="No" Value="False"></asp:ListItem>
                        </Items>
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
</asp:Content>
