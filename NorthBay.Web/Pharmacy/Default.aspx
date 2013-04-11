<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NorthBay.Web.Pharmacy.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="dtlView" runat="server" AllowPaging="true" AutoGenerateRows="false" AlternatingRowStyle-BackColor="LightBlue" >
            <Fields>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%#Eval("Name") %>
                    </ItemTemplate>    
                
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <%#Eval("Price") %>
                    </ItemTemplate>
                
                </asp:TemplateField>
            </Fields>
            
        </asp:DetailsView>
</asp:Content>
