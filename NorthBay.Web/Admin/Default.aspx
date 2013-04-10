<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main_content">
        <div id="main_header">
            Administrative Control Panel
        </div>
        <div id="main_body">
            <asp:Menu runat="server" DynamicHorizontalOffset="2" Font-Bold="True" 
                Font-Names="Verdana" Font-Size="12px" ForeColor="#000333" 
                StaticSubMenuIndent="10px">
                <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="8px" />
                <DynamicSelectedStyle BackColor="#1C5E55" />
                <Items>
                    <asp:MenuItem Text="Career" NavigateUrl="Career/Default.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Event" NavigateUrl="Event/Default.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Gift Shop" NavigateUrl="Gift/Default.aspx">
                        <asp:MenuItem Text="New Gift Item" NavigateUrl="Gift/Add.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Location" NavigateUrl="Location/Default.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Room Availability" NavigateUrl="Room/Default.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Volunteer" NavigateUrl="Volunteer/Default.aspx">
                        <asp:MenuItem Text="New Opportunities" NavigateUrl="Volunteer/Add.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="8px" />
            </asp:Menu>
        </div>
    </div>
    <asp:Button runat="server" ID="btn_logout" Text="Log Out" OnClick="ButtonClick" />
</asp:Content>
