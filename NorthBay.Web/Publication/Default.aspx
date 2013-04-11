<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Publication.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:GridView ID="gridView" runat="server" AutoGenerateSelectButton="true" 
        SelectedRowStyle-BackColor="Black" SelectedRowStyle-ForeColor="Blue"  AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PublicationId"> --%>
       
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
    <asp:Label ID="lblPublicationDescription" runat="server" />
 
</asp:Content>
