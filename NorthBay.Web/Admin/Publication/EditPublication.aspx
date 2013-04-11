<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="EditPublication.aspx.cs" Inherits="NorthBay.Web.Admin.Publication.EditPublication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Edit Publication</h2>
    <custom:ValidationGroupPanel ID="ValidationGroupPanel1" runat="server" ValidationGroup="AddPublication">
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>Title</asp:TableCell>
                <asp:TableCell>
                    <custom:TextBox runat="server" ID="txt_title" Required="True" Title="Title"></custom:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Author</asp:TableCell>
                <asp:TableCell>
                    <custom:TextBox runat="server" ID="txt_author" Required="True" Title="Author"></custom:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>Category</asp:TableCell>
                <asp:TableCell>
                    <custom:DropDownList runat="server" ID="ddl_category" Required="True" Title="Category"></custom:DropDownList>
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Description</asp:TableCell>
                 <asp:TableCell>
                    <custom:TextBox runat="server" ID="txt_description" Required="True" TextMode="MultiLine" Height="100px" Width="100px" />
                </asp:TableCell>
            </asp:TableRow>
           
           <asp:TableRow>
            <asp:TableCell>Publication Date</asp:TableCell>
            <asp:TableCell>
                <custom:DateBox runat="server" ID="txt_pubdate" Required="True" />
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
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="ButtonClick" />
            </asp:TableCell>
           </asp:TableRow>
        </asp:Table>
    </custom:ValidationGroupPanel>

</asp:Content>
