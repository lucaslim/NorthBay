<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Assign.aspx.cs" Inherits="NorthBay.Web.Admin.Room.Assign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>
                Room:
                <asp:Label runat="server" ID="lbl_room"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Building:
                <asp:Label runat="server" ID="lbl_building"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Level:
                <asp:Label runat="server" ID="lbl_level"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <h3>
                    Additional Equipments:</h3>
                <br />
                <asp:Repeater runat="server" ID="rpt_equipments">
                    <HeaderTemplate>
                        <table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# Eval("Description") %><asp:HiddenField runat="server" ID="hf_id" Value='<%# Eval("EquipmentId") %>' />
                            </td>
                            <td>
                                <custom:TextBox runat="server" ID="txt_quantity"></custom:TextBox>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Assign to:
                <custom:DropDownList runat="server" ID="ddl_patients" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button runat="server" ID="btn_update" Text="Update" CommandName="update" OnClick="Button_Click" />
                &nbsp;
                <asp:Button runat="server" ID="btn_checkout" Text="Check-Out" CommandName="checkout" OnClick="Button_Click" Visible="False" OnClientClick="return confirm('Are you sure you want to check-out this patient?'" />
                &nbsp;
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
