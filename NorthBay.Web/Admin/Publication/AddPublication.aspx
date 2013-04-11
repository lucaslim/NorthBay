<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPublication.aspx.cs" Inherits="NorthBay.Web.Admin.Publication.Add" MasterPageFile="~/Masterpage/Main.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Add New Publication</h2>
    <%-- collect input to add publication --%>
            <div>
                <custom:ValidationGroupPanel ID="ValidationGroupPanel1" runat="server" ValidationGroup="AddPublication">
                    <asp:Table ID="Table1" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>Title</asp:TableCell>
                            <asp:TableCell>
                                <custom:TextBox runat="server" ID="txt_title" Required="True" Title="Title">
                                </custom:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Author</asp:TableCell>
                            <asp:TableCell>
                                <custom:TextBox runat="server" ID="txt_author" Required="True" Title="Author">
                                </custom:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Category</asp:TableCell>
                            <asp:TableCell>
                                <custom:DropDownList runat="server" ID="ddl_category" Required="True" Title="Category"> 
                                </custom:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Description</asp:TableCell>
                            <asp:TableCell>
                                <custom:TextBox runat="server" ID="txt_description" Required="False" TextMode="MultiLine" Height="100px" Width="100px" />
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
                                <asp:Button runat="server" ID="btn_add" Text="Add" OnClick="ButtonClick" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </custom:ValidationGroupPanel>
            </div>
 </asp:Content>
