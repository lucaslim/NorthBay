<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Edit.aspx.cs" Inherits="NorthBay.Web.Admin.Gift.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <custom:ValidationGroupPanel ID="vgp_gift" runat="server" ValidationGroup="gift">
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    Title:<br />
                    <custom:TextBox runat="server" ID="txt_title" Required="True" Title="Title">
                    </custom:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    Description:<br />
                    <custom:TextBox runat="server" ID="txt_description" Required="True" TextMode="MultiLine"
                        Height="200px" Width="300px" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    Price:<br />
                    <custom:TextBox runat="server" ID="txt_price" Required="True"  ValidType="Decimals"></custom:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    Image:<br />
                    <asp:Image runat="server" ID="img_productImage" />
                    <div>
                        <asp:FileUpload runat="server" ID="fu_productImage" />
                    </div>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    Category
                    <br />
                    <asp:CheckBoxList runat="server" ID="cbl_category" RepeatDirection="Horizontal" RepeatColumns="3"
                        RepeatLayout="Table" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button runat="server" ID="btnUpdate" Text="Update" OnClick="ButtonClick" /></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </custom:ValidationGroupPanel>
</asp:Content>
