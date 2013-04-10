<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.master" AutoEventWireup="true" Inherits="Admin_Location_Default2" Codebehind="Default2.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" CellPadding="4" 
        DataKeyNames="LocationId" DataSourceID="SqlDataSource1" ForeColor="#333333">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
        <table>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </table>
            UnitNo:
            <asp:TextBox ID="UnitNoTextBox" runat="server" Text='<%# Bind("UnitNo") %>' />
            <br />
            StreetNo:
            <asp:TextBox ID="StreetNoTextBox" runat="server" 
                Text='<%# Bind("StreetNo") %>' />
            <br />
            StreetName:
            <asp:TextBox ID="StreetNameTextBox" runat="server" 
                Text='<%# Bind("StreetName") %>' />
            <br />
            City:
            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
            <br />
            Province:
            <asp:TextBox ID="ProvinceTextBox" runat="server" 
                Text='<%# Bind("Province") %>' />
            <br />
            Pcode:
            <asp:TextBox ID="PcodeTextBox" runat="server" Text='<%# Bind("Pcode") %>' />
            <br />
            Tnumber:
            <asp:TextBox ID="TnumberTextBox" runat="server" Text='<%# Bind("Tnumber") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Latitude:
            <asp:TextBox ID="LatitudeTextBox" runat="server" 
                Text='<%# Bind("Latitude") %>' />
            <br />
            Longitude:
            <asp:TextBox ID="LongitudeTextBox" runat="server" 
                Text='<%# Bind("Longitude") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
             <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:northbayConnectionString %>" 
        SelectCommand="SELECT [LocationId], [UnitNo], [StreetNo], [StreetName], [City], [Province], [Pcode], [Tnumber], [Email], [Latitude], [Longitude] FROM [Location]"></asp:SqlDataSource>
</asp:Content>

