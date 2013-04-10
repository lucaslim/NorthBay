<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="bd_don.aspx.cs" Inherits="NorthBay.Web.Blood_donation.bd_don" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td><asp:Label ID="lbl_name" runat="server" Text="Name :" /></td>
            <td><asp:TextBox ID="txt_name" runat="server" Height="20"/></td>
            <td><asp:RequiredFieldValidator ID="rfv_name" runat="server" Text="* Required" ControlToValidate="txt_name" ValidationGroup="insert" /></td>
            <td><asp:RegularExpressionValidator ID="rev_name" runat="server" ValidationGroup="insert" ValidationExpression="[a-zA-Z ]*[^!@%~?.:#$%^&*()'0123456789]*" ErrorMessage="Not a valid name" ControlToValidate="txt_name" /></td>
        </tr>

        <tr>
            <td><asp:Label ID="lbl_phone" runat="server" Text="Phone #" /><p style="color:Gray; font-size:small;">Format 123-456-7890</p></td>
            <td><asp:TextBox ID="txt_phone" runat="server"  Height="20"/></td>
            <td><asp:RegularExpressionValidator ID="rev_contact" runat="server" ValidationGroup="insert" ValidationExpression="^[0-9]{3}-[0-9]{3}-[0-9]{4}" ErrorMessage="Not a valid Phone #" ControlToValidate="txt_phone" /></td>
            <td></td>
        </tr>

        <tr>
            <td><asp:Label ID="lbl_email" runat="server" Text="Email :" /></td>
            <td><asp:TextBox ID="txt_email" runat="server" Height="20"/></td>
            <td><asp:RegularExpressionValidator ID="rev_email" runat="server" ValidationGroup="insert" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ErrorMessage="Not a valid email" ControlToValidate="txt_email" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_blood" runat="server" Text="Blood Group :" /></td>
            <td><asp:DropDownList ID="ddl_blood" runat="server" Width="120" Height="20">
                <asp:ListItem>A+</asp:ListItem>
                <asp:ListItem>A-</asp:ListItem>
                <asp:ListItem>B+</asp:ListItem>
                <asp:ListItem>B-</asp:ListItem>
                <asp:ListItem>O+</asp:ListItem>
                <asp:ListItem>O-</asp:ListItem>
                <asp:ListItem>AB+</asp:ListItem>
                <asp:ListItem>AB-</asp:ListItem>

                </asp:DropDownList></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_message" runat="server" Text="Message :" /></td>
            <td><asp:TextBox ID="txt_message" runat="server" TextMode="MultiLine" /></td>
            <td><asp:RequiredFieldValidator ID="rfv_message" runat="server" ControlToValidate="txt_message" Text="* Required" ValidationGroup="insert"/></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btn_submit" runat="server" ValidationGroup="insert" Text="Submit" OnClick="insertdonor" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_clear" runat="server" Text="clear" /></td>
        </tr>
    </table>
    <asp:Label ID="lbloutput" runat="server" Text="" /><br /><br />
    
    <asp:Label ID="lbl_unsubscribe" runat="server" Text="Already donated for the good cause! Unsubscribe :" />
        <asp:TextBox ID="txt_unsubscribe" runat="server" Height="20"/><br />
        <asp:Button ID="btn_unsubscribe" runat="server" Text="Unsubscribe" />
    
    
    <h1>Find Donor :</h1>
    <h4 style="color:Gray;">(Select Blood Group)</h4><br />
    <asp:LinkButton ID="lnkAp" runat="server" Text="A" OnClick="getbyAp"/>+ |
    <asp:LinkButton ID="lnkAn" runat="server" Text="A" OnClick="getbyAn"/>- |
    <asp:LinkButton ID="lnkBp" runat="server" Text="B" OnClick="getbyBp"/>+ |
    <asp:LinkButton ID="lnkBn" runat="server" Text="B" OnClick="getbyBn"/>- |
    <asp:LinkButton ID="lnkOp" runat="server" Text="O" OnClick="getbyOp"/>+ |
    <asp:LinkButton ID="lnkOn" runat="server" Text="O" OnClick="getbyOn"/>- |
    <asp:LinkButton ID="lnkABp" runat="server" Text="AB" OnClick="getbyABp"/>+ |
    <asp:LinkButton ID="lnkABn" runat="server" Text="AB" OnClick="getbyABn"/>- |
    <asp:Panel ID="pnl_all" runat="server" GroupingText="All Donors">
        <asp:Button ID="email_btn" runat="server" Text="E-Mail" OnClick="send_email"/>
        <table border="0" width="100%" style="text-align:center">
        <thead style="background-color:Gray">
        <tr>
            <th></th>
            <th>Blood Group</th>
            <th>Name</th>
            <th>Phone</th>
            <th>E-mail</th>
            <th>Message</th>
            <%--<th>E-Mail </th>--%>
        </tr>
        </thead>
            <asp:Repeater ID="rpt_all" runat="server" OnItemDataBound="idb_email">
                <ItemTemplate>
                    <tr>
                        <td><asp:CheckBox ID="cb" runat="server" Visible="true"/></td>
                        <td><%#Eval ("blood_donor_blood_group") %></td>
                        <td><%#Eval ("blood_donor_name") %></td>
                        <td><%#Eval ("blood_donor_phone") %></td>
                        <td><asp:TextBox ID="txt_to_email" runat="server" Text='<%#Eval("blood_donor_email")%>' Visible="false"/>
                            <asp:Label ID="email_to" runat="server" Text='<%#Eval ("blood_donor_email")%>'/></td>

                        <td><%#Eval ("blood_donor_message") %></td>
                        <%--<td><asp:Button ID="email_btn" runat="server" CommandName="email" CommandArgument='<%#Eval ("blood_donor_email")%>' Visible="true" Text="Email"/></td>--%>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    
    </asp:Panel>
        
</asp:Content>