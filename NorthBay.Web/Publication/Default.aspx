<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Publication.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>Publication and Mail Page</h2>       
        <asp:GridView ID="gridView" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PublicationId">
        <Columns>
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <ItemTemplate>
                    <asp:LinkButton ID="linkButtonPub" runat="server" onclick="linkButtonPub_Click" CommandArgument='<%#Eval("PublicationId")%>' > <%#Eval("Title") %></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <asp:Label ID="lblPublicationDetail" runat="server" Text="Details" Font-Bold="true" />
    <br />
    <asp:Label ID="lblPublicationTitle" runat="server" text='<%#Eval("PublicationTitle")%>'/>
    <br />
    <br />
    <asp:Label ID="lblPublicationDescription" runat="server" />
    <br />
    <asp:Label ID="lblMailFriend" runat="server" Text="Mail to a friend" />
    <br />
    <asp:TextBox ID="txtMailTo" runat="server" />
    <asp:RegularExpressionValidator ID="revMail" runat="server" Text="Invalid email" ControlToValidate="txtMailTo" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address"/>
    <br />
    <asp:Label ID="lblMsg" runat="server" Text="Recommend Publications to a friend" />
    <br />
    <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" Rows="5" Columns="15" />
    <br />
   
    <asp:Button ID="Button1" runat="server" Text="Send Email" OnClick="Button1_Click" />
 
</asp:Content>
