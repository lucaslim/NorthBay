<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/Main.Master" AutoEventWireup="true" CodeBehind="ImageGalleryAdmin.aspx.cs" Inherits="NorthBay.Web.Admin.ImageGalleryAdmin.ImageGalleryAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="grid_img" runat="server" AutoGenerateColumns="false"
        HeaderStyle-BackColor="lightblue" ShowFooter="true" OnRowEditing="EditImage" OnRowUpdating="UpdateImage"
        OnRowCancelingEdit="CancelEdit" PageSize="10">
        <Columns>
            <asp:TemplateField ItemStyle-Width="30px" HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="lblImageID" runat="server" Text='<%# Eval("Id")%>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:HiddenField ID="hdfID" Value='<%#Eval("Id") %>' runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
           
            <asp:TemplateField ItemStyle-Width="150px" HeaderText="File Name">
                <ItemTemplate>
                    <asp:Label ID="lblFileName" runat="server" Text='<%# Eval("FileName")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtFileName" runat="server" Text='<%# Eval("FileName")%>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="lnkDelete" runat="server" OnClientClick="return confirm('Do you want to delete?')"
                        Text="Delete" CommandArgument='<%#Eval("Id") %>' OnClick="DeleteImage" />
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            
        </Columns>
        <AlternatingRowStyle BackColor="LightGray" />
    </asp:GridView>
    <asp:FileUpload ID="Uploader" runat="server" Height="25px" />
    <br />
    <asp:Label ID="lblFileName" runat="server" Text="What do you want to name your file as?" />
    <asp:TextBox ID="txtFileNameI" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnAdd" runat="server" CommandName="Insert" OnCommand="subAdmin"
        Text="Add" OnClick="cmdUpload_Click" />
        <br />
    <asp:Label ID="lblInfo" runat="server" />
</asp:Content>
